/**
 * 
 */
package edu.fjut.fundsys.service;

import java.util.List;

import edu.fjut.fundsys.dao.FundTransinfoDao;
import edu.fjut.fundsys.domain.FinancialAccount;
import edu.fjut.fundsys.domain.FundTransinfo;
import edu.fjut.fundsys.utils.FundTransinfoQueryHelper;

/**
 * @author ÃÔ”Ó
 *
 */
public class FundTransinfoServiceImpl implements FundTransinfoService {
	
	private FundTransinfoDao transinfoDao;

	public void setTransinfoDao(FundTransinfoDao transinfoDao) {
		this.transinfoDao = transinfoDao;
	}

	/* (non-Javadoc)
	 * @see edu.fjut.fundsys.service.FundTransinfoService#createFundTransinfo(edu.fjut.fundsys.domain.FundTransinfo)
	 */
	@Override
	public void createFundTransinfo(FundTransinfo transinfo) {
		transinfoDao.addFundTransInfo(transinfo);
	}

	/* (non-Javadoc)
	 * @see edu.fjut.fundsys.service.FundTransinfoService#loadFundTransinfo()
	 */
	@Override
	public List<FundTransinfo> loadFundTransinfo() {
		return transinfoDao.loadTransinfo();
	}

	@Override
	public FinancialAccount getAccountByNo(Integer accNo) {
		return transinfoDao.getAccountByNo(accNo);
	}

	@Override
	public FundTransinfo getFundTransinfoByNo(Integer fundTransNo) {
		return transinfoDao.getFundTransinfoByNo(fundTransNo);
	}

	@Override
	public List<FundTransinfo> getTransinfoByHelper(FundTransinfoQueryHelper helper) {
		return transinfoDao.getTransinfoByHelper(helper);
	}

	@Override
	public void removeTransinfo(Integer transinfoNo) {
		transinfoDao.deleteTransinfo(transinfoNo);
		
	}

}
