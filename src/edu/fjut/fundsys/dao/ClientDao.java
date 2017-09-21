/**
 * 
 */
package edu.fjut.fundsys.dao;

import java.util.List;

import edu.fjut.fundsys.domain.Client;

/**
 * @author ÃÔ”Ó
 *
 */
public interface ClientDao {
	
	void addClient(Client client);
	Client getClientByNo(String idCardNo);
	List<Client> loadClients();
	void removeClient(String idCardNo);
	void update(Client client);

}
