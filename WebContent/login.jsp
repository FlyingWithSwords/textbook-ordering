<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="<%=basePath %>css/css.css" rel="stylesheet" />
<link type="text/css" rel="stylesheet" href="<%=basePath %>css/layui.css" media="all">
<link type="text/css" rel="stylesheet" href="<%=basePath %>css/modules/code.css" media="all">
<link type="text/css" rel="stylesheet" href="<%=basePath %>css/modules/layer/default/layer.css" media="all">
<link type="text/css" rel="stylesheet" href="<%=basePath %>css/modules/laydate/default/laydate.css" media="all">
<script type="text/javascript" src="<%=basePath %>js/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/js.js"></script>
<script type="text/javascript" src="<%=basePath %>js/payfor.js"></script>
<script type="text/javascript" src="<%=basePath %>js/layui.js"></script>
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
function admin() {
	window.location="admin/login.jsp";
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
.text_field{
	height: 48px;
	border-radius: 1em;
	background: #00000000;
	margin-left: 100px;
	width:180px;
}
</style>
</head>
<body>
<br>
<div class="bg">
<center>
<form name="form1" action="<%=basePath %>MemberServlet?method=mlogin" target="_top" method="post" class="regForm">
    <p id="image_logo"><img src="<%=basePath %>admin/images/login/fly.png" weight="50px" height="50px" style="margin-bottom:30px;"></p>
    <div class="loginBuyList" style="border:#666 1px solid;">
     <label for="name">用户帐号：</label>
     <input type="text" name="username" required/>
    </div> 
    <div class="loginBuyList" style="border:#666 1px solid;">
     <label for="name">登录密码：</label>
     <input type="password" name="password" required/>
    </div>  
    <div class="loginBuyList" style="border:#666 1px solid;">
     <label for="name">登录身份：</label>
     <select class="text_field" name="sf" required >  
                       <option value="教师">教师</option>
                       <option value="学生">学生</option>
                       </select>
    </div>  
     <div >
    <div class="regSubs">
    <p><input type="submit" value=" 登 录 " />&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value=" 注 册 " onclick="reg()"/></p>
    <div style="margin-left:25%;margin-top:10px;"><a onclick="admin()">内部登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="lost()">忘记密码？</a></div>
    </div>
   </form>
</center>
</div>
</body>
</html>
