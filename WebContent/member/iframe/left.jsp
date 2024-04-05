<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%> 
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>左侧导航menu</title>
<link href="<%=basePath %>admin/css/css.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<%=basePath %>admin/js/sdmenu.js"></script>
<script type="text/javascript">
	// <![CDATA[
	var myMenu;
	window.onload = function() {
		myMenu = new SDMenu("my_menu");
		myMenu.init();
	};
	// ]]>
</script>
<style type=text/css>
html{ SCROLLBAR-FACE-COLOR: #107ed3; SCROLLBAR-HIGHLIGHT-COLOR: #f0f0f0; SCROLLBAR-SHADOW-COLOR: #0089df; SCROLLBAR-3DLIGHT-COLOR: #f0f0f0; SCROLLBAR-ARROW-COLOR: #0089df;  SCROLLBAR-TRACK-COLOR: #f0f0f0;  SCROLLBAR-DARKSHADOW-COLOR: #f0f0f0; overflow-x:hidden;}
body{overflow-x:hidden; background:url(<%=basePath %>admin/images/main/leftbg.jpg) left top repeat-y #f2f0f5; width:194px;}
</style>
</head>

<% 
	String member=(String)session.getAttribute("user");
	session.setAttribute("com", "member/index.jsp");
	if(member==null){
		response.sendRedirect(basePath+"login.jsp");
	}
	else{ 
%>
<body onselectstart="return false;" ondragstart="return false;" oncontextmenu="return false;">
<div id="left-top">
	<div><img src="<%=basePath %>admin/images/main/member.gif" width="44" height="44" /></div>
    <span>用户：<%=member %><br> </span>
</div>
    <div style="float: left" id="my_menu" class="sdmenu">
      <div class="collapsed">
        <span>个人信息管理</span>
        <a href="<%=basePath %>member/info/editpwd.jsp" target="mainFrame" onFocus="this.blur()">密码修改</a> 
        <a href="<%=basePath %>member/info/index.jsp" target="mainFrame" onFocus="this.blur()">个人信息管理</a> 
      </div>
      <div>
        <span>图书订购管理</span>
        <a href="<%=basePath %>member/buy/index.jsp" target="mainFrame" onFocus="this.blur()">图书订购管理</a> 
        <a href="<%=basePath %>member/buy/add.jsp?method=addbuy" target="mainFrame" onFocus="this.blur()">订购图书登记</a> 
        <a href="<%=basePath %>member/buy/s.jsp" target="mainFrame" onFocus="this.blur()">图书订购查询</a>
      </div>
</body>
<%} %>
</html>