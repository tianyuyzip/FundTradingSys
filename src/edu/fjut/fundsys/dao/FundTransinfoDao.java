/**
 * 
 */
package edu.fjut.fundsys.dao;

import java.util.List;

import edu.fjut.fundsys.domain.FinancialAccount;
import edu.fjut.fundsys.domain.FundTransinfo;
import edu.fjut.fundsys.utils.FundTransinfoQueryHelper;


/**
 * @author ÃÔ”Ó
 *
 */
public interface FundTransinfoDao {
	
	void addFundTransInfo(FundTransinfo transinfo);
	List<FundTransinfo> loadTransinfo();
	FinancialAccount getAccountByNo(Integer accNo);
	FundTransinfo getFundTransinfoByNo(Integer fundTransNo);
	List<FundTransinfo> getTransinfoByHelper(FundTransinfoQueryHelper helper);
	void deleteTransinfo(Integer transinfoNo);
}
