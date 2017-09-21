/**
 * 
 */
package edu.fjut.fundsys.service;

import java.util.List;

import edu.fjut.fundsys.dao.ClientDao;
import edu.fjut.fundsys.domain.Client;

/**
 * @author ÃÔ”Ó
 *
 */
public class ClientServiceImpl implements ClientService {
	
	private ClientDao clientDao;

	public void setClientDao(ClientDao clientDao) {
		this.clientDao = clientDao;
	}

	/* (non-Javadoc)
	 * @see edu.fjut.fundsys.service.ClientService#createClient(edu.fjut.fundsys.domain.Client)
	 */
	@Override
	public void createClient(Client client) {
		clientDao.addClient(client);

	}

	/* (non-Javadoc)
	 * @see edu.fjut.fundsys.service.ClientService#getClientByNo(java.lang.Integer)
	 */
	@Override
	public Client getClientByNo(String idCardNo) {
		return clientDao.getClientByNo(idCardNo);
	}

	/* (non-Javadoc)
	 * @see edu.fjut.fundsys.service.ClientService#listClients()
	 */
	@Override
	public List<Client> listClients() {
		return clientDao.loadClients();
	}

	/* (non-Javadoc)
	 * @see edu.fjut.fundsys.service.ClientService#deleteClient(java.lang.Integer)
	 */
	@Override
	public void deleteClient(String idCardNo) {
		clientDao.removeClient(idCardNo);

	}

	/* (non-Javadoc)
	 * @see edu.fjut.fundsys.service.ClientService#updateClient(edu.fjut.fundsys.domain.Client)
	 */
	@Override
	public void updateClient(Client client) {
		clientDao.update(client);
	}

	@Override
	public Boolean existClient(String idCardNo) {
		
		if(clientDao.loadClients().isEmpty()){
			return false;
		}
		
		for(Client client:clientDao.loadClients()){
			if(client.getIdCardNo().trim().toUpperCase().equals(idCardNo.trim().toUpperCase()))
				return true;
		}
		
		return false;
		
	}

}
