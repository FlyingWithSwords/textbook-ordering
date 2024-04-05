<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%> 
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="<%=basePath %>admin/css/css.css" type="text/css" rel="stylesheet" />
</head>
<%
	session.setAttribute("coms", "admin");
	String username=(String)session.getAttribute("user");  
	if(username==null){
		response.sendRedirect(basePath+"/admin/login.jsp");
	}
	else{ 
%>
<!--框架样式-->
<frameset rows="95,*,30" cols="*" frameborder="no" border="0" framespacing="0">
<!--top样式-->
	<frame src="<%=basePath %>admin/iframe/top.jsp" name="topframe" scrolling="no" noresize id="topframe" title="topframe" />
<!--contact样式-->
	<frameset id="attachucp" framespacing="0" border="0" frameborder="no" cols="194,12,*" rows="*">
		<frame scrolling="auto" noresize="" frameborder="no" name="leftFrame" src="<%=basePath %>admin/iframe/left.jsp"></frame>
		<frame id="leftbar" scrolling="no" noresize="" name="switchFrame" src="<%=basePath %>admin/iframe/swich.jsp"></frame>
		<frame scrolling="auto" noresize="" border="0" name="mainFrame" src="<%=basePath %>admin/iframe/main.jsp"></frame>
	</frameset>
<!--bottom样式-->
	<frame src="<%=basePath %>admin/iframe/bottom.jsp" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset><noframes></noframes>
<!--不可以删除-->
<%} %>
</html>