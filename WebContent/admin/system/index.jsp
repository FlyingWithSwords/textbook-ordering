<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主要内容区main</title>
<link href="<%=basePath %>admin/css/css.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath %>admin/css/main.css" type="text/css" rel="stylesheet" /> 
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#searchmain{ font-size:12px;}
#search{ font-size:12px; background:#548fc9; margin:10px 10px 0 0; display:inline; width:100%; color:#FFF; float:left}
#search form span{height:40px; line-height:40px; padding:0 0px 0 10px; float:left;}
#search form input.text-word{height:24px; line-height:24px; width:180px; margin:8px 0 6px 0; padding:0 0px 0 10px; float:left; border:1px solid #FFF;}
#search form input.text-but{height:24px; line-height:24px; width:55px; background:url(<%=basePath %>admin/images/main/list_input.jpg) no-repeat left top; 
border:none; cursor:pointer; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666; float:left; margin:8px 0 0 6px; display:inline;}
#search a.add{ background:url(<%=basePath %>admin/images/main/add.jpg) no-repeat -3px 7px #548fc9; padding:0 10px 0 26px; height:40px; line-height:40px; 
font-size:14px; font-weight:bold; color:#FFF; float:right}
#search a:hover.add{ text-decoration:underline; color:#d2e9ff;}
#main-tab{ border:1px solid #eaeaea; background:#FFF; font-size:12px;}
#main-tab th{ font-size:12px; background:url(<%=basePath %>admin/images/main/list_bg.jpg) repeat-x; height:32px; line-height:32px;}
#main-tab td{ font-size:12px; line-height:40px;}
#main-tab td a{ font-size:12px; color:#548fc9;}
#main-tab td a:hover{color:#565656; text-decoration:underline;}
.bordertop{ border-top:1px solid #ebebeb}
.borderright{ border-right:1px solid #ebebeb}
.borderbottom{ border-bottom:1px solid #ebebeb}
.borderleft{ border-left:1px solid #ebebeb}
.gray{ color:#dbdbdb;}
td.fenye{ padding:10px 0 0 0; text-align:right;}
.bggray{ background:#f9f9f9}
</style>
</head>
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>admin/system/index.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
    form3.action="<%=basePath%>admin/system/index.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>admin/system/index.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("已至第一页");
  }else{
    form3.action="<%=basePath%>admin/system/index.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("已至最后一页");
  }else{
    form3.action="<%=basePath%>admin/system/index.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump2(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("跳转文本框中只能输入数字!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//如果跳转文本框中输入的页数超过最后一页的数，则跳到最后一页
	  if(pageCount==0){	
	  form3.action="<%=basePath%>admin/system/index.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>admin/system/index.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//如果你输入的是0，那么就让它等于1
      form3.action="<%=basePath%>admin/system/index.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>admin/system/index.jsp?page="+page;
      form3.submit();
   }

}

}
//****判断是否是Number.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}
function del()
{
	pageform.submit();
}
</script>

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
	
	String username=(String)session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{  
%>
<body>
<form action="" method="post" name="form3">   
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td align="left" valign="top"> 
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
    <tr>
      <th align="center" valign="middle" class="borderright" width="5%">ID</th>
      <th align="center" valign="middle" class="borderright">用户账号</th>  
      <th align="center" valign="middle" class="borderright">密码</th> 
      <th align="center" valign="middle" class="borderright">联系邮箱</th>
      <th align="center" valign="middle" class="borderright">系统身份</th> 
      <th align="center" valign="middle" class="borderright">创建时间</th>   
      <th align="center" valign="middle" width="100">操作</th>
    </tr>
<%
	cb.setEVERYPAGENUM(12);
	int cou = cb.getMessageCount("select count(*) from user where chara != '管理员' and chara!='教师' and chara!='学生'");//得到信息总数			        
	String page1=request.getParameter("page");
	if(page1==null){
		page1="1";
	}
	session.setAttribute("busMessageCount", cou + "");
	session.setAttribute("busPage", page1);
	List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from user where chara!='管理员' and chara!='教师' and chara!='学生' order by id desc",6);
	session.setAttribute("qqq", pagelist1);
	int pageCount = cb.getPageCount(); //得到页数  
	session.setAttribute("busPageCount", pageCount + ""); 
	List pagelist3=(ArrayList)session.getAttribute("qqq");
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);
%>   
    <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
      <td align="center" valign="middle" class="borderright borderbottom"><%=i+1 %></td>   
      <td align="center" valign="middle" class="borderright borderbottom"><%=pagelist2.get(1).toString() %></td>  
      <td align="center" valign="middle" class="borderright borderbottom"><%=pagelist2.get(2).toString() %></td> 
      <td align="center" valign="middle" class="borderright borderbottom"><%=pagelist2.get(3).toString() %></td> 
      <td align="center" valign="middle" class="borderright borderbottom"><%=pagelist2.get(4).toString() %></td>       
      <td align="center" valign="middle" class="borderright borderbottom"><%=pagelist2.get(5).toString() %></td>
      <td align="center" valign="middle" class="borderbottom"> 
      <a onFocus="this.blur()" class="add" href="<%=basePath%>admin/system/add.jsp?method=upm&id=<%=pagelist2.get(0).toString()%>">修改</a>
       <a onFocus="this.blur()" class="add" href="<%=basePath%>AdminServlet?method=delm&id=<%=pagelist2.get(0).toString()%>" onclick="if (confirm('确定要删除吗？')) return true; else return false;"> 删除</a>
      </td>
    </tr> 
<% }} %>  
	</table>
	</td>
  </tr>
  <tr>
    <td valign="top" class="fenye">
    <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//用于给上面javascript传值-->
	 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//用于给上面javascript传值-->         
					<a href="#" onClick="top2()" onFocus="this.blur()">首页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="pre2()" onFocus="this.blur()">上一页</a>&nbsp;&nbsp;&nbsp;
		 共<%=session.getAttribute("busMessageCount").toString()%>条记录,共计<%=session.getAttribute("busPageCount").toString()%>页,当前第<%=session.getAttribute("busPage").toString()%>页&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="next2()" onFocus="this.blur()">下一页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="last2()" onFocus="this.blur()">尾页</a>&nbsp;&nbsp;&nbsp;
	 第&nbsp;<input name="busjump" type="text" size="5"/>&nbsp;页&nbsp; <a href="#" onClick="bjump2()" onFocus="this.blur()">&nbsp;转到</a>
    </td>
  </tr>
</table> 
</form> 
</body>
<%} %>
