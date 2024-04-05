<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link type="text/css" href="<%=basePath %>css/css.css" rel="stylesheet" />
<link type="text/css" rel="stylesheet" href="<%=basePath %>css/layui.css" media="all">
<link type="text/css" rel="stylesheet" href="<%=basePath %>css/modules/code.css" media="all">
<link type="text/css" rel="stylesheet" href="<%=basePath %>css/modules/layer/default/layer.css" media="all">
<link type="text/css" rel="stylesheet" href="<%=basePath %>css/modules/laydate/default/laydate.css" media="all">
<script type="text/javascript" src="<%=basePath %>js/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/js.js"></script>
<script type="text/javascript" src="<%=basePath %>js/payfor.js"></script>
<script type="text/javascript" src="<%=basePath %>js/layui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学校教材定购系统</title>
<SCRIPT language=javascript>
function reg() {
	window.location="reg.jsp";
}
function lost() {
	window.location="lost.jsp";
}
function login() {
	window.location="login.jsp";
}
</SCRIPT>
<style type="text/css">
body{
	background: url(<%=basePath %>admin/images/login/bg.jpg) no-repeat;
	background-size:cover;
	background-attachment: fixed;
	padding:180px 0;
	margin-top:-20px;
}
</style>
</head>
<body>
<div class="bg">
<br> 
<center>
<form name="form1" action="<%=basePath %>MemberServlet?method=lost" method="post" class="regForm">
    <div class="loginBuyList">
     <label for="name">登录帐号：</label>
     <input type="text" name="username" required/>
    </div>  
    <div class="loginBuyList" style="border:#666 1px solid;">
     <label for="name">密保邮箱：</label>
     <input type="text" name="email" required/>
    </div>
     
    <div class="regSubs">
     <input type="submit" value=" 提 交 " /> 
    </div> 
   </form>
</center>
</div>
</body>
</html>
