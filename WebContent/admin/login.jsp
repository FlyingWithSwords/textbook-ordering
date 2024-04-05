<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="<%=basePath %>admin/css/alogin.css" rel="stylesheet" type="text/css" /> 
<style type="text/css">
#login_frame {
    width: 400px;
    height: 320px;
    padding: 13px;
 
    position: absolute;
    left: 50%;
    top: 50%;
    margin-left: -200px;
    margin-top: -200px;
 
    background-color: rgba(255, 255, 255, 0.5);
 
    border-radius: 10px;
    text-align: center;
}
 
form p > * {
    display: inline-block;
    vertical-align: middle;
}
 
#image_logo {
    margin-top: 22px;
}
 
.label_input {
    font-size: 14px;
    font-family: 宋体;
 
    width: 65px;
    height: 28px;
    line-height: 28px;
    text-align: center;
 
    color: white;
    background-color: #3CA8FF;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
}
 
.text_field {
    width: 278px;
    height: 28px;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
    border: 0;
}
 
#btn_login {
    font-size: 14px;
    font-family: 宋体;
 
    width: 100px;
    height: 28px;
    line-height: 28px;
    text-align: center;
 
    color: white;
    background-color: #3BA9FF;
    border-radius: 6px;
    border: 0;
 
    float: left;
}
#login_control {
    padding: 20px 0 0 50px;
}
#login_control a{
	margin: 0 0 0 90px;
}
#login_control a:hover,#login_control input:hover{
	background-color: #1B89DF;
}
</style>
</head>

<% 
String message = (String)request.getAttribute("message");
if(message == null){
	message = "";
}
if (!message.trim().equals("")){
	out.println("<script language='javascript'>");
	out.println("alert('"+message+"');");
	out.println("</script>");
}
request.removeAttribute("message"); 
%>

<body>
    <div id="login_frame">
    <p id="image_logo"><img src="./images/login/fly.png" weight="50px" height="50px"></p>
    <font size="5px" color="#303030" face="黑体">登录系统</font>
    <form name="form1" action="<%=basePath %>AdminServlet?method=one" target="_top" method="post">
       <p><label class="label_input">登录用户</label><input type="text" id="Text1" name="username" class="text_field" required/></p><input type=hidden name=method value="one"/>
       <p><label class="label_input">登录密码</label><input type="password" id="Text2" name="password" class="text_field" required/></p>
       <p><label class="label_input">系统身份</label>
                       <select class="text_field" name="sf" required >  
                       <option value="教材发行员工">教材发行员工</option>
                       <option value="书库采购员工">书库采购员工</option>
                       <option value="管理员">管理员</option>
                       </select></p>
       <div id="login_control">
           <span class="btn"><input type="submit" id="btn_login" value="登录"/></span>
           <a href="<%=basePath %>index.jsp" id="btn_login" style="text-decoration:none">返回</a>
    </form>
</div>
</body>
</html>