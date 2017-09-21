/**
 * 
 */
package edu.fjut.fundsys.action;

import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import edu.fjut.fundsys.domain.AccountTransinfo;
import edu.fjut.fundsys.domain.FinancialAccount;
import edu.fjut.fundsys.exception.AccountException;
import edu.fjut.fundsys.service.AccountService;
import edu.fjut.fundsys.service.AccountTransinfoService;
import edu.fjut.fundsys.utils.SysUtils;

/**
 * @author 田宇
 *
 */
public class AccountTransinfoAction extends BaseAction {
	
	private AccountTransinfo accountTransinfo;
	private AccountTransinfoService accountTransinfoService;
	private AccountService accountService;
	private FinancialAccount account;
	private List<FinancialAccount> accountList;
	private List<AccountTransinfo> accountTransinfoList;
	private String type;

	public List<AccountTransinfo> getAccountTransinfoList() {
		return accountTransinfoList;
	}
	public void setAccountTransinfoList(List<AccountTransinfo> accountTransinfoList) {
		this.accountTransinfoList = accountTransinfoList;
	}
	public List<FinancialAccount> getAccountList() {
		return accountList;
	}
	public void setAccountList(List<FinancialAccount> accountList) {
		this.accountList = accountList;
	}
	public FinancialAccount getAccount() {
		return account;
	}
	public void setAccount(FinancialAccount account) {
		this.account = account;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public AccountTransinfo getAccountTransinfo() {
		return accountTransinfo;
	}
	public void setAccountTransinfo(AccountTransinfo accountTransinfo) {
		this.accountTransinfo = accountTransinfo;
	}
	public void setAccountTransinfoService(
			AccountTransinfoService accountTransinfoService) {
		this.accountTransinfoService = accountTransinfoService;
	}
	
	public String inputPwd() throws Exception{
		return "put_pwd_page";
	}
	
	public String checkPwd() throws Exception{
		String pwd = account.getAccPwd();
		try{
			account = accountService.getAccountByName(account.getAccName());
			if(!account.getAccPwd().equals(pwd)){
				this.addActionError("密码错误，重新输入");
				return "put_pwd_page";
			}
		}catch(AccountException e){
			this.addActionError(e.getMessage());
			return "put_pwd_page";
		  }
		if(account.getAccStatus().equals("F")){
			this.addActionError("账户已被冻结，不可进行任何操作。");
			return "put_pwd_page";
		}
		ServletActionContext.getRequest().getSession().setAttribute("Account",account);
		return "select_function_action";
	}
	
	public String selectType() throws Exception{
		return "select_function_page";
		
	}
	
	public String putMoney() throws Exception{
		return "save_money_page";
	}
	
	public String inputMoney() throws Exception{
		return "withdraw_money_page";
	}
		
	public String saveMoney() throws Exception{	
		accountTransinfo.setTransType("D");
		accountTransinfo.setTransCreateDate(new Date());
		account = (FinancialAccount)ServletActionContext.getRequest().getSession().getAttribute("Account");
		account.setAccAmount(account.getAccAmount()+accountTransinfo.getTransAmount());
		accountService.updateAccount(account);
		accountTransinfo.setAccount(accountService.getAccountByNo(account.getAccNo()));
		accountTransinfoService.createAccountTransinfo(accountTransinfo);
		
		return "excute_success_page";
	}
	
	public String withdrawMoney() throws Exception{	
		accountTransinfo.setTransType("W");
		accountTransinfo.setTransCreateDate(new Date());
		account = (FinancialAccount)ServletActionContext.getRequest().getSession().getAttribute("Account");
		Double amount = account.getAccAmount()-accountTransinfo.getTransAmount();
		if(amount<0){
			this.addActionError("余额不足！");
			return "withdraw_money_page";
		}
		account.setAccAmount(amount);
		accountService.updateAccount(account);
		account = accountService.getAccountByNo(account.getAccNo());
		accountTransinfo.setAccount(account);
		accountTransinfo.setTransAmount(0-accountTransinfo.getTransAmount());
		accountTransinfoService.createAccountTransinfo(accountTransinfo);
		
		return "excute_success_page";
	}
	
	public String selectMoney() throws Exception{	
		account = (FinancialAccount)ServletActionContext.getRequest().getSession().getAttribute("Account");
		
		return "excute_success_page";
	}
	
	public String loadAccounts() throws Exception{
		
		accountList = accountService.loadAccounts();
		
		return "load_account_page";
	}
	
	public String removeAccount() throws Exception{
		
		accountService.deleteAccount(account.getAccNo());
		
		return "load_account_action";
	}
	
	public String preForzen() throws Exception{
		
		account = accountService.getAccountByNo(account.getAccNo());
		
		return "frozen_page";
	}
	
	public String frozenAccount() throws Exception{
		account = accountService.getAccountByNo(account.getAccNo());
		account.setAccStatus("F");
		accountService.updateAccount(account);

		accountTransinfoService.createAccountTransinfo(SysUtils.getAccountTransinfo(account, new Date(), account.getAccStatus(), 0.0));
		
		return "load_account_action";
	}

	public String unfreezeAccount() throws Exception{
		account = accountService.getAccountByNo(account.getAccNo());
		account.setAccStatus("A");
		accountService.updateAccount(account);

		accountTransinfoService.createAccountTransinfo(SysUtils.getAccountTransinfo(account, new Date(), account.getAccStatus(), 0.0));
		return "load_account_action";
	}
	
	public String loadAccountTransinfo() throws Exception{
		
		accountTransinfoList = accountTransinfoService.getFundTransinfoByType(accountTransinfo.getTransType());
		
		return "list_trans_page";
	}

}
