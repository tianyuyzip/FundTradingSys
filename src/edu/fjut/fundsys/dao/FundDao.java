/**
 * 
 */
package edu.fjut.fundsys.dao;

import java.util.List;

import edu.fjut.fundsys.domain.Fund;

/**
 * @author ÃÔ”Ó
 *
 */
public interface FundDao {
	
	void addFund(Fund fund);
	Fund getFundByNo(Integer fundNo);
	List<Fund> loadFunds();
	void removeFund(Integer fundNo);
	void update(Fund fund);

}
