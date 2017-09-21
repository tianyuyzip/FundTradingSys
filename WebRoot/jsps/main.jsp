<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>Fund Management</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function logout() {
		if (confirm('尊敬的${loginedUser.userName},您真的要离开系统吗？')) {
			location.href = '<s:url namespace="/security" action="logout"/>';
		}
	}
</script>

<style type="text/css">

	ul>li{
		margin:20px;
	}
	
	#mydiv{
		height:200px;
		width:100%;
	}
	
	#myCarousel{
		width:100%;
	}

</style>

</head>

<body>
<div class="container">
	<div class="container-fluid">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div id="mydiv" class="carousel-inner">
      <div class="item active">
        <img src="<c:url value="/imgs/银行.jpg"/>" alt="Los Angeles" style="width:100%;height:120px">
      </div>

      <div class="item">
        <img src="<c:url value="/imgs/网银.jpg"/>" alt="Chicago" style="width:100%;height:120px">
      </div>
    
      <div class="item">
        <img src="<c:url value="/imgs/bank.jpg"/>" alt="New york" style="width:100%;height:120px">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
		 <div style="float:right; margin:1px;">
                 操作员:${loginedUser.userName}&nbsp;
             <span class="linkspan" onclick="logout();" title="点击离开系统">离开系统</span>
        </div>        
	</div>
	<div id="navigator" class="container-fluid">
		<div class="row">
			<div class="span2  col-xs-6 col-sm-3 col-md-2">
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="<c:url value="/jsps/main.jsp"/>">Home</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">基金管理<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<s:url namespace="/fund" action="toInput"/>"
								target="contentFrame">添加基金产品</a></li>
							<li><a href="<s:url namespace="/fund" action="loadFunds"/>"
								target="contentFrame">查询基金产品</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">客户资料管理<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<s:url namespace="/client" action="toInput"/>"
								target="contentFrame">添加新客户</a></li>
							<li><a
								href="<s:url namespace="/client" action="loadClients"/>"
								target="contentFrame">修改客户基本信息</a></li>
							<li><a
								href="<s:url namespace="/client" action="loadClients"/>"
								target="contentFrame">查询客户基本信息</a></li>
							<li><a
								href="<s:url namespace="/client" action="loadClients"/>"
								target="contentFrame">查询客户详细信息</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">客户资金账户管理<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<s:url namespace="/account" action="toInput"/>"
								target="contentFrame">资金账户开户</a></li>
							<li><a
								href="<s:url namespace="/acctransinfo" action="inputPwd"/>"
								target="contentFrame">查询资金账户</a></li>
							<li><a
								href="<s:url namespace="/acctransinfo" action="inputPwd"/>"
								target="contentFrame">追加账户资金</a></li>
							<li><a
								href="<s:url namespace="/acctransinfo" action="inputPwd"/>"
								target="contentFrame">取出账户资金</a></li>
													<li><a
						href="<s:url namespace="/acctransinfo" action="loadAccounts"/>"
						target="contentFrame">冻结/解冻资金账户</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">基金交易管理<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<s:url namespace="/transinfo" action="toInput"/>"
								target="contentFrame">购买基金</a></li>
							<li><a
								href="<s:url namespace="/transinfo" action="loadTransinfos"/>"
								target="contentFrame">基金账户查询</a></li>
							<li><a
								href="<s:url namespace="/transinfo" action="toInput"/>"
								target="contentFrame">基金赎回</a></li>
							<li><a
								href="<s:url namespace="/transinfo" action="loadTransinfos"/>"
								target="contentFrame">交易记录</a></li>
							<li><a
								href=""
								target="contentFrame">持仓情况</a></li>
						</ul></li>
				</ul>
			</div>
	<div class="col-xs-8 col-sm-10 col-md-10">
		<!-- iframe : inner frame(window)-->
		<iframe id="contentFrame" width="99%" scrolling="yes" height="460px"
			frameborder="0" name="contentFrame" allowtransparency="true"
			src='<c:url value="/welcome.jsp"/>'> </iframe>
		</div>
	</div>
	</div>
	<div style="clear:both"></div>
	<%@ include file="/jsps/footer.jsp"%>
	</div>
</body>
</html>
