/**
 * 
 */
package edu.fjut.fundsys.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import edu.fjut.fundsys.domain.Fund;
import edu.fjut.fundsys.service.FundService;

/**
 * @author 田宇
 *
 */
public class FundAction extends BaseAction {
	
	private Fund fund;
	private FundService fundService;
	private List<Fund> fundList;
	
	public List<Fund> getFundList() {
		return fundList;
	}

	public void setFundList(List<Fund> fundList) {
		this.fundList = fundList;
	}

	public void setFundService(FundService fundService) {
		this.fundService = fundService;
	}

	public Fund getFund() {
		return fund;
	}

	public void setFund(Fund fund) {
		this.fund = fund;
	}

	public String toInput() throws Exception {
		
		fund = new Fund();
	
		fund.setFundStatus("N");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String temp = sdf.format(date);
		fund.setFundCreateDate(sdf.parse(temp));
		return "input_page";
	}
	
	public String createFund() throws Exception{
		
		if(fundService.existFund(fund.getFundName())){
			this.addActionError("已存在此基金产品，请重新添加！");
			return "input_page";
		}
		fundService.createFund(fund);

		return "load_action";
	}
	
	public String loadFunds() throws Exception{
		fundList = fundService.listFunds();
		return "load_page";
	}
	
	public String preUpdate() throws Exception{
		fund = fundService.getFundByNo(fund.getFundNo());
		
		return "update_page";
	}
	
	public String updateFund() throws Exception{
		fundService.updateFund(fund);
		
		return "load_action";
	}
	
	public String removeFund() throws Exception{
		fundService.deleteFund(fund.getFundNo());
		
		return "load_action";
	}
	
	

}
