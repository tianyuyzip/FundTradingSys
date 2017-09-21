/**
 * 
 */
package edu.fjut.fundsys.domain;

import java.util.Date;

/**
 * @author ÃÔ”Ó
 *
 */
public class FundTransinfo {
	
	private Integer  fundTransNo;
	private String   fundTransType;
	private FinancialAccount account;
	private Fund     fund;
	private Integer   fundTransAmount;
	private Double   fundTransPrice;
	private Date     fundTransCreateDate;
	

	public Integer getFundTransNo() {
		return fundTransNo;
	}
	public void setFundTransNo(Integer fundTransNo) {
		this.fundTransNo = fundTransNo;
	}
	public String getFundTransType() {
		return fundTransType;
	}
	public void setFundTransType(String fundTransType) {
		this.fundTransType = fundTransType;
	}
	public FinancialAccount getAccount() {
		return account;
	}
	public void setAccount(FinancialAccount account) {
		this.account = account;
	}
	public Fund getFund() {
		return fund;
	}
	public void setFund(Fund fund) {
		this.fund = fund;
	}
	public Integer getFundTransAmount() {
		return fundTransAmount;
	}
	public void setFundTransAmount(Integer fundTransAmount) {
		this.fundTransAmount = fundTransAmount;
	}
	public Double getFundTransPrice() {
		return fundTransPrice;
	}
	public void setFundTransPrice(Double fundTransPrice) {
		this.fundTransPrice = fundTransPrice;
	}
	public Date getFundTransCreateDate() {
		return fundTransCreateDate;
	}
	public void setFundTransCreateDate(Date fundTransCreateDate) {
		this.fundTransCreateDate = fundTransCreateDate;
	}
}
