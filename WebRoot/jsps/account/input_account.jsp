<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>添加新账户</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		var regu = "^[ ]+$";
		var re = new RegExp(regu);
		
		$("#name").blur( function() {		
			var strid = $('#name').val().trim();
			if ( strid == ""||re.test(strid)) {
				$("#nameAlert").css("color","red");
				nameAlert.innerHTML = "*账户名不能为空！";
				document.myform.name.focus();
				}else{
				$("#nameAlert").hide();}
			});
});		

		var regu1="^[0-9]{6}$";
		var re1 = new RegExp(regu1);
		function checkpwd(){
			var userpwd = $('#pwd').val().trim();
			if(!re1.test(userpwd)){
				$("#pwAlert").css("color","red");
				pwAlert.innerHTML = "*密码必须为6位数字"; 
				document.myform.pwd.focus(); 
			}else{
				$("#pwAlert").hide();}
		}
		
		function checkrepwd (){
			var userrepwd = $('#repwd').val().trim();
			var userpwd = $('#pwd').val().trim();
			if(userrepwd==""||userpwd!= userrepwd ){
				$("#pwdAlert").css("color","red");
				pwdAlert.innerHTML = "*两次密码不一致 ，请确认密码";
				document.myform.repwd.focus(); 
			}else{
				$("#pwdAlert").css("color","green");
				pwdAlert.innerHTML = "*密码确认正确";}
		}

 function check(){
 	if($('#user option:selected').val()=='0'){
 		$("#selectAlert").css("color","red");
 		selectAlert.innerHTML="*请选择客户";
 	    document.myform.user.focus(); 
 		return false;
 		}
 }

</script>


<style type="text/css">

	.notice{
		color:red;
		font-size:18px;
	}
	
</style>

</head>

<body>
	<div class="container">
		<h3 class="page-header">添加新账户</h3>
		<s:form cssClass="form-horizontal" namaspace="/account"
			action="createAccount" method="post" id="myform" onsubmit="return check()">
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">账户名称:</label>
				<div class="col-md-4">
					<s:textfield cssClass="form-control"  id="name" placeholder="账户名称"
					name="account.accName"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-md-4">
					<s:actionerror cssClass="alert alert-danger"/>
				</div>
			</div>
			<div class="form-group">
			<div class="col-sm-offset-2 col-md-4">
				<label id="nameAlert"></label>
			</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">密码预设:</label>
				<div class="col-md-4">
					<s:password cssClass="form-control" placeholder="密码预设" id="pwd" onblur="checkpwd()"></s:password>
				</div>
			</div>
			<div class="form-group">
			<div class="col-sm-offset-2 col-md-4">
				<label id="pwAlert"></label>
			</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="repwd">再次输入密码:</label>
				<div class="col-md-4">
					<s:password cssClass="form-control" placeholder="再次输入密码" id="repwd"
						name="account.accPwd" onblur="checkrepwd()"></s:password>
				</div>
			</div>
			<div class="form-group">
			<div class="col-sm-offset-2 col-md-4">
				<label id="pwdAlert"></label>
			</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="user">选择客户:</label>
				<div class="col-md-4">
					<s:select cssClass="form-control" name="account.client.idCardNo"
						list="clientList" listKey="idCardNo" listValue="clientName"
						headerKey="" headerValue="=请选择=" id="user"></s:select>
				</div>
			</div>
			<div class="form-group">
			<div class="col-sm-offset-2 col-md-4">
				<label id="selectAlert"></label>
			</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="amount">账户金额:</label>
				<div class="col-md-4">
					<s:label cssClass="form-control"  id="amount"
						name="account.accAmount"></s:label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" >状态:</label>
				<div class="col-md-2">
					<s:select cssClass="form-control" name="account.accStatus" 
						list="#{\"A\":'可用',\"F\":'冻结'}"></s:select>
				</div>
			</div>
			<s:hidden name="account.accCreateDate"></s:hidden>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<s:submit value="提交" cssClass="btn btn-primary" id="bt"></s:submit>
				</div>
			</div>
		</s:form>
	</div>
</body>
</html>
