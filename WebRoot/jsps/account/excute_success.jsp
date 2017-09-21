<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>操作成功</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style type="text/css">

#bt {
	width: 80px;
	height: 50px;
}

#mytable {
	font-family: "微软雅黑";
	font-size: 16px;
}
</style>

<script type="text/javascript">

	function back(){
		location.href="<s:url namespace="/acctransinfo" action="inputPwd"/>";
	}
	
</script>

</head>

<body>
	<div class="container">
	<div class="col-md-5">
		<img alt="成功" src="<c:url value="/imgs/对号.jpg"/>">
		<label style="font-size:30px;color:#666">操作成功</label>
	</div>
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
						<s:elseif test="account.accStatus==\"F\"">不可用</s:elseif>
					</td>
				</tr>
			</table>
			<div class="col-md-offset-11">
				<button class="btn btn-primary btn-lg" onclick="back();">返回</button>
			</div>
		</div>
	</div>
</body>
</html>
