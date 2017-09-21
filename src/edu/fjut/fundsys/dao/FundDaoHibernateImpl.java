/**
 * 
 */
package edu.fjut.fundsys.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import edu.fjut.fundsys.domain.Fund;
import edu.fjut.fundsys.exception.FundException;
import edu.fjut.fundsys.exception.NoFindFundException;

/**
 * @author 田宇
 *
 */
public class FundDaoHibernateImpl extends HibernateDaoSupport implements FundDao {

	@Override
	public void addFund(Fund fund) {
		
		this.getHibernateTemplate().save(fund);
	}

	@Override
	public Fund getFundByNo(Integer fundNo) {
		
//		Session session =  this.getSession();
//		Transaction trans = session.beginTransaction();
//		
//		String sql = "from Fund f where f.fundName=?";
//		Query query=session.createQuery(sql);
//		query.setString(0, fundName);
//		Fund fund = (Fund)query.uniqueResult();
//		trans.commit();
//		
//		
//		if(fund==null)
//			throw new NoFindFundException("没有此基金产品！");
//		
//		if(session.isOpen())
//			session.close();
		Fund fund = (Fund)this.getHibernateTemplate().get(Fund.class, fundNo);
		
		return fund;
	}

	@Override
	public List<Fund> loadFunds() {
		return this.getHibernateTemplate().find("from Fund f  order by f.fundNo desc");
	}

	@Override
	public void removeFund(Integer fundNo) {
		Fund fund = (Fund)this.getHibernateTemplate().load(Fund.class, fundNo);
		this.getHibernateTemplate().delete(fund);
	}

	@Override
	public void update(Fund fund) {
		this.getHibernateTemplate().update(fund);
		
	}
	
	

}
