/**
 * 
 */
package edu.fjut.fundsys.service;

import edu.fjut.fundsys.domain.User;


/**
 * @author joeyang ong
 *
 */
public interface UserService {
	
	User checkUser(String userNo, String userPwd);

}
