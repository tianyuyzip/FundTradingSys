/**
 * 
 */
package edu.fjut.fundsys.domain;

/**
 * @author ÃÔ”Ó
 *
 */
public class FundHolding {
	
	private Integer  holdId;
	private FinancialAccount financialAccount;
	private Fund     fund;
	
	public Integer getHoldId() {
		return holdId;
	}
	public void setHoldId(Integer holdId) {
		this.holdId = holdId;
	}
	public FinancialAccount getFinancialAccount() {
		return financialAccount;
	}
	public void setFinancialAccount(FinancialAccount financialAccount) {
		this.financialAccount = financialAccount;
	}
	public Fund getFund() {
		return fund;
	}
	public void setFund(Fund fund) {
		this.fund = fund;
	}
}
