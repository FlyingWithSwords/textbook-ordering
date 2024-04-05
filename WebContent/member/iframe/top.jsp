<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%> 
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
String sf=(String)session.getAttribute("sf");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台页面头部</title>
<link href="<%=basePath %>admin/css/css.css" type="text/css" rel="stylesheet" />
</head>
<body onselectstart="return false" oncontextmenu=return(false) style="overflow-x:hidden;">
<!--禁止网页另存为-->
<noscript><iframe scr="*.htm"></iframe></noscript>
<!--禁止网页另存为-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="header">
  <tr>
    <td rowspan="2" align="left" valign="top" id="logo"><img src="<%=basePath %>admin/images/main/logo.jpg" width="74" height="64"></td>
    <td align="left" valign="bottom">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" valign="bottom" id="header-name"><%=sf %>中心</td>
        <td align="right" valign="top" id="header-right">
        	<a href="<%=basePath %>MemberServlet?method=memberexit" target="_top" 
        	onclick="if (confirm('确定要退出吗？')) return true; else return false;" onFocus="this.blur()" class="admin-out">注销</a>
        	<a href="<%=basePath %>member/index.jsp" target="_top" onFocus="this.blur()" class="admin-index">刷新</a>  
            <a href=""  onFocus="this.blur()" class="admin-home"> </a>     	
            <span>
<!-- 日历 -->
<SCRIPT type=text/javascript src="<%=basePath %>admin/js/clock.js"></SCRIPT>
<SCRIPT type=text/javascript>showcal();</SCRIPT>
            </span>
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="left" valign="bottom">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" valign="top" id="header-admin"></td>
        <td align="left" valign="bottom" id="header-menu">&nbsp;
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
