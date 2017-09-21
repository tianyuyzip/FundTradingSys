/**
 * 
 */
package edu.fjut.fundsys.service;

import java.util.List;

import edu.fjut.fundsys.domain.Client;


/**
 * @author ÃÔ”Ó
 *
 */
public interface ClientService {
	
	void createClient(Client client);
	Client getClientByNo(String idCardNo);
	List<Client> listClients();
	void deleteClient(String idCardNo);
	void updateClient(Client client);
	Boolean existClient(String idCardNo);

}
