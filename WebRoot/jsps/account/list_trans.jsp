<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>存取款记录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<script type="text/javascript" src="jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="bootstrap.min.js"></script>
	
	<style>
	 
	   div{
	     margin:10px;
	   }
	   
	   td,th{
	     text-align:center;
	   }
	
	</style>

  </head>
  
  <body>
  <div class="container">
     <h3 class="page-header">存取款记录</h3>
     <table class="table table-hover">
       <tr>
         <th>交易记录号</th>
         <th>账户名称</th>
         <th>类型</th>
         <th>交易金额</th>
         <th>创建日期</th>
       </tr>
       <s:iterator value="accountTransinfoList">
       <tr>
         <td><s:property value="transNo"/></td>
         <td> <s:property value="account.accName"/></td>
         <td id="status">
         	<s:if test="transType==\"D\"">存款</s:if>
         	<s:elseif test="transType==\"W"">取款</s:elseif>
         </td>
         <td><s:property value="transAmount"/></td>
         <td><s:date name="transCreateDate" format="yyyy-MM-dd" /></td>
       </tr>
       </s:iterator>
     </table>
     </div>
  </body>
</html>
