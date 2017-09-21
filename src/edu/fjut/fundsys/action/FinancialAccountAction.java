/**
 * 
 */
package edu.fjut.fundsys.action;

import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import edu.fjut.fundsys.domain.Client;
import edu.fjut.fundsys.domain.FinancialAccount;
import edu.fjut.fundsys.service.AccountService;
import edu.fjut.fundsys.service.ClientService;

/**
 * @author ����
 *
 */
public class FinancialAccountAction extends BaseAction {
	
	private FinancialAccount account;
	private List<Client> clientList=null;
	private List<FinancialAccount> accountList=null;
	private ClientService clientService;
	private AccountService accountService;
	
	public List<FinancialAccount> getAccountList() {
		return accountList;
	}
	public void setAccountList(List<FinancialAccount> accountList) {
		this.accountList = accountList;
	}
	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public FinancialAccount getAccount() {
		return account;
	}
	public void setAccount(FinancialAccount account) {
		this.account = account;
	}
	public List<Client> getClientList() {
		return clientList;
	}
	public void setClientList(List<Client> clientList) {
		this.clientList = clientList;
	}
	
	public String toInput() throws Exception {
		
		account = new FinancialAccount();
		
		account.setAccCreateDate(new Date());
		account.setAccStatus("F");
		
		clientList = clientService.listClients();
		return "input_page";
	}
	
	public String createAccount() throws Exception{
		
		if(accountService.existAccount(account.getAccName())){
			this.addActionError("�Ѵ��ڴ��˻����ƣ���������ӣ�");
			return "input_page";
		}
		
		accountService.createAccount(account);
		ServletActionContext.getRequest().getSession().setAttribute("ClientAccount", account);

		return "result_action";
	}
	
	public String resultAccount() throws Exception{
		account = (FinancialAccount)ServletActionContext.getRequest().getSession().getAttribute("ClientAccount");
		if(accountService.existAccount(account.getAccName()))
			return "create_success_page";
		
		return "create_error_page";
		
	}

}
