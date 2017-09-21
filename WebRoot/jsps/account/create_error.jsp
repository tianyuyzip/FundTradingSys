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

<title>创建新账户</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script type="text/javascript">

	function back(){
		location.href="<s:url namespace="/account" action="toInput"/>";
	}
	
</script>


<style type="text/css">

	.notice{
		color:red;
		font-size:18px;
	}
	
	ul{
		list-style-type:none;
	}
	
	span{
		color:red;
		font-size:30px;
		font-family:"微软雅黑"；
	}
	
	#btDiv{
		position:relative;
	}
	
	#bt{
		position:absolute;
		top:0px;
		left:400px;
	}
	
</style>

</head>

<body>
	<div class="container">
		<h3 class="page-header">创建新账户</h3>
		<ul>
			<li>
				<img alt="错误" src="<c:url value="/imgs/叉号.jpg"/>">
				<span>Sorry，it's failed，please recreate it</span>
			</li>
		</ul>
		<div id="btDiv">
			<button id="bt" class="btn btn-default" onclick="back();">返回</button>
		</div>
	</div>
</body>
</html>
