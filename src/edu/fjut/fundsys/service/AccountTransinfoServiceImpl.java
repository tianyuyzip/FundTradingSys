/**
 * 
 */
package edu.fjut.fundsys.service;

import java.util.List;

import edu.fjut.fundsys.dao.AccountTransinfoDao;
import edu.fjut.fundsys.domain.AccountTransinfo;

/**
 * @author ÃÔ”Ó
 *
 */
public class AccountTransinfoServiceImpl implements AccountTransinfoService {
	
	private AccountTransinfoDao accountTransinfoDao;

	public void setAccountTransinfoDao(AccountTransinfoDao accountTransinfoDao) {
		this.accountTransinfoDao = accountTransinfoDao;
	}

	/* (non-Javadoc)
	 * @see edu.fjut.fundsys.service.AccountTransinfoService#createAccountTransinfo(edu.fjut.fundsys.dao.AccountTransinfoDao)
	 */
	@Override
	public void createAccountTransinfo(AccountTransinfo accountTransinfo) {
		accountTransinfoDao.addAccountTransinfo(accountTransinfo);
	}

	/* (non-Javadoc)
	 * @see edu.fjut.fundsys.service.AccountTransinfoService#listAccountTransinfo()
	 */
	@Override
	public List<AccountTransinfo> listAccountTransinfo() {
		return accountTransinfoDao.loadAccountTransinfo();
	}

	@Override
	public void updateAccountTransinfo(AccountTransinfoDao accountTransinfo) {
		accountTransinfoDao.updateAccountTransinfo(accountTransinfo);
		
	}

	@Override
	public List<AccountTransinfo> getFundTransinfoByType(String transType) {
		return accountTransinfoDao.getFundTransinfoByType(transType);
	}

}
