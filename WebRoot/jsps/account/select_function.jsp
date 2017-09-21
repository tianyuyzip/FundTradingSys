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

<title>选择操作</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<style type="text/css">

.btn {
	width: 200px;
	height: 100px;
	margin:70px;
}

#headImg{
	width:100%;
	height:280px;
}

#mydiv{
	margin:10px 130px;
}


</style>

<script type="text/javascript">

	function save(){
		location.href="<s:url namespace="/acctransinfo" action="putMoney"/>";
	}
	function withdraw(){
		location.href="<s:url namespace="/acctransinfo" action="inputMoney"/>";
	}
	function select(){
		location.href="<s:url namespace="/acctransinfo" action="selectMoney"/>";
	}
	
</script>

</head>

<body>
	<div>
		<img id="headImg" alt="错误" src="<c:url value="/imgs/银行.jpg"/>">
	</div>
	<div id="mydiv">
		<button  class="btn" onclick="save();">存款</button>
		<button  class="btn" onclick="withdraw();">取款</button>
		<button  class="btn" onclick="select();">查询</button>
	</div>
</body>
</html>
