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

<title>修改客户信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

</head>

<body>
	<div class="container">
		<h3 class="page-header">修改客户信息</h3>
		<s:form cssClass="form-horizontal" namaspace="/client"
			action="updateClient" method="post" id="myform">
			<s:hidden name="client.idCardNo"></s:hidden>
			<s:hidden name="client.clientCreateDate"></s:hidden>
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
					<s:textfield cssClass="form-control" placeholder="邮箱" id="email"
						name="client.clientEmail"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-md-4">
					 <label id="myspan"></label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="hobby">兴趣爱好:</label>
				<div class="col-md-8">
					<s:textfield cssClass="form-control" placeholder="兴趣爱好" id="hobby"
						name="client.clientHobby"></s:textfield>
				</div>
			</div>
			<s:hidden name="client.clientCreateDate"></s:hidden>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<s:submit value="修改" cssClass="btn btn-primary"
						id="bt"></s:submit>
				</div>
			</div>
		</s:form>
	</div>
</body>
</html>