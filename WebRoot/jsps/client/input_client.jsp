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

<title>添加客户信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script type="text/javascript">

	window.onload = function() {
		var bt = document.getElementById("bt");
		
		bt.onclick = function() {
		
			var strid = document.myform.id.value;
			
			var regu = "^[ ]+$";
			var re = new RegExp(regu);
			if ( strid == ""||re.test(strid)) {
				idAlert.innerHTML = "·身份证号不能为空！";
				document.myform.id.focus();
				return false;
			}
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
		<h3 class="page-header">添加客户信息</h3>
		<s:form cssClass="form-horizontal" namaspace="/client"
			action="createClient" method="post" id="myform">
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">*身份证号:</label>
				<div class="col-md-4">
					<s:textfield cssClass="form-control" placeholder="身份证号" id="id"
						name="client.idCardNo"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-md-4">
					<s:actionerror cssClass="alert alert-danger"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-md-4">
					<span id="idAlert" class="notice"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">姓名:</label>
				<div class="col-md-4">
					<s:textfield cssClass="form-control" placeholder="姓名" id="name"
						name="client.clientName"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sex">性别:</label>
				<div class="col-md-2">
					<s:select cssClass="form-control" name="client.clientSex" id="sex"
						list="#{\"F\":'女',\"M\":'男'}"></s:select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phone">联系电话:</label>
				<div class="col-md-4">
					<s:textfield cssClass="form-control" placeholder="联系电话" id="phone"
						name="client.clientPhone"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="addr">家庭地址:</label>
				<div class="col-md-8">
					<s:textfield cssClass="form-control" placeholder="家庭地址" id="addr"
						name="client.clientAddress"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">电子邮件:</label>
				<div class="col-md-4">
					<s:textfield cssClass="form-control" placeholder="邮箱"  id="email"
						name="client.clientEmail"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="hobby">兴趣爱好:</label>
				<div class="col-md-8">
					<s:textfield cssClass="form-control" placeholder="兴趣爱好"  id="hobby"
						name="client.clientHobby"></s:textfield>
				</div>
			</div>
			<s:hidden name="client.clientCreateDate"></s:hidden>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<s:submit value="提交" cssClass="btn btn-primary" id="bt"></s:submit>
				</div>
			</div>
		</s:form>
	</div>
</body>
</html>
