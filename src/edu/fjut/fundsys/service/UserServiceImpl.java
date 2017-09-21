/**
 * 
 */
package edu.fjut.fundsys.service;

import edu.fjut.fundsys.dao.UserDao;
import edu.fjut.fundsys.domain.User;
import edu.fjut.fundsys.exception.ApplicationException;

/**
 * @author joeyang ong
 *
 */
public class UserServiceImpl implements UserService {
	
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/* (non-Javadoc)
	 * @see edu.fjut.hotelsys.service.UserService#checkUser(java.lang.String, java.lang.String)
	 */
	@Override
	public User checkUser(String userNo, String userPwd) {
		
		User user = userDao.getUserByNo(userNo);
		
		if(!user.getUserPwd().equals(userPwd))
			throw new ApplicationException("�û����ڣ��������벻��ȷ!");
		
		return user;
	}

}
