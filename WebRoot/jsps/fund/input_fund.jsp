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

<title>添加基金产品</title>

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
		
			var strName = document.myform.name.value;
			var strPrice = document.myform.price.value;
			
			var regu = "^[ ]+$";
			var re = new RegExp(regu);
			if ( strName == ""||re.test(strName)) {
				nameAlert.innerHTML = "·基金名称不能为空！";
				document.myform.name.focus();
				return false;
			}
			if(strPrice == ""||re.test(strPrice)) {
				priceAlert.innerHTML = "·基金价格不能为空！";
				document.myform.price.focus();
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
		<h3 class="page-header">添加基金产品</h3>
		<s:form cssClass="form-horizontal" namaspace="/fund"
			action="createFund" method="post" id="myform">
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">*基金产品名称:</label>
				<div class="col-md-4">
					<s:textfield cssClass="form-control" placeholder="基金产品名称" id="name"
						name="fund.fundName"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-md-4">
					<span id="nameAlert" class="notice"></span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-md-4">
					<s:actionerror cssClass="alert alert-danger"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="price">*静发行值:</label>
				<div class="col-md-4">
					<s:textfield cssClass="form-control" placeholder="静发行值" id="price"
						name="fund.fundPrice"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-md-4">
					<span id="priceAlert" class="notice"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">基金状态:</label>
				<div class="col-md-4">
					<s:select cssClass="form-control" name="fund.fundStatus"
						list="#{\"Y\":'可交易',\"N\":'未上市交易'}"></s:select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="desc">描述说明:</label>
				<div class="col-md-7">
					<s:textarea cssClass="form-control" placeholder="留下点什么吧。" id="desc"
						name="fund.fundDescription" cols="80" rows="5"></s:textarea>
				</div>
			</div>
			<s:hidden name="fund.fundCreateDate"></s:hidden>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<s:submit value="提交" cssClass="btn btn-primary" id="bt"></s:submit>
				</div>
			</div>
		</s:form>
	</div>
</body>
</html>
