/**
 * 
 */
package edu.fjut.fundsys.action;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import edu.fjut.fundsys.domain.AccountTransinfo;
import edu.fjut.fundsys.domain.Client;
import edu.fjut.fundsys.domain.FinancialAccount;
import edu.fjut.fundsys.domain.Fund;
import edu.fjut.fundsys.domain.FundTransinfo;
import edu.fjut.fundsys.exception.AccountException;
import edu.fjut.fundsys.service.AccountService;
import edu.fjut.fundsys.service.FundService;
import edu.fjut.fundsys.service.FundTransinfoService;
import edu.fjut.fundsys.utils.FundTransinfoQueryHelper;
import edu.fjut.fundsys.utils.SysUtils;

/**
 * @author 田宇
 * 
 */
public class TransinfoAction extends BaseAction {

	private FundTransinfo transinfo;
	private List<FundTransinfo> transinfoList;
	private List<Fund> fundList;
	private FundService fundService;
	private FundTransinfoService transinfoService;
	private AccountService accountService;
	private String pwd;
	private FundTransinfoQueryHelper helper = new FundTransinfoQueryHelper();

	public FundTransinfoQueryHelper getHelper() {
		return helper;
	}

	public void setHelper(FundTransinfoQueryHelper helper) {
		this.helper = helper;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	public FundTransinfo getTransinfo() {
		return transinfo;
	}

	public void setTransinfo(FundTransinfo transinfo) {
		this.transinfo = transinfo;
	}

	public List<FundTransinfo> getTransinfoList() {
		return transinfoList;
	}

	public void setTransinfoList(List<FundTransinfo> transinfoList) {
		this.transinfoList = transinfoList;
	}

	public List<Fund> getFundList() {
		return fundList;
	}

	public void setFundService(FundService fundService) {
		this.fundService = fundService;
	}

	public void setFundList(List<Fund> fundList) {
		this.fundList = fundList;
	}

	public void setTransinfoService(FundTransinfoService transinfoService) {
		this.transinfoService = transinfoService;
	}

	public String toInput() throws Exception {

		transinfo = new FundTransinfo();
		transinfo.setFundTransCreateDate(new Date());
		transinfo.setFundTransType("B");

		fundList = fundService.listFunds();

		return "input_page";
	}

	public String findByName() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		Client client = null;
		try {
			client = accountService.getAccountByName(
					transinfo.getAccount().getAccName()).getClient();
		} catch (AccountException e) {
			response.getWriter().println("<font color='red'>不存在此用户信息</font>");
			return NONE;
		}
		response.getWriter().println(
				"[" + client.getClientName() + "  " + client.getIdCardNo()
						+ "]");

		return NONE;
	}

	public String getPrice() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		Double nativePrice = fundService.getFundByNo(
				transinfo.getFund().getFundNo()).getFundPrice();

		response.getWriter().println(SysUtils.getRandomDouble() + nativePrice);

		return NONE;
	}

	public String inputPwd() throws Exception {

		ServletActionContext.getRequest().getSession()
				.setAttribute("Transinfo", transinfo);

		return "check_page";
	}

	public String checkAccountPwd() throws Exception {
		transinfo = (FundTransinfo) ServletActionContext.getRequest()
				.getSession().getAttribute("Transinfo");
		FinancialAccount account = accountService.getAccountByName(transinfo
				.getAccount().getAccName());
		if (!account.getAccPwd().equals(pwd)) {
			this.addActionError("密码输入错误，请重新输入");
			return "check_page";
		}

		return "create_action";
	}

	public String createTransinfo() throws Exception {

		transinfo = (FundTransinfo) ServletActionContext.getRequest()
				.getSession().getAttribute("Transinfo");
		FinancialAccount account = accountService.getAccountByName(transinfo
				.getAccount().getAccName());
		transinfo.setAccount(account);

		if (!account.getAccStatus().equals("A")) {
			this.addActionError("账户已冻结，暂时不可以进行基金交易。");
			return "input_page";
		}

		AccountTransinfo accountTransinfo =null;
		if (transinfo.getFundTransType().equals("B")) {
			Double amount = transinfo.getAccount().getAccAmount();
			Double totle = transinfo.getFundTransAmount()
					* transinfo.getFundTransPrice();
			if (totle > amount) {
				this.addActionError("余额不足，请充值。");
				return "input_page";
			}

			account.setAccAmount((amount - totle) * 0.99);
			accountService.updateAccount(account);
			 accountTransinfo = SysUtils.getAccountTransinfo(account, new Date(), transinfo.getFundTransType(), -totle);
		} else {
			helper.setQryAccNo(transinfo.getAccount().getAccNo());
			helper.setQryFundNo(transinfo.getFund().getFundNo());
			transinfoList = transinfoService.getTransinfoByHelper(helper);
			Integer amount = 0;
			
			if(transinfoList.size()==0){
				this.addActionError("您没有购买过此基金");
				return "input_page";
			}
			for(FundTransinfo transinfo:transinfoList){
				amount = amount+transinfo.getFundTransAmount();
			}
			if (transinfo.getFundTransAmount() > amount) {
				this.addActionError("赎回数量超过限制。");
				return "input_page";
			}
			Double totle = transinfo.getFundTransAmount()
					* transinfo.getFundTransPrice()+transinfo.getAccount().getAccAmount();
			account.setAccAmount(totle*0.99);
			accountService.updateAccount(account);
			 accountTransinfo = SysUtils.getAccountTransinfo(account, new Date(), transinfo.getFundTransType(), totle);
		}
		accountTransinfo.setTransinfo(transinfo);
		transinfoService.createFundTransinfo(transinfo);

		return "excute_fund_page";
	}
	
	public String loadTransinfos() throws Exception{
		transinfoList = transinfoService.loadFundTransinfo();
		return "load_page";
	}
	
	public String removeTransinfo() throws Exception{
		transinfoService.removeTransinfo(transinfo.getFundTransNo());
		
		return "load_action";
	}

}
