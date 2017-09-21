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
    
    <title>资金账户列表</title>
    
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
	  
	    function removeAccount(accNo,accName){
	      
	      if(confirm("您真的要注销 ["+accName+"] 的信息吗?,包括资金全部清零。")){
	         location.href="<s:url namespace="/acctransinfo" action="removeAccount"/>?account.accNo="+accNo;
	      }
	      
	    }
	    
	    function frozenAccount(accNo){
	       location.href="<s:url namespace="/acctransinfo" action="preForzen"/>?account.accNo="+accNo;
	    }
	
	</script>

  </head>
  
  <body>
  <div class="container">
     <h3 class="page-header">资金账户列表</h3>
     <table class="table table-hover">
       <tr>
         <th>#</th>
         <th>账户名称</th>
         <th>账户余额</th>
         <th>账户状态</th>
         <th>账户所有者</th>
         <th>创建日期</th>
         <th>操作</th>
       </tr>
       <s:iterator value="accountList">
       <tr>
         <td><s:property value="accNo"/></td>
         <td> <s:property value="accName"/></td>
         <td><s:property value="accAmount"/></td>
         <td id="status">
         	<s:if test="accStatus==\"A\"">可用</s:if>
         	<s:elseif test="accStatus==\"F\"">冻结</s:elseif>
         </td>
         <td><s:property value="client.clientName"/></td>
         <td><s:date name="accCreateDate" format="yyyy-MM-dd" /></td>
         <td>
           <button class="btn btn-default" onclick="removeAccount(<s:property value="accNo"/>,'<s:property value="accName"/>');">注销</button>
           <button class="btn btn-default" onclick="frozenAccount(<s:property value="accNo"/>);" id="bt">冻结/解冻账户</button>
         </td>
       </tr>
       </s:iterator>
     </table>
     </div>
  </body>
</html>
