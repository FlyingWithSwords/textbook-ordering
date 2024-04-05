package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;
import com.util.DBO;

public class ComServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ComServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method"); 
		String com=session.getAttribute("coms").toString();
		if(method.equals("addbd")){  // 增加书库图书
			String id = request.getParameter("id"); 
			String bookname = request.getParameter("bookname"), 
					writer = request.getParameter("writer"), 
					pub = request.getParameter("public"),
					price = request.getParameter("price"),
					total = request.getParameter("total");
			String str=cBean.getString("select id from bookdepot where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"' and price like '"+price+"'");
			if(str==null){
				int flag = cBean.comUp("insert into bookdepot(bookname,writer,public,price,total) values('"+bookname+"','"+writer+"','"+pub+"','"+price+"','"+total+"' )");
				if(flag == Constant.SUCCESS){
					request.setAttribute("message", "操作成功！");
					response.sendRedirect(com+"/bd/index.jsp");
				}
				else{
					request.setAttribute("message", "操作失败！");
					response.sendRedirect(com+"/bd/index.jsp");
				} 
			}
			else{
				request.setAttribute("message", "信息重复！");
				response.sendRedirect(com+"/bd/index.jsp");
			}
			
		} 
		else if(method.equals("upbd")){ //修改图书信息
			String id = request.getParameter("id"); 
			String bookname = request.getParameter("bookname"), 
					writer = request.getParameter("writer"), 
					pub = request.getParameter("public"),
					price = request.getParameter("price"),
					total = request.getParameter("total");
			String str=cBean.getString("select id from bookdepot where id='"+id+"'");
			if(str!=null){
				int flag = cBean.comUp("update bookdepot set bookname='"+bookname+"',writer='"+writer+"',public='"+pub+"',price='"+price+"',total='"+total+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher(com+"/bd/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher(com+"/bd/index.jsp").forward(request, response);
				}
			}
			else{
				request.setAttribute("message", "信息未发布成功！");
				request.getRequestDispatcher(com+"/bd/index.jsp").forward(request, response);
			}
		} 
		else if(method.equals("delbd")){//删除 图书信息
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from bookdepot where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher(com+"/bd/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher(com+"/bd/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("addbuy")){  // 增加购买图书
			String id = request.getParameter("id"); 
			String bookname = request.getParameter("bookname"), 
					writer = request.getParameter("writer"), 
					pub = request.getParameter("public"),
					user = request.getParameter("user"),
					state = request.getParameter("state"),
					num = request.getParameter("num");
			String str=cBean.getString("select id from buybook where id='"+id+"'");
			if(str==null){
				int flag = cBean.comUp("insert into buybook(bookname,writer,public,num,user,state,time) values('"+bookname+"','"+writer+"','"+pub+"','"+num+"','"+user+"','"+"未审核"+"','"+date2+"' )");
				if(flag == Constant.SUCCESS){
					request.setAttribute("message", "操作成功！");
					response.sendRedirect(com+"/buy/index.jsp");
				}
				else{
					request.setAttribute("message", "操作失败！");
					response.sendRedirect(com+"/buy/index.jsp");
				} 
			}
			else{
				request.setAttribute("message", "信息重复！");
				response.sendRedirect(com+"/buy/index.jsp");
			}
			
		} 
		else if(method.equals("upbuy")){ //修改购买信息
			String id = request.getParameter("id"); 
			String bookname = request.getParameter("bookname"), 
					writer = request.getParameter("writer"), 
					pub = request.getParameter("public"),
					user = request.getParameter("user"),
					state = request.getParameter("state"),
					num = request.getParameter("num");
			String str=cBean.getString("select id from buybook where id='"+id+"'");
			List listlib = cBean.getCom("select * from bookdepot where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"'", 6);
			if(str!=null){
				if(state.equals("已通过")) {
					if(!listlib.isEmpty()) {
						int flag0 = cBean.comUp("insert into outbook(bookname,writer,public,price,user,state,total,time) values('"+bookname+"','"+writer+"','"+pub+"','"+((ArrayList)listlib.get(0)).get(4).toString()+"','"+user+"','"+"未出库"+"','"+num+"','"+date2+"' )");
					}
					else {
						int flag0 = cBean.comUp("insert into outbook(bookname,writer,public,price,user,state,total,time) values('"+bookname+"','"+writer+"','"+pub+"','"+"0"+"','"+user+"','"+"未出库"+"','"+num+"','"+date2+"' )");
					}
				}
				int flag = cBean.comUp("update buybook set bookname='"+bookname+"',writer='"+writer+"',public='"+pub+"',num='"+num+"',user='"+user+"',state='"+state+"',time='"+date2+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher(com+"/buy/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher(com+"/buy/index.jsp").forward(request, response);
				}
			}
			else{
				request.setAttribute("message", "信息未发布成功！");
				request.getRequestDispatcher(com+"/buy/index.jsp").forward(request, response);
			}
		} 
		else if(method.equals("delbuy")){//删除 购买信息
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from buybook where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher(com+"/buy/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher(com+"/buy/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("addin")){  // 增加入库图书
			String id = request.getParameter("id"); 
			String bookname = request.getParameter("bookname"), 
					writer = request.getParameter("writer"), 
					pub = request.getParameter("public"),
					price = request.getParameter("price"),
					total = request.getParameter("total");
			String str=cBean.getString("select id from inbook where id='"+id+"'");
			List listlib=cBean.getCom("select * from bookdepot where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"' and price like '"+price+"'",6);
			List listlib1=cBean.getCom("select * from missbook where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"' and price like '"+price+"'",6);
			if(str==null){
				if(!listlib.isEmpty()) {
					int flag0 = cBean.comUp("update bookdepot set total='"+(Integer.parseInt(total)+Integer.parseInt(((ArrayList)listlib.get(0)).get(5).toString()))+"' where id='"+((ArrayList)listlib.get(0)).get(0).toString()+"'");
					if(!listlib1.isEmpty()) {
						if((Integer.parseInt(total)-Integer.parseInt(((ArrayList)listlib1.get(0)).get(5).toString()))>=0) {
							int flag1=cBean.comUp("update missbook set state='已补', total='0' where id='"+((ArrayList)listlib1.get(0)).get(0).toString()+"'");
							int flag2=cBean.comUp("delete from missbook where id='"+((ArrayList)listlib1.get(0)).get(0).toString()+"'");
						}
						else {
							int flag1=cBean.comUp("update missbook set state='待补', time='"+date2+"', total='"+(Integer.parseInt(((ArrayList)listlib1.get(0)).get(5).toString())-Integer.parseInt(total))+"' where id='"+((ArrayList)listlib1.get(0)).get(0).toString()+"'");
						}
					}
				}
				else {
					int flag0 = cBean.comUp("insert into bookdepot(bookname,writer,public,price,total) values('"+bookname+"','"+writer+"','"+pub+"','"+price+"','"+total+"' )");
				}
				int flag = cBean.comUp("insert into inbook(bookname,writer,public,price,total,time) values('"+bookname+"','"+writer+"','"+pub+"','"+price+"','"+total+"','"+date2+"' )");
				if(flag == Constant.SUCCESS){
					request.setAttribute("message", "操作成功！");
					response.sendRedirect(com+"/in/index.jsp");
				}
				else{
					request.setAttribute("message", "操作失败！");
					response.sendRedirect(com+"/in/index.jsp");
				} 
			}
			else{
				request.setAttribute("message", "信息重复！");
				response.sendRedirect(com+"/in/index.jsp");
			}
			
		} 
		else if(method.equals("upin")){ //修改入库信息
			String id = request.getParameter("id"); 
			String bookname = request.getParameter("bookname"), 
					writer = request.getParameter("writer"), 
					pub = request.getParameter("public"),
					price = request.getParameter("price"),
					total = request.getParameter("total");
			String str=cBean.getString("select id from inbook where id='"+id+"'");
			List liststr=cBean.getCom("select * from inbook where id='"+id+"'", 7);
			List listlib=cBean.getCom("select * from bookdepot where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"' and price like '"+price+"'",6);
			List listlib1=cBean.getCom("select * from missbook where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"' and price like '"+price+"'",6);
			if(str!=null){
				if(!listlib.isEmpty()) {
					int flag0 = cBean.comUp("update bookdepot set total='"+((Integer.parseInt(total)-Integer.parseInt(((ArrayList)liststr.get(0)).get(5).toString()))+Integer.parseInt(((ArrayList)listlib.get(0)).get(5).toString()))+"' where id='"+((ArrayList)listlib.get(0)).get(0).toString()+"'");
					if(!listlib1.isEmpty()) {
						if(((Integer.parseInt(total)-Integer.parseInt(((ArrayList)liststr.get(0)).get(5).toString()))-Integer.parseInt(((ArrayList)listlib1.get(0)).get(5).toString()))>=0) {
							int flag1=cBean.comUp("update missbook set state='已补', total='0' where id='"+((ArrayList)listlib1.get(0)).get(0).toString()+"'");
							int flag2=cBean.comUp("delete from missbook where id='"+((ArrayList)listlib1.get(0)).get(0).toString()+"'");
						}
						else {
							int flag1=cBean.comUp("update missbook set state='待补', time='"+date2+"', total='"+(Integer.parseInt(((ArrayList)listlib1.get(0)).get(5).toString())-(Integer.parseInt(total)-Integer.parseInt(((ArrayList)liststr.get(0)).get(5).toString())))+"' where id='"+((ArrayList)listlib1.get(0)).get(0).toString()+"'");
						}
					}
				}
				else {
					int flag0 = cBean.comUp("insert into bookdepot(bookname,writer,public,price,total) values('"+bookname+"','"+writer+"','"+pub+"','"+price+"','"+total+"' )");
				}
				int flag = cBean.comUp("update inbook set bookname='"+bookname+"',writer='"+writer+"',public='"+pub+"',price='"+price+"',total='"+total+"',time='"+date2+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher(com+"/in/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher(com+"/in/index.jsp").forward(request, response);
				}
			}
			else{
				request.setAttribute("message", "信息未发布成功！");
				request.getRequestDispatcher(com+"/in/index.jsp").forward(request, response);
			}
		} 
		else if(method.equals("delin")){//删除 入库信息
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from inbook where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher(com+"/in/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher(com+"/in/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("addout")){  // 增加出库图书
			String id = request.getParameter("id"); 
			String bookname = request.getParameter("bookname"), 
					writer = request.getParameter("writer"), 
					pub = request.getParameter("public"),
					user = request.getParameter("user"),
					state = request.getParameter("state"),
					price = request.getParameter("price"),
					total = request.getParameter("total");
			String str=cBean.getString("select id from outbook where id='"+id+"'");
			List listlib=cBean.getCom("select * from bookdepot where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"' and price like '"+price+"'",6);
			List listlib1=cBean.getCom("select * from missbook where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"' and price like '"+price+"'",6);
			if(str==null){
				if(!listlib.isEmpty() && state.equals("已出库")) {
					if(Integer.parseInt(((ArrayList)listlib.get(0)).get(5).toString())-Integer.parseInt(total)>=0) {
						int flag0 = cBean.comUp("update bookdepot set total='"+(Integer.parseInt(((ArrayList)listlib.get(0)).get(5).toString())-Integer.parseInt(total))+"' where id='"+((ArrayList)listlib.get(0)).get(0).toString()+"'");
					}
					else {
						if(!listlib1.isEmpty()) {
							int flag1=cBean.comUp("update missbook set state='未补', time='"+date2+"', total='"+(Integer.parseInt(((ArrayList)listlib1.get(0)).get(5).toString())+(Integer.parseInt(total)-Integer.parseInt(((ArrayList)listlib.get(0)).get(5).toString())))+"' where id='"+((ArrayList)listlib1.get(0)).get(0).toString()+"'");
						}
						else {
							int flag1 = cBean.comUp("insert into missbook(bookname,writer,public,price,total,state,time) values('"+bookname+"','"+writer+"','"+pub+"','"+price+"','"+(Integer.parseInt(total)-Integer.parseInt(((ArrayList)listlib.get(0)).get(5).toString()))+"','"+"缺少"+"','"+date2+"' )");
						}
						total=((ArrayList)listlib.get(0)).get(5).toString();
						state="出库失败";	
						}
				}
				int flag = cBean.comUp("insert into outbook(bookname,writer,public,price,user,state,total,time) values('"+bookname+"','"+writer+"','"+pub+"','"+price+"','"+user+"','"+state+"','"+total+"','"+date2+"' )");
				if(flag == Constant.SUCCESS){
					request.setAttribute("message", "操作成功！");
					response.sendRedirect(com+"/out/index.jsp");
				}
				else{
					request.setAttribute("message", "操作失败！");
					response.sendRedirect(com+"/out/index.jsp");
				} 
			}
			else{
				request.setAttribute("message", "信息重复！");
				response.sendRedirect(com+"/out/index.jsp");
			}
			
		} 
		else if(method.equals("upout")){ //修改出库信息
			String id = request.getParameter("id"); 
			String bookname = request.getParameter("bookname"), 
					writer = request.getParameter("writer"), 
					pub = request.getParameter("public"),
					user = request.getParameter("user"),
					state = request.getParameter("state"),
					price = request.getParameter("price"),
					total = request.getParameter("total");
			String str=cBean.getString("select id from outbook where id='"+id+"'");
			List liststr=cBean.getCom("select * from outbook where id='"+id+"'", 9);
			List listlib=cBean.getCom("select * from bookdepot where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"' and price like '"+price+"'",6);
			List listlib1=cBean.getCom("select * from missbook where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"' and price like '"+price+"'",6);
			if(str!=null){
				if(state.equals("已出库")) {
					if(!listlib.isEmpty()) {
						if(Integer.parseInt(((ArrayList)listlib.get(0)).get(5).toString())-Integer.parseInt(total)>=0) {
							int flag0 = cBean.comUp("update bookdepot set total='"+(Integer.parseInt(((ArrayList)listlib.get(0)).get(5).toString())-Integer.parseInt(total))+"' where id='"+((ArrayList)listlib.get(0)).get(0).toString()+"'");
							int flag00=cBean.comUp("delete from buybook where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"' and user='"+user+"' and state='已通过'");
						}
						else {
							if(!listlib1.isEmpty()) {
								int flag1=cBean.comUp("update missbook set state='未补', time='"+date2+"', total='"+(Integer.parseInt(((ArrayList)listlib1.get(0)).get(5).toString())+(Integer.parseInt(total)-Integer.parseInt(((ArrayList)listlib.get(0)).get(5).toString())))+"' where id='"+((ArrayList)listlib1.get(0)).get(0).toString()+"'");
							}
							else {
								int flag1 = cBean.comUp("insert into missbook(bookname,writer,public,price,total,state,time) values('"+bookname+"','"+writer+"','"+pub+"','"+price+"','"+(Integer.parseInt(total)-Integer.parseInt(((ArrayList)listlib.get(0)).get(5).toString()))+"','"+"缺少"+"','"+date2+"' )");
							}
							total=((ArrayList)listlib.get(0)).get(5).toString();
							state="出库失败";	
						}
					}
				}
				int flag = cBean.comUp("update outbook set bookname='"+bookname+"',writer='"+writer+"',public='"+pub+"',price='"+price+"',user='"+user+"',state='"+state+"',total='"+total+"',time='"+date2+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher(com+"/out/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher(com+"/out/index.jsp").forward(request, response);
				}
			}
			else{
				request.setAttribute("message", "信息未发布成功！");
				request.getRequestDispatcher(com+"/out/index.jsp").forward(request, response);
			}
		} 
		else if(method.equals("delout")){//删除 出库信息
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from outbook where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher(com+"/out/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher(com+"/out/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("addmiss")){  // 增加缺货图书
			String id = request.getParameter("id"); 
			String bookname = request.getParameter("bookname"), 
					writer = request.getParameter("writer"), 
					pub = request.getParameter("public"),
					price = request.getParameter("price"),
					total = request.getParameter("total"),
					state = request.getParameter("state");
			String str=cBean.getString("select id from missbook where id='"+id+"'");
			List listlib1=cBean.getCom("select * from missbook where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"' and price like '"+price+"'",6);
			if(str==null){
				if(!listlib1.isEmpty()) {
					int flag1=cBean.comUp("update missbook set state='未补', time='"+date2+"', total='"+(Integer.parseInt(((ArrayList)listlib1.get(0)).get(5).toString())+Integer.parseInt(total))+"' where id='"+((ArrayList)listlib1.get(0)).get(0).toString()+"'");
					if(flag1 == Constant.SUCCESS){
						request.setAttribute("message", "操作成功！");
						response.sendRedirect(com+"/miss/index.jsp");
					}
					else{
						request.setAttribute("message", "操作失败！");
						response.sendRedirect(com+"/miss/index.jsp");
					} 
				}
				else {
					int flag = cBean.comUp("insert into missbook(bookname,writer,public,price,total,state,time) values('"+bookname+"','"+writer+"','"+pub+"','"+price+"','"+total+"','"+state+"','"+date2+"' )");
					if(flag == Constant.SUCCESS){
						request.setAttribute("message", "操作成功！");
						response.sendRedirect(com+"/miss/index.jsp");
					}
					else{
						request.setAttribute("message", "操作失败！");
						response.sendRedirect(com+"/miss/index.jsp");
					} 
				}
			}
			else{
				request.setAttribute("message", "信息重复！");
				response.sendRedirect(com+"/miss/index.jsp");
			}
			
		} 
		else if(method.equals("upmiss")){ //修改缺货信息
			String id = request.getParameter("id"); 
			String bookname = request.getParameter("bookname"), 
					writer = request.getParameter("writer"), 
					pub = request.getParameter("public"),
					price = request.getParameter("price"),
					total = request.getParameter("total"),
					state = request.getParameter("state");
			String str=cBean.getString("select id from missbook where id='"+id+"'");
			if(str!=null){
				int flag = cBean.comUp("update missbook set bookname='"+bookname+"',writer='"+writer+"',public='"+pub+"',price='"+price+"',total='"+total+"',state='"+state+"',time='"+date2+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher(com+"/miss/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher(com+"/miss/index.jsp").forward(request, response);
				}
			}
			else{
				request.setAttribute("message", "信息未发布成功！");
				request.getRequestDispatcher(com+"/miss/index.jsp").forward(request, response);
			}
		} 
		else if(method.equals("delmiss")){//删除缺货信息
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from missbook where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher(com+"/miss/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher(com+"/miss/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("addready")){  // 增加待购图书
			String id = request.getParameter("id"); 
			String bookname = request.getParameter("bookname"), 
					writer = request.getParameter("writer"), 
					pub = request.getParameter("public"),
					price = request.getParameter("price"),
					total = request.getParameter("total"),
					state = request.getParameter("state");
			String str=cBean.getString("select id from readybook where id='"+id+"'");
			List listlib=cBean.getCom("select * from bookdepot where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"' and price like '"+price+"'",6);
			List listlib1=cBean.getCom("select * from missbook where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"' and price like '"+price+"'",6);
			if(str==null){
//				if(state.equals("已购")) {
//					if(!listlib.isEmpty()) {
//						int flag0 = cBean.comUp("update bookdepot set total='"+(Integer.parseInt(total)+Integer.parseInt(((ArrayList)listlib.get(0)).get(5).toString()))+"' where id='"+((ArrayList)listlib.get(0)).get(0).toString()+"'");
//						int flag1 = cBean.comUp("insert into inbook(bookname,writer,public,price,total,time) values('"+bookname+"','"+writer+"','"+pub+"','"+price+"','"+total+"','"+date2+"' )");
//						if(!listlib1.isEmpty()) {
//							if((Integer.parseInt(total)-Integer.parseInt(((ArrayList)listlib1.get(0)).get(5).toString()))>=0) {
//								int flag2=cBean.comUp("update missbook set state='已补', total='0' where id='"+((ArrayList)listlib1.get(0)).get(0).toString()+"'");
//								int flag3=cBean.comUp("delete from missbook where id='"+((ArrayList)listlib1.get(0)).get(0).toString()+"'");
//							}
//							else {
//								int flag2=cBean.comUp("update missbook set state='待补', time='"+date2+"', total='"+(Integer.parseInt(((ArrayList)listlib1.get(0)).get(5).toString())-Integer.parseInt(total))+"' where id='"+((ArrayList)listlib1.get(0)).get(0).toString()+"'");
//							}
//						}
//					}
//					else {
//						int flag0 = cBean.comUp("insert into bookdepot(bookname,writer,public,price,total) values('"+bookname+"','"+writer+"','"+pub+"','"+price+"','"+total+"' )");
//					}
//				}
				int flag = cBean.comUp("insert into readybook(bookname,writer,public,price,total,state,time) values('"+bookname+"','"+writer+"','"+pub+"','"+price+"','"+total+"','"+state+"','"+date2+"' )");
				if(flag == Constant.SUCCESS){
					request.setAttribute("message", "操作成功！");
					response.sendRedirect(com+"/ready/index.jsp");
				}
				else{
					request.setAttribute("message", "操作失败！");
					response.sendRedirect(com+"/ready/index.jsp");
				} 
			}
			else{
				request.setAttribute("message", "信息重复！");
				response.sendRedirect(com+"/ready/index.jsp");
			}
			
		} 
		else if(method.equals("upready")){ //修改待购信息
			String id = request.getParameter("id"); 
			String bookname = request.getParameter("bookname"), 
					writer = request.getParameter("writer"), 
					pub = request.getParameter("public"),
					price = request.getParameter("price"),
					total = request.getParameter("total"),
					state = request.getParameter("state");
			String str=cBean.getString("select id from readybook where id='"+id+"'");
			List listlib=cBean.getCom("select * from bookdepot where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"' and price like '"+price+"'",6);
			List listlib1=cBean.getCom("select * from missbook where bookname='"+bookname+"' and writer='"+writer+"' and public='"+pub+"' and price like '"+price+"'",6);
			if(str!=null){
//				if(state.equals("已购")) {
//					if(!listlib.isEmpty()) {
//						int flag0 = cBean.comUp("update bookdepot set total='"+(Integer.parseInt(total)+Integer.parseInt(((ArrayList)listlib.get(0)).get(5).toString()))+"' where id='"+((ArrayList)listlib.get(0)).get(0).toString()+"'");
//						int flag1 = cBean.comUp("insert into inbook(bookname,writer,public,price,total,time) values('"+bookname+"','"+writer+"','"+pub+"','"+price+"','"+total+"','"+date2+"' )");
//						if(!listlib1.isEmpty()) {
//							if((Integer.parseInt(total)-Integer.parseInt(((ArrayList)listlib1.get(0)).get(5).toString()))>=0) {
//								int flag2=cBean.comUp("update missbook set state='已补', total='0' where id='"+((ArrayList)listlib1.get(0)).get(0).toString()+"'");
//								int flag3=cBean.comUp("delete from missbook where id='"+((ArrayList)listlib1.get(0)).get(0).toString()+"'");
//							}
//							else {
//								int flag2=cBean.comUp("update missbook set state='待补', time='"+date2+"', total='"+(Integer.parseInt(((ArrayList)listlib1.get(0)).get(5).toString())-Integer.parseInt(total))+"' where id='"+((ArrayList)listlib1.get(0)).get(0).toString()+"'");
//							}
//						}
//					}
//					else {
//						int flag0 = cBean.comUp("insert into bookdepot(bookname,writer,public,price,total) values('"+bookname+"','"+writer+"','"+pub+"','"+price+"','"+total+"' )");
//					}
//				}
				int flag = cBean.comUp("update readybook set bookname='"+bookname+"',writer='"+writer+"',public='"+pub+"',price='"+price+"',total='"+total+"',state='"+state+"',time='"+date2+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher(com+"/ready/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher(com+"/ready/index.jsp").forward(request, response);
				}
			}
			else{
				request.setAttribute("message", "信息未发布成功！");
				request.getRequestDispatcher(com+"/ready/index.jsp").forward(request, response);
			}
		} 
		else if(method.equals("delready")){//删除待购信息
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from readybook where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher(com+"/ready/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher(com+"/ready/index.jsp").forward(request, response);
			}
		}
		

	}
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
