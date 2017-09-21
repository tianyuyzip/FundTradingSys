/**
 * 
 */
package edu.fjut.fundsys.service;

import java.util.List;

import edu.fjut.fundsys.dao.AccountDao;
import edu.fjut.fundsys.domain.Client;
import edu.fjut.fundsys.domain.FinancialAccount;
import edu.fjut.fundsys.exception.AccountException;

/**
 * @author ÃÔ”Ó
 *
 */
public class AccountServiceImpl implements AccountService {
	
	private AccountDao accountDao;

	public void setAccountDao(AccountDao accountDao) {
		this.accountDao = accountDao;
	}

	@Override
	public void createAccount(FinancialAccount account) {
		accountDao.addAccount(account);
		
	}

	@Override
	public FinancialAccount getAccountByNo(Integer accNo) {
		return accountDao.getAccountByNo(accNo);
	}

	@Override
	public Boolean existAccount(String accName) {
		
		for(FinancialAccount account:this.loadAccounts())
			if(accName.equals(account.getAccName()))
				return true;
		
		return false;
	}

	@Override
	public List<FinancialAccount> loadAccounts() {
		return accountDao.loadAccounts();
	}

	@Override
	public FinancialAccount getAccountByName(String accName) {
		return accountDao.getAccountByName(accName);
	}

	@Override
	public void deleteAccount(Integer accNo) {
		accountDao.removeAccount(accNo);
	}

	@Override
	public void frozenAccount(FinancialAccount account) {
		accountDao.frozenAccount(account);
	}

	@Override
	public void updateAccount(FinancialAccount account) {
		this.frozenAccount(account);
	}

}
