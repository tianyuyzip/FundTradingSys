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

<title>基金交易</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script type="text/javascript">

    $(document).ready(function(){     
    var inputUserNameObj = $("#uname");   //将获取ID为uname的控件的对象  
    var inputFund = $('#funder');
   
    $("#uname").blur(function(){   //当该控件失去焦点时发生  
  
        var text = inputUserNameObj.val();   //获得用户输入的用户名  
                               
        $.post("transinfo/findByName.do?transinfo.account.accName="+text,null,function(response){      
                   //以POST方式跳转到action里面的方法中进行处理，并返回处理结果response  
  				/* alert(response); */
             if(response=="不存在此用户信息"){ //根据返回值进行处理  
                          
                document.getElementById("uname").focus();  
                            
                    document.getElementById("span1").innerHTML=response;
  
             }else{  
  					document.getElementById("span1").innerHTML=response;   
                     }   
        });    
    });  
    	$('#funder').change(function(){
			var fundNo = inputFund.val();
			$.post("transinfo/getPrice.do?transinfo.fund.fundNo="+fundNo,null,function(response){
				$("#price").val(response);
			});
		});   
});  

	function check() {
			var strid = document.myform.name.value;
			var userpwd = document.myform.pwd.value;
			var userpwd1 = document.myform.repwd.value;

			var regu = "^[ ]+$";
			var re = new RegExp(regu);
		if (strid == "" || re.test(strid)) {
				$("#nameAlert").css("color", "red");
				nameAlert.innerHTML = "*账户名不能为空！";
				document.myform.name.focus();
				return false;
			} else {
				$("#nameAlert").hide();
			}
		if ($('#funder option:selected').val() == '0') {
			$("#fundAlert").css("color", "red");
			fundAlert.innerHTML = "*请选择基金产品";
			document.myform.funder.focus();
			return false;
		}
	}

	
</script>


<style type="text/css">
.notice {
	color: red;
	font-size: 18px;
}
</style>

</head>

<body>
	<div class="container">
		<h3 class="page-header">基金交易</h3>
		<s:form cssClass="form-horizontal" namaspace="/transinfo"
			action="inputPwd" method="post" id="myform"
			onsubmit="return check()">
			<div class="form-group">
				<label class="control-label col-sm-2" for="uname">账户名称:</label>
				<div class="col-md-4">
					<s:textfield cssClass="form-control" id="uname" placeholder="账户名称"
						name="transinfo.account.accName"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-md-4">
					<span id="span1"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="funder">选择基金产品:</label>
				<div class="col-md-4">
					<s:select cssClass="form-control" name="transinfo.fund.fundNo"
						list="fundList" listKey="fundNo" listValue="fundName"
						headerKey="" headerValue="=请选择=" id="funder"></s:select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-md-4">
					<label id="fundAlert"></label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="type">操作类型:</label>
				<div class="col-md-2">
					<s:select cssClass="form-control" name="transinfo.fundTransType"
						id="type" list="#{\"B\":'基金购买',\"G\":'赎回基金'}"></s:select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="price">每份净值:</label>
				<div class="col-md-4">
					<s:textfield cssClass="form-control" id="price" placeholder="每份净值"
						name="transinfo.fundTransPrice"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="amount">购买份数:</label>
				<div class="col-md-4">
					<s:textfield cssClass="form-control" id="amount" placeholder="购买份数"
						name="transinfo.fundTransAmount"></s:textfield>
				</div>
			</div>
			<s:hidden name="transinfo.fundTransCreateDate"></s:hidden>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<s:submit value="提交" cssClass="btn btn-primary" id="bt"></s:submit>
				</div>
			</div>
		</s:form>
	</div>
</body>
</html>
