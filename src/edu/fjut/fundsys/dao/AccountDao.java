/**
 * 
 */
package edu.fjut.fundsys.dao;

import java.util.List;

import edu.fjut.fundsys.domain.Client;
import edu.fjut.fundsys.domain.FinancialAccount;

/**
 * @author ÃÔ”Ó
 *
 */
public interface AccountDao {
	
	void addAccount(FinancialAccount account);
	void removeAccount(Integer accNo);
	void frozenAccount(FinancialAccount account);
	FinancialAccount getAccountByNo(Integer accNo);
	List<FinancialAccount> loadAccounts();
	FinancialAccount getAccountByName(String accName);

}
