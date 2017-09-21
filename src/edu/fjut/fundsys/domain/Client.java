/**
 * 
 */
package edu.fjut.fundsys.domain;

import java.util.Date;

/**
 * @author ÃÔ”Ó
 *
 */
public class Client extends ValueObject {
	
	private String  idCardNo;
	private String  clientName;
	private String  clientSex;
	private String  clientPhone;
	private String  clientAddress;
	private String  clientEmail;
	private String  clientHobby;
	private Date 	clientCreateDate;
	
	public String getIdCardNo() {
		return idCardNo;
	}
	public void setIdCardNo(String idCardNo) {
		this.idCardNo = idCardNo;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getClientSex() {
		return clientSex;
	}
	public void setClientSex(String clientSex) {
		this.clientSex = clientSex;
	}
	public String getClientPhone() {
		return clientPhone;
	}
	public void setClientPhone(String clientPhone) {
		this.clientPhone = clientPhone;
	}
	public String getClientAddress() {
		return clientAddress;
	}
	public void setClientAddress(String clientAddress) {
		this.clientAddress = clientAddress;
	}
	public String getClientEmail() {
		return clientEmail;
	}
	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}
	public String getClientHobby() {
		return clientHobby;
	}
	public void setClientHobby(String clientHobby) {
		this.clientHobby = clientHobby;
	}
	public Date getClientCreateDate() {
		return clientCreateDate;
	}
	public void setClientCreateDate(Date clientCreateDate) {
		this.clientCreateDate = clientCreateDate;
	}

}
