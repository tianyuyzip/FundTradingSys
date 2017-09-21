/**
 * 
 */
package edu.fjut.fundsys.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import edu.fjut.fundsys.domain.Client;
import edu.fjut.fundsys.exception.ClientException;

/**
 * @author 田宇
 *
 */
public class ClientDaoHibernateImpl extends HibernateDaoSupport implements ClientDao {

	@Override
	public void addClient(Client client) {
		this.getHibernateTemplate().save(client);
		
	}

	@Override
	public Client getClientByNo(String idCardNo) {
		Client client = (Client)this.getHibernateTemplate().get(Client.class, idCardNo);
		
		if(client==null)
			throw new ClientException("没有此客户信息！");
		
		return client;
	}

	@Override
	public List<Client> loadClients() {
		return this.getHibernateTemplate().find("from Client c order by c.idCardNo desc");
	}

	@Override
	public void removeClient(String idCardNo) {
		Client client = (Client)this.getHibernateTemplate().load(Client.class, idCardNo);
		this.getHibernateTemplate().delete(client);
	}

	@Override
	public void update(Client client) {
		this.getHibernateTemplate().update(client);
		
	}
	
	

}
