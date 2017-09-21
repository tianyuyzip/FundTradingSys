<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>资金账户冻结/解冻</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style type="text/css">
body {
	background-color: lavender;
}

.btn {
	width: 80px;
	height: 50px;
	margin: 10px 50px;
}

#status {
	color: red;
	font-weight: bolod;
}

#mydiv {
	margin-left: 130px;
}

#mytable {
	font-family: "微软雅黑";
	font-size: 16px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		if ($("#status").text().trim() != "可用") {
			$("#bt").attr("disabled", true);
			$("#bt1").attr("disabled", false);
		} else {
			$("#bt").attr("disabled", false);
			$("#bt1").attr("disabled", true);
		}
	});
	
	function frozen(accNo,accName){
		if(confirm("您确定要冻结账户 ["+accName+"] 吗？"))
			location.href="<s:url namespace="/acctransinfo" action="frozenAccount"/>?account.accNo="+accNo;
	}
	function unfreezen(accNo,accName){
		if(confirm("您确定要解冻账户 ["+accName+"] 吗？"))
			location.href="<s:url namespace="/acctransinfo" action="unfreezeAccount"/>?account.accNo="+accNo;
	}
	
</script>

</head>

<body>
	<div class="container">
		<h3 class="page-header">资金账户冻结/解冻</h3>
		<div class="col-md-8">
			<table class="table table-bordered" id="mytable">
				<tr>
					<th class="col-md-3">当前账户编号：</th>
					<td colspan="3"><s:property value="account.accNo" /></td>
				</tr>
				<tr>
					<th>账户名称：</th>
					<td><s:property value="account.accName" /></td>
					<th>客户名：</th>
					<td><s:property value="account.client.clientName" /></td>
				</tr>
				<tr>
					<th>账户余额：</th>
					<td><s:property value="account.accAmount" /></td>
					<th>状态：</th>
					<td id="status"><s:if test="account.accStatus==\"A\"">可用</s:if>
						<s:elseif test="account.accStatus==\"F\"">由于某种原因，您的账户已被冻结。</s:elseif>
					</td>
				</tr>
			</table>
			<div id="mydiv">
				<button id="bt" class="btn"
					onclick="frozen(<s:property value="account.accNo"/>,'<s:property value="account.accName"/>');">冻结账户</button>
				<button id="bt1" class="btn"
					onclick="unfreezen(<s:property value="account.accNo"/>,'<s:property value="account.accName"/>');">解冻账户</button>
			</div>
		</div>
	</div>
</body>
</html>
