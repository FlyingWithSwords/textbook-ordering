<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8"%>  
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> </title>
<link href="<%=basePath %>admin/css/css.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath %>admin/css/main.css" type="text/css" rel="stylesheet" /> 
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#searchmain{ font-size:12px;}
#search{ font-size:12px; background:#548fc9; margin:10px 10px 0 0; display:inline; width:100%; color:#FFF}
#search form span{height:40px; line-height:40px; padding:0 0px 0 10px; float:left;}
#search form input.text-word{height:24px; line-height:24px; width:180px; margin:8px 0 6px 0; padding:0 0px 0 10px; float:left; border:1px solid #FFF;}
#search form input.text-but{height:24px; line-height:24px; width:55px; background:url(<%=basePath %>admin/images/main/list_input.jpg) no-repeat left top; 
border:none; cursor:pointer; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666; float:left; margin:8px 0 0 6px; display:inline;}
#search a.add{ background:url(<%=basePath %>admin/images/main/add.jpg) no-repeat 0px 6px; padding:0 10px 0 26px; height:40px; line-height:40px; 
font-size:14px; font-weight:bold; color:#FFF}
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
.bggray{ background:#f9f9f9; font-size:14px; font-weight:bold; padding:10px 10px 10px 0; width:120px;}
.main-for{ padding:10px;}
/*宽度310 一般文本 */
.main-for input.text-word{ width:310px; height:36px; line-height:36px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; padding:0 10px;}
/*宽度510 长文本 */
.main-for input.text-wordwide{ width:510px; height:36px; line-height:36px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; padding:0 10px;}
.main-for select{ width:310px; height:36px; line-height:36px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666;}
.main-for input.text-but{ width:100px; height:40px; line-height:30px; border: 1px solid #0087d5; background:#1b95da; border-radius:0.5em; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#fff; 
float:left; margin:0 10px 0 0; display:inline; cursor:pointer; font-size:14px; font-weight:bold;}
#addinfo a{ font-size:14px; font-weight:bold; background:url(<%=basePath %>admin/images/main/addinfoblack.jpg) no-repeat 0 1px; padding:0px 0 0px 20px; line-height:45px;}
#addinfo a:hover{ background:url(<%=basePath %>admin/images/main/addinfoblue.jpg) no-repeat 0 1px;}
/*文本域 */
textarea{width:310px;height:100px;line-height:36px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; padding:0 10px;}

</style>

	<link rel="stylesheet" href="<%=basePath %>editor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=basePath %>editor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=basePath %>editor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '<%=basePath %>editor/plugins/code/prettify.css',
				uploadJson : '<%=basePath %>editor/jsp/upload_json.jsp',
				fileManagerJson : '<%=basePath %>editor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
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
	
	String username=(String)session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(basePath+"index.jsp");
	}
	else{
		String method=request.getParameter("method");
		String id="";String bookname="";String writer="";String pub="";String price="",total="",user="",state="";String time=""; 
		if(method.equals("upout")){
			id=request.getParameter("id");
			List alist=cb.get1Com("select * from outbook where id='"+id+"'",9);
			bookname=alist.get(1).toString();
			writer=alist.get(2).toString();
			pub=alist.get(3).toString(); 
			price=alist.get(4).toString();
			user=alist.get(5).toString();
			state=alist.get(6).toString();
			total=alist.get(7).toString();
			time=alist.get(8).toString();
		}
%>
<body>
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td align="left" valign="top">
    <form action="<%=basePath %>ComServlet" method="post" name="form1">  
    <input type="hidden" name="method" value="<%=method%>" /><input type="hidden" name="id" value="<%=id%>" />
      <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">书名：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for"> 
        <select name="bookname" id="bookname" onClick="javascript:{document.all.writer.value=this.options[this.selectedIndex].getAttribute('writer');document.all.public.value=this.options[this.selectedIndex].getAttribute('pub');document.all.price.value=this.options[this.selectedIndex].getAttribute('price');}" required>
        <%if(method.equals("upout")){ %>
    		  <option value=<%=bookname %>><%=bookname %></option><%}
        	List listlib0=cb.getCom("select * from bookdepot order by id desc", 6);
        	for(int i=0;i<listlib0.size();i++){
        		ArrayList list0=(ArrayList)listlib0.get(i);
        %>
    		  <option value="<%=list0.get(1).toString() %>" writer="<%=list0.get(2).toString()%>" pub="<%=list0.get(3).toString()%>" price="<%=list0.get(4).toString()%>"><%=list0.get(1).toString() %></option>
    	<%} %>
        </select>
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">作者：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" name="writer" class="text-word" value="<%=writer %>" required/>
        </td>
        </tr>
        <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">出版社：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for"> 
        <input type="text" name="public" class="text-word" value="<%=pub %>" required/>    
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">单价：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="number" min="0.01" step="0.01" class="text-word" name="price" value="<%=price %>" required/>
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">数量：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for"> 
        <input type="number" min="1" name="total" class="text-word" value="<%=total %>" required/>    
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">订购者：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <select name="user" required>
    		  <option value=<%=user %>><%=user %></option><%
        	List listlib=cb.getCom("select * from user order by id desc", 6);
        	for(int i=0;i<listlib.size();i++){
        		ArrayList list1=(ArrayList)listlib.get(i);
        %>
    		  <option value="<%=list1.get(1).toString() %>"><%=list1.get(1).toString() %></option>
    	<%} %>
        </select>
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">状态：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <select name="state" required>
    		  <option value=<%=state %>><%=state %></option>
    		  <option value="未出库">未出库</option>
    		  <option value="已出库">已出库</option>
        </select>
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">&nbsp;</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input name="" type="submit" value="提交" class="text-but"></td>
      </tr>
    </table>
    </form>
    </td>
    </tr>
</table>
</body>
<%} %>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>