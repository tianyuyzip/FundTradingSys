/**
 * 
 */
package edu.fjut.fundsys.dao;

import java.util.List;

import edu.fjut.fundsys.domain.AccountTransinfo;
import edu.fjut.fundsys.domain.FundTransinfo;

/**
 * @author ÃÔ”Ó
 *
 */
public interface AccountTransinfoDao {
	
	void addAccountTransinfo(AccountTransinfo accountTransinfo);
    List<AccountTransinfo> loadAccountTransinfo();
    void updateAccountTransinfo(AccountTransinfoDao accountTransinfo);
    List<AccountTransinfo> getFundTransinfoByType(String transType);
    
}
