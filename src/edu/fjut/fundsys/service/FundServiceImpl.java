/**
 * 
 */
package edu.fjut.fundsys.service;

import java.util.List;

import edu.fjut.fundsys.dao.FundDao;
import edu.fjut.fundsys.domain.Fund;
import edu.fjut.fundsys.exception.FundException;
import edu.fjut.fundsys.exception.NoFindFundException;
import edu.fjut.fundsys.exception.RepeatFundException;

/**
 * @author ÃÔ”Ó
 *
 */
public class FundServiceImpl implements FundService {
	
	private FundDao fundDao;

	public void setFundDao(FundDao fundDao) {
		this.fundDao = fundDao;
	}

	@Override
	public void createFund(Fund fund) {
		
		this.fundDao.addFund(fund);
	}

	@Override
	public Boolean existFund(String fundName) {
		
		if (this.listFunds().isEmpty())
			return false;

		for (Fund fund : this.listFunds()) {
			if (fund.getFundName().trim().toUpperCase().equals(fundName.trim().toUpperCase()))
				return true;
		}
		return false;
	}

	@Override
	public List<Fund> listFunds() {
		return fundDao.loadFunds();
	}

	@Override
	public void deleteFund(Integer fundNo) {
		fundDao.removeFund(fundNo);
		
	}

	@Override
	public void updateFund(Fund fund) {
		fundDao.update(fund);
		
	}

	@Override
	public Fund getFundByNo(Integer fundNo) {
		return fundDao.getFundByNo(fundNo);
	}

}
