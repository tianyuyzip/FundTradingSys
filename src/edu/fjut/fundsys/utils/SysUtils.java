/**
 * 
 */
package edu.fjut.fundsys.utils;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.Random;

import edu.fjut.fundsys.domain.AccountTransinfo;
import edu.fjut.fundsys.domain.FinancialAccount;

/**
 * @author ÃÔ”Ó
 *
 */
public class SysUtils {
	
	public static Double getRandomDouble(){
		
		Random rd = new Random();
	    Double number = (rd.nextDouble()-1);
	    DecimalFormat df = new DecimalFormat("0.00");
	    
		return Double.valueOf(df.format(number));
	}
	
	public static AccountTransinfo getAccountTransinfo(FinancialAccount account,Date date,String status,Double number){
		
		AccountTransinfo accountTransinfo = new AccountTransinfo();
		accountTransinfo.setAccount(account);
		accountTransinfo.setTransCreateDate(date);
		accountTransinfo.setTransType(status);
		accountTransinfo.setTransAmount(number);
		
		return accountTransinfo;
	}

}
