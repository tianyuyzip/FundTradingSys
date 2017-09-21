/**
 * 
 */
package edu.fjut.fundsys.service;

import java.util.List;

import edu.fjut.fundsys.domain.Client;
import edu.fjut.fundsys.domain.FinancialAccount;

/**
 * @author ÃÔ”Ó
 *
 */
public interface AccountService {
	
	void createAccount(FinancialAccount account);
	FinancialAccount getAccountByNo(Integer accNo);
	void deleteAccount(Integer accNo);
	void frozenAccount(FinancialAccount account);
	void updateAccount(FinancialAccount account);
	Boolean existAccount(String accName);
	List<FinancialAccount> loadAccounts();
	FinancialAccount getAccountByName(String accName);

}
