/**
 * 
 */
package edu.fjut.fundsys.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import edu.fjut.fundsys.domain.Client;
import edu.fjut.fundsys.domain.FinancialAccount;
import edu.fjut.fundsys.exception.AccountException;

/**
 * @author 田宇
 *
 */
public class AccountDaoHibernateImpl extends HibernateDaoSupport implements AccountDao {

	@Override
	public void addAccount(FinancialAccount account) {
		this.getHibernateTemplate().save(account);
		
	}

	@Override
	public FinancialAccount getAccountByNo(Integer accNo) {
		
		FinancialAccount account = (FinancialAccount)this.getHibernateTemplate().get(FinancialAccount.class, accNo);
		if(account==null)
			throw new AccountException("没有找到该账户");
		
		return account;
	}

	@Override
	public List<FinancialAccount> loadAccounts() {
		return this.getHibernateTemplate().find("from FinancialAccount f order by f.accNo desc");
	}

	@Override
	public FinancialAccount getAccountByName(String accName) {
		String hql = "from FinancialAccount f where f.accName = ?";
		List<FinancialAccount> list = this.getHibernateTemplate().find(hql,accName);
		if(list.size()>0)
			return list.get(0);
		
		throw new AccountException("没找到该用户");
	}

	@Override
	public void removeAccount(Integer accNo) {
		FinancialAccount account = (FinancialAccount)this.getHibernateTemplate().load(FinancialAccount.class, accNo);
		this.getHibernateTemplate().delete(account);
	}

	@Override
	public void frozenAccount(FinancialAccount account) {
		this.getHibernateTemplate().update(account);
	}
	

}
