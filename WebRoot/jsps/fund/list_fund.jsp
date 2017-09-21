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
    
    <title>基金产品列表</title>
    
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
	  
	    function removeFund(fundNo,fundName){
	      
	      if(confirm("您真的要删除基金 ["+fundName+"] 的信息吗?")){
	         location.href="<s:url namespace="/fund" action="removeFund"/>?fund.fundNo="+fundNo;
	      }
	      
	    }
	    
	    function updateFund(fundNo){
	       location.href="<s:url namespace="/fund" action="preUpdate"/>?fund.fundNo="+fundNo;
	    }
	
	</script>

  </head>
  
  <body>
  <div class="container">
     <h3 class="page-header">基金产品管理</h3>
     <table class="table table-hover">
       <tr>
         <th>#</th>
         <th>基金名称</th>
         <th>单价</th>
         <th>状态</th>
         <th>描述</th>
         <th>创建日期</th>
         <th>操作</th>
       </tr>
       <s:iterator value="fundList">
       <tr>
         <td><s:property value="fundNo"/></td>
         <td> <s:property value="fundName"/></td>
         <td><s:property value="fundPrice"/></td>
         <td>
         	<s:if test="fundStatus==\"Y\"">可交易</s:if>
         	<s:elseif test="fundStatus==\"N\"">未上市交易</s:elseif>
         </td>
         <td><s:property value="fundDescription"/></td>
         <td><s:date name="fundCreateDate" format="yyyy-MM-dd" /></td>
         <td>
           <button class="btn btn-default" onclick="removeFund(<s:property value="fundNo"/>,'<s:property value="fundName"/>');">删除</button>
           <button class="btn btn-default" onclick="updateFund(<s:property value="fundNo"/>);">修改</button>
         </td>
       </tr>
       </s:iterator>
     </table>
     </div>
  </body>
</html>
