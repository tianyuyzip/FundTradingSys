/**
 * 
 */
package edu.fjut.fundsys.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import edu.fjut.fundsys.domain.AccountTransinfo;
import edu.fjut.fundsys.domain.FundTransinfo;
import edu.fjut.fundsys.exception.AccountException;

/**
 * @author 田宇
 *
 */
public class AccountTransinfoDaoHibernateImpl extends HibernateDaoSupport implements AccountTransinfoDao {

	/* (non-Javadoc)
	 * @see edu.fjut.fundsys.dao.AccountTransinfoDao#addAccountTransinfo(edu.fjut.fundsys.dao.AccountTransinfoDao)
	 */
	@Override
	public void addAccountTransinfo(AccountTransinfo accountTransinfo) {
		this.getHibernateTemplate().save(accountTransinfo);
	}

	/* (non-Javadoc)
	 * @see edu.fjut.fundsys.dao.AccountTransinfoDao#accountTransinfoList()
	 */
	@Override
	public List<AccountTransinfo> loadAccountTransinfo() {
		return this.getHibernateTemplate().find("from AccountTransinfo a order by a.tranNo desc");
	}

	@Override
	public void updateAccountTransinfo(AccountTransinfoDao accountTransinfo) {
		this.getHibernateTemplate().update(accountTransinfo);
	}

	@Override
	public List<AccountTransinfo> getFundTransinfoByType(String transType) {
		String hql = "from AccountTransinfo a where a.transType=? ";
		List<AccountTransinfo> transList = this.getHibernateTemplate().find(hql,transType);
		if(transList.size()==0)
			throw new AccountException("没有此类型的交易记录");
		
		return transList;
	}

}
