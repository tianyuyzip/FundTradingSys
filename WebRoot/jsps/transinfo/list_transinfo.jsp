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
    
    <title>基金交易信息管理</title>
    
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
	
	<script type="text/javascript">
	  
	    function removeTransinfo(fundTransNo,fundTransName){
	      
	      if(confirm("您真的要删除用户  ["+fundTransName+"] 的信息吗?")){
	         location.href="<s:url namespace="/transinfo" action="removeTransinfo"/>?transinfo.fundTransNo="+fundTransNo;
	      }
	      
	    }

	
	</script>

  </head>
  
  <body>
  <div class="container">
     <h3 class="page-header">基金交易信息管理</h3>
     <table class="table table-hover">
       <tr>
         <th>#</th>
         <th>类型</th>
         <th>账户</th>
         <th>基金</th>
         <th>数量</th>
         <th>价格</th>
         <th>开户日期</th>
         <th>操作</th>
       </tr>
       <s:iterator value="transinfoList">
       <tr>
         <td><s:property value="fundTransNo"/></td>
         <td>
         	<s:if test="fundTransType==\"B\"">购买</s:if>
         	<s:elseif test="fundTransType==\"G\"">赎回</s:elseif>
         </td>
         <td><s:property value="account.accName"/></td>
         <td><s:property value="fund.fundName"/></td>
         <td><s:property value="fundTransAmount"/></td>
         <td><s:property value="fundTransPrice"/></td>
         <td><s:date name="fundTransCreateDate" format="yyyy-MM-dd" /></td>
         <td>
           <button class="btn btn-default" onclick="removeTransinfo(<s:property value="fundTransNo"/>,'<s:property value="fundTransName"/>');">删除</button>
         </td>
       </tr>
       </s:iterator>
     </table>
     </div>
  </body>
</html>
