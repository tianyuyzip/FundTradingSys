/**
 * 
 */
package edu.fjut.fundsys.action;

import java.util.Date;
import java.util.List;

import edu.fjut.fundsys.domain.Client;
import edu.fjut.fundsys.domain.FinancialAccount;
import edu.fjut.fundsys.exception.ClientException;
import edu.fjut.fundsys.service.AccountService;
import edu.fjut.fundsys.service.ClientService;

/**
 * @author 田宇
 *
 */
public class ClientAction extends BaseAction {
	
	private Client client;
	private AccountService accountService;
	private List<Client> clientList;
	private ClientService clientService;

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public List<Client> getClientList() {
		return clientList;
	}

	public void setClientList(List<Client> clientList) {
		this.clientList = clientList;
	} 
	
	public String toInput() throws Exception {
		
		client = new Client();
	
		client.setClientSex("M");
		client.setClientCreateDate(new Date());
		return "input_page";
	}
	
	public String createClient() throws Exception{
		
		if(clientService.existClient(client.getIdCardNo())){
			this.addActionError("已存在此客户信息，请重新添加！");
			return "input_page";
		}
		clientService.createClient(client);

		return "load_action";
	}
	
	public String loadClients() throws Exception{
		clientList = clientService.listClients();
		return "load_page";
	}
	
	public String preUpdate() throws Exception{
		client = clientService.getClientByNo(client.getIdCardNo());
		
		return "update_page";
	}
	
	public String updateClient() throws Exception{
		clientService.updateClient(client);
		
		return "load_action";
	}
	
	public String removeClient() throws Exception{
		clientService.deleteClient(client.getIdCardNo());
		
		return "load_action";
	}
	
	public String inputIdCardNo() throws Exception{
		
		return "toinput_id_page";
	}
	
	public String serchClient() throws Exception{
		try{
			client = clientService.getClientByNo(client.getIdCardNo());
		}catch(ClientException e){
			this.addActionError(e.getMessage());
			return "toinput_id_page";
		}
		Double totle = 0.0;
		for(FinancialAccount account :accountService.loadAccounts()){
			if(account.getClient().getIdCardNo().equals(client.getIdCardNo())){
				totle = totle+account.getAccAmount();
			}
		}
		
		return "get_client_page";
	}

}
