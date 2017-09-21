/**
 * 
 */
package edu.fjut.fundsys.domain;

import java.util.Date;

/**
 * @author ÃÔ”Ó
 *
 */
public class Fund extends ValueObject {
	
	private Integer fundNo;
	private String  fundName;
	private Double  fundPrice;
	private String  fundDescription;
	private String  fundStatus;
	private Date  fundCreateDate;
	
	public Integer getFundNo() {
		return fundNo;
	}
	public void setFundNo(Integer fundNo) {
		this.fundNo = fundNo;
	}
	public String getFundName() {
		return fundName;
	}
	public void setFundName(String fundName) {
		this.fundName = fundName;
	}
	public Double getFundPrice() {
		return fundPrice;
	}
	public void setFundPrice(Double fundPrice) {
		this.fundPrice = fundPrice;
	}
	public String getFundDescription() {
		return fundDescription;
	}
	public void setFundDescription(String fundDescription) {
		this.fundDescription = fundDescription;
	}
	public String getFundStatus() {
		return fundStatus;
	}
	public void setFundStatus(String fundStatus) {
		this.fundStatus = fundStatus;
	}
	public Date getFundCreateDate() {
		return fundCreateDate;
	}
	public void setFundCreateDate(Date fundCreateDate) {
		this.fundCreateDate = fundCreateDate;
	}


}
