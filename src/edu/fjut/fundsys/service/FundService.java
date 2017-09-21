/**
 * 
 */
package edu.fjut.fundsys.service;

import java.util.List;

import edu.fjut.fundsys.domain.Fund;

/**
 * @author ÃÔ”Ó
 *
 */
public interface FundService {
	
	void createFund(Fund fund);
	Boolean existFund(String fundName);
	Fund getFundByNo(Integer fundNo);
	List<Fund> listFunds();
	void deleteFund(Integer fundNo);
	void updateFund(Fund fund);

}
