/**
 * 
 */
package edu.fjut.fundsys.dao;

import edu.fjut.fundsys.domain.User;


/**
 * @author joeyang ong
 *
 */
public interface UserDao {

	User getUserByNo(String userNo);
	
}
