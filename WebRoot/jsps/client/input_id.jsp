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

<title>请输入身份证号</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script type="text/javascript">

</script>

<style type="text/css">

	.notice{
		color:red;
		font-size:18px;
	}
	
	#mydiv{
		height:300px;
	}
	
</style>

</head>

<body>
	<%-- <img alt="xx" src="<c:url value="/imgs/网银.jpg"/>" style="width:100%;height:400px;"> --%>
	<div class="container">
		
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
        <img src="<c:url value="/imgs/银行.jpg"/>" alt="Los Angeles" style="width:100%;height:300px">
      </div>

      <div class="item">
        <img src="<c:url value="/imgs/网银.jpg"/>" alt="Chicago" style="width:100%;height:300px">
      </div>
    
      <div class="item">
        <img src="<c:url value="/imgs/bank.jpg"/>" alt="New york" style="width:100%;height:300px">
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
  <h3 class="page-header">请输入身份证号</h3>
		<s:form cssClass="form-horizontal" namaspace="/client"
			action="serchClient" method="post" id="myform">
			<div class="form-group" style="margin-top:100px">
				<label class="control-label col-sm-2" for="id">请输入身份证号:</label>
				<div class="col-md-7">
					<s:textfield cssClass="form-control" placeholder="输入6位数密码" id="id"
						name="client.idCardNo"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-md-4">
					<s:actionerror cssClass="alert alert-danger"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<s:submit value="查找" cssClass="btn btn-primary" id="bt"></s:submit>
				</div>
			</div>
		</s:form>
	</div>
</body>
</html>
