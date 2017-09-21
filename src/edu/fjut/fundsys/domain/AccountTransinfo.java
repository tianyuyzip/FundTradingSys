/**
 * 
 */
package edu.fjut.fundsys.domain;

import java.util.Date;

/**
 * @author ÃÔ”Ó
 *
 */
public class AccountTransinfo extends ValueObject {
	
	private Integer transNo;
	private String  transType;
	private Double  transAmount;
	private FinancialAccount account;
	private Date    transCreateDate;
	private FundTransinfo transinfo;
	
	public Integer getTransNo() {
		return transNo;
	}
	public void setTransNo(Integer transNo) {
		this.transNo = transNo;
	}
	public String getTransType() {
		return transType;
	}
	public void setTransType(String transType) {
		this.transType = transType;
	}
	public Double getTransAmount() {
		return transAmount;
	}
	public void setTransAmount(Double transAmount) {
		this.transAmount = transAmount;
	}
	public FinancialAccount getAccount() {
		return account;
	}
	public void setAccount(FinancialAccount account) {
		this.account = account;
	}
	public Date getTransCreateDate() {
		return transCreateDate;
	}
	public void setTransCreateDate(Date transCreateDate) {
		this.transCreateDate = transCreateDate;
	}
	public FundTransinfo getTransinfo() {
		return transinfo;
	}
	public void setTransinfo(FundTransinfo transinfo) {
		this.transinfo = transinfo;
	}
}
