<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%> 
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>底部bottom</title>
<link href="<%=basePath %>admin/css/css.css" type="text/css" rel="stylesheet" />
<style>
#footer{font-size:12px;}
.footer_pad{padding:7px 9px 5px 9px;}
</style>
</head>
<body style="overflow-x:hidden; background:url(<%=basePath %>admin/images/main/bottombg.jpg) repeat-x top left;" onselectstart="return false" oncontextmenu=return(false) >
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="footer">
  <tr>
    <td align="left" valign="middle" class="footer_pad">COPYRIGHT &copy; 欢迎使用 </td>
    <td align="right" valign="middle" class="footer_pad">欢迎使用</td>
  </tr>
</table>
</body>
</html>
