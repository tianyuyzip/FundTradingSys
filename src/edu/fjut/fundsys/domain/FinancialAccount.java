/**
 * 
 */
package edu.fjut.fundsys.domain;

import java.util.Date;

/**
 * @author ÃÔ”Ó
 *
 */
public class FinancialAccount extends ValueObject {
	
	private Integer   accNo;
	private String   accName;
	private String   accPwd;
	private Double   accAmount=0.0;
	private String   accStatus;
	private Client   client;
	private Date     accCreateDate;
	
	public String getAccName() {
		return accName;
	}
	public void setAccName(String accName) {
		this.accName = accName;
	}
	public Integer getAccNo() {
		return accNo;
	}
	public void setAccNo(Integer accNo) {
		this.accNo = accNo;
	}
	public String getAccPwd() {
		return accPwd;
	}
	public void setAccPwd(String accPwd) {
		this.accPwd = accPwd;
	}
	public Double getAccAmount() {
		return accAmount;
	}
	public void setAccAmount(Double accAmount) {
		this.accAmount = accAmount;
	}
	public String getAccStatus() {
		return accStatus;
	}
	public void setAccStatus(String accStatus) {
		this.accStatus = accStatus;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public Date getAccCreateDate() {
		return accCreateDate;
	}
	public void setAccCreateDate(Date accCreateDate) {
		this.accCreateDate = accCreateDate;
	}

}
