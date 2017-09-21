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
    
    <title>客户基本信息管理</title>
    
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
	  
	    function removeClient(idCardNo,clientName){
	      
	      if(confirm("您真的要删除用户  ["+clientName+"] 的信息吗?")){
	         location.href="<s:url namespace="/client" action="removeClient"/>?client.idCardNo="+idCardNo;
	      }
	      
	    }
	    
	    function updateClient(idCardNo){
	       location.href="<s:url namespace="/client" action="preUpdate"/>?client.idCardNo="+idCardNo;
	    }
	
	</script>

  </head>
  
  <body>
  <div class="container">
     <h3 class="page-header">客户基本信息管理</h3>
     <table class="table table-hover">
       <tr>
         <th>#</th>
         <th>客户名称</th>
         <th>性别</th>
         <th>电话</th>
         <th>家庭地址</th>
         <th>邮箱</th>
         <th>爱好</th>
         <th>开户日期</th>
         <th>操作</th>
       </tr>
       <s:iterator value="clientList">
       <tr>
         <td><s:property value="idCardNo"/></td>
         <td> <s:property value="clientName"/></td>
         <td>
         	<s:if test="clientSex==\"F\"">女</s:if>
         	<s:elseif test="fundStatus==\"M\"">男</s:elseif>
         </td>
         <td><s:property value="clientPhone"/></td>
         <td><s:property value="clientAddress"/></td>
         <td><s:property value="clientEmail"/></td>
         <td><s:property value="clientHobby"/></td>
         <td><s:date name="clientCreateDate" format="yyyy-MM-dd" /></td>
         <td>
           <button class="btn btn-default" onclick="removeClient(<s:property value="idCardNo"/>,'<s:property value="clientName"/>');">删除</button>
           <button class="btn btn-default" onclick="updateClient(<s:property value="idCardNo"/>);">修改</button>
         </td>
       </tr>
       </s:iterator>
     </table>
     </div>
  </body>
</html>
