<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%> 
<% 
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>��ർ��menu</title>
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
	String username=(String)session.getAttribute("user");
	String sf=(String)session.getAttribute("sf");  
	 
	if(username==null){
		response.sendRedirect(basePath+"admin/login.jsp");
	}
	else{ 
%>
<body onselectstart="return false;" ondragstart="return false;" oncontextmenu="return false;" >
<div id="left-top">
	<div><img src="<%=basePath %>admin/images/main/member.gif" width="44" height="44" /></div>
    <span>�û���<%=username %><br> </span>
</div>
    <div style="float: left" id="my_menu" class="sdmenu">
      <div class="collapsed">
      <span>�û���Ϣ����</span>
        <a href="<%=basePath %>admin/system/editpwd.jsp" target="mainFrame" onFocus="this.blur()">������Ϣ����</a>
       <a href="<%=basePath %>admin/system/index2.jsp" target="mainFrame" onFocus="this.blur()">�û���Ϣ����</a>
      </div>
      <%if(sf.equals("����Ա")){ %>
      <div>
        <span>Ա����Ϣ����</span>
        <a href="<%=basePath %>admin/system/index.jsp" target="mainFrame" onFocus="this.blur()">Ա����Ϣ����</a>
        <a href="<%=basePath %>admin/system/add.jsp?method=addm" target="mainFrame" onFocus="this.blur()">Ա����Ϣ����</a>
        <a href="<%=basePath %>admin/system/s.jsp" target="mainFrame" onFocus="this.blur()">Ա����Ϣ��ѯ</a> 
      </div>
      <%}%>
      <div>
        <span>ͼ�������</span>
        <a href="<%=basePath %>admin/bd/index.jsp" target="mainFrame" onFocus="this.blur()">������</a>
        <a href="<%=basePath %>admin/bd/add.jsp?method=addbd" target="mainFrame" onFocus="this.blur()">����ͼ��</a>
        <a href="<%=basePath %>admin/bd/s.jsp" target="mainFrame" onFocus="this.blur()">ͼ���ѯ</a> 
      </div>
      <%if(!sf.equals("����Ա")){ %>
      <div>
        <span>����Ǽǹ���</span>
        <a href="<%=basePath %>admin/buy/index.jsp" target="mainFrame" onFocus="this.blur()">����Ǽǹ���</a>
        <%if(sf.equals("�̲ķ���Ա��")){ %>
        <a href="<%=basePath %>admin/buy/add.jsp?method=addbuy" target="mainFrame" onFocus="this.blur()">�����¼�Ǽ�</a>
        <%} %>
        <a href="<%=basePath %>admin/buy/s.jsp" target="mainFrame" onFocus="this.blur()">�����¼��ѯ</a>
      </div> 
      <%} %>
      <%if(sf.equals("���ɹ�Ա��")){ %>
      <div>
        <span>����¼����</span>
        <a href="<%=basePath %>admin/in/index.jsp" target="mainFrame" onFocus="this.blur()">����¼����</a>
        <a href="<%=basePath %>admin/in/add.jsp?method=addin" target="mainFrame" onFocus="this.blur()">����¼�Ǽ�</a> 
        <a href="<%=basePath %>admin/in/s.jsp" target="mainFrame" onFocus="this.blur()">����¼��ѯ</a> 
      </div>
      <%} %>
      <%if(sf.equals("�̲ķ���Ա��")){ %>
      <div>
        <span>�����¼����</span>
        <a href="<%=basePath %>admin/out/index.jsp" target="mainFrame" onFocus="this.blur()">�����¼����</a>
        <a href="<%=basePath %>admin/out/add.jsp?method=addout" target="mainFrame" onFocus="this.blur()">�����¼�Ǽ�</a>
        <a href="<%=basePath %>admin/out/s.jsp" target="mainFrame" onFocus="this.blur()">�����¼��ѯ</a><!-- 
        <a href="<%=basePath %>admin/sf/t.jsp" target="mainFrame" onFocus="this.blur()">�շ���Ϣͳ��</a> 
      --></div>
      <%} %>
      <%if(sf.equals("���ɹ�Ա��")){ %>
      <div>
        <span>����ͼ�����</span>
        <a href="<%=basePath %>admin/ready/index.jsp" target="mainFrame" onFocus="this.blur()">������¼����</a>
        <a href="<%=basePath %>admin/ready/add.jsp?method=addready" target="mainFrame" onFocus="this.blur()">������¼�Ǽ�</a>
        <a href="<%=basePath %>admin/ready/s.jsp" target="mainFrame" onFocus="this.blur()">������¼��ѯ</a><!-- 
        <a href="<%=basePath %>admin/sf/t.jsp" target="mainFrame" onFocus="this.blur()">�շ���Ϣͳ��</a> 
      --></div>
      <%} %>
      <%if(!sf.equals("����Ա")){ %>
      <div>
        <span>ȱ��Ǽǹ���</span>
        <a href="<%=basePath %>admin/miss/index.jsp" target="mainFrame" onFocus="this.blur()">ȱ��Ǽǹ���</a>
        <%if(sf.equals("�̲ķ���Ա��")){ %>
        <a href="<%=basePath %>admin/miss/add.jsp?method=addmiss" target="mainFrame" onFocus="this.blur()">ȱ���¼�Ǽ�</a> 
        <%} %>
        <a href="<%=basePath %>admin/miss/s.jsp" target="mainFrame" onFocus="this.blur()">ȱ���¼��ѯ</a> 
      </div>
      <%} %>
      <%if(sf.equals("����Ա")){ %>
      <div>
        <span>ע���û�����</span>
        <a href="<%=basePath %>admin/member/index.jsp" target="mainFrame" onFocus="this.blur()">ע���û�����</a>
        <a href="<%=basePath %>admin/member/s.jsp" target="mainFrame" onFocus="this.blur()">ע���û���ѯ</a> 
      </div>
      <%} %>
    </div>
</body>
<%} %>
</html>