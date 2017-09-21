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
public interface AccountTransinfoService {
	
	void createAccountTransinfo(AccountTransinfo accountTransinfo);
    List<AccountTransinfo> listAccountTransinfo();
    void updateAccountTransinfo(AccountTransinfoDao accountTransinfo);
    List<AccountTransinfo> getFundTransinfoByType(String transType);
}
