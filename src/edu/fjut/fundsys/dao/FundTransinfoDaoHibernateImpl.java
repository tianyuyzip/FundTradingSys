/**
 * 
 */
package edu.fjut.fundsys.dao;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import edu.fjut.fundsys.domain.FinancialAccount;
import edu.fjut.fundsys.domain.FundTransinfo;
import edu.fjut.fundsys.utils.FundTransinfoQueryHelper;

/**
 * @author ÃÔ”Ó
 *
 */
public class FundTransinfoDaoHibernateImpl extends HibernateDaoSupport implements FundTransinfoDao {


	/* (non-Javadoc)
	 * @see edu.fjut.fundsys.dao.FundTransinfoDao#createFundTransInfo(edu.fjut.fundsys.domain.FundTransinfo)
	 */
	@Override
	public void addFundTransInfo(FundTransinfo transinfo) {
		this.getHibernateTemplate().save(transinfo);

	}

	/* (non-Javadoc)
	 * @see edu.fjut.fundsys.dao.FundTransinfoDao#loadTransinfo()
	 */
	@Override
	public List<FundTransinfo> loadTransinfo() {
		return this.getHibernateTemplate().find("from FundTransinfo f order by f.fundTransNo");
	}

	@Override
	public FinancialAccount getAccountByNo(Integer accNo) {
		return (FinancialAccount)this.getHibernateTemplate().get(FinancialAccount.class, accNo);
	}

	@Override
	public FundTransinfo getFundTransinfoByNo(Integer fundTransNo) {
		return (FundTransinfo)this.getHibernateTemplate().get(FundTransinfo.class, fundTransNo);
	}

	private DetachedCriteria genCriteiraByHelper(FundTransinfoQueryHelper helper){
		
		DetachedCriteria criteria = DetachedCriteria.forClass(FundTransinfo.class);
		
		if(StringUtils.isNotEmpty(helper.getQryType())){
			criteria.add(Restrictions.gt("fundTransType", helper.getQryType()));
		}
		
		if(helper.getQryAccNo()!=null){
			criteria.createCriteria("account").add(Restrictions.eq("accNo", helper.getQryAccNo()));
		}
		
		if(helper.getQryFundNo()!=null){
			criteria.createCriteria("fund").add(Restrictions.eq("fundNo", helper.getQryFundNo())); //sub criteria
		}
		
		/*criteria.addOrder(Order.asc("roomId"));*/
		
		return criteria;
		
	}

	@Override
	public List<FundTransinfo> getTransinfoByHelper(FundTransinfoQueryHelper helper) {
		
		Session session = this.getSession();
		Transaction trans = session.beginTransaction();
		List<FundTransinfo> fundTransinfoList = null;
		
		try{
			DetachedCriteria detachedCriteria = this.genCriteiraByHelper(helper);
			Criteria criteria = detachedCriteria.getExecutableCriteria(session);
			fundTransinfoList = criteria.list();
			trans.commit();
		}catch(HibernateException e){
			e.printStackTrace();
			trans.rollback();
		}finally{
			if(session.isOpen())
				session.close();
		}	
		
		return fundTransinfoList;
	}

	@Override
	public void deleteTransinfo(Integer transinfoNo) {
		FundTransinfo transinfo = (FundTransinfo)this.getHibernateTemplate().load(FundTransinfo.class,transinfoNo);
		this.getHibernateTemplate().delete(transinfo);
	}


}
