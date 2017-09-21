/**
 * 
 */
package edu.fjut.fundsys.service;

import java.util.List;

import edu.fjut.fundsys.domain.FinancialAccount;
import edu.fjut.fundsys.domain.FundTransinfo;
import edu.fjut.fundsys.utils.FundTransinfoQueryHelper;

/**
 * @author ÃÔ”Ó
 *
 */
public interface FundTransinfoService {
	
	void createFundTransinfo(FundTransinfo transinfo);
	List<FundTransinfo> loadFundTransinfo();
	FinancialAccount getAccountByNo(Integer accNo);
	FundTransinfo getFundTransinfoByNo(Integer fundTransNo);
	List<FundTransinfo> getTransinfoByHelper(FundTransinfoQueryHelper helper);
	void removeTransinfo(Integer transinfoNo);
}
