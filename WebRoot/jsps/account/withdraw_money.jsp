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

<title>操作金额</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>


<style type="text/css">

	.notice{
		color:red;
		font-size:18px;
	}
	
</style>

</head>

<body>
	<div class="container">
		<h3 class="page-header">操作金额</h3>
		<s:form cssClass="form-horizontal" namaspace="/acctransinfo"
			action="withdrawMoney" method="post" id="myform">
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">请输入取款金额:</label>
				<div class="col-md-4">
					<s:textfield cssClass="form-control"  id="name" placeholder="输入取款金额"
					name="accountTransinfo.transAmount"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-md-4">
					<s:actionerror cssClass="alert alert-danger"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<s:submit value="提交" cssClass="btn btn-primary" id="bt"></s:submit>
				</div>
			</div>
		</s:form>
	</div>
</body>
</html>
