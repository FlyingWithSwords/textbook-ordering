package com.action;
/**
 * 管理员登陆 增加 修改 删除  
 */
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean; 
import com.util.Constant; 

public class AdminServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminServlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		String method=request.getParameter("method").trim();
		ComBean cBean = new ComBean();
		HttpSession session = request.getSession();   
		if(method.equals("one")){//用户登录
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String chara = request.getParameter("sf");
			String str=cBean.getString("select id from user where username='"+username+"' and password='"+password+"' and chara='"+chara+"'");
					if(str==null){
						request.setAttribute("message", "登录信息错误！");
						request.getRequestDispatcher("admin/login.jsp").forward(request, response);
					}
					else{
						session.setAttribute("user", username);
						session.setAttribute("sf", chara);
						session.setAttribute("coms", "admin");
						request.getRequestDispatcher("admin/index.jsp").forward(request, response);
					}  
		}
		else if(method.equals("reg")){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String sf = request.getParameter("sf");
			if(sf.equals("用户")) {
				request.getRequestDispatcher("MemberServlet?method=mreg").forward(request, response);
			}
		}
		else if(method.equals("lost")){
			String username = request.getParameter("username"); 
			String email = request.getParameter("email");
			String sf = request.getParameter("sf");
			if(sf.equals("用户")) {
				request.getRequestDispatcher("MemberServlet?method=lost").forward(request, response);
			}
		}
		else if(method.equals("uppwd")){//修改密码
			String username=(String)session.getAttribute("user"); 
			String oldpwd = request.getParameter("oldpwd"); 
			String newpwd = request.getParameter("newpwd"); 
			String str=cBean.getString("select id from user where username='"+username+"' and password='"+oldpwd+"'");
			if(str==null){
				request.setAttribute("message", "原始密码信息错误！");
				request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response); 
			}
			else{
				int flag=cBean.comUp("update user set password='"+newpwd+"' where username='"+username+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response); 
				}
			}
		}
		else if(method.equals("adminexit")){//退出登录
			session.removeAttribute("user");  
			session.removeAttribute("sf");
			session.removeAttribute("password"); 
			session.removeAttribute("coms"); 
			request.getRequestDispatcher("index.jsp").forward(request, response); 
		}
		else if(method.equals("addm")){//增加系统用户
			String username = request.getParameter("username"), 
			password = request.getParameter("password"),
			chara = request.getParameter("chara"),
			email = request.getParameter("email");
			String str=cBean.getString("select id from user where username='"+username+"'");
			if(str==null){ 
					int flag=cBean.comUp("insert into user(username,password,email,chara,time) " +
							"values('"+username+"','"+password+"','"+email+"','"+chara+"','"+date+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
					} 
			}
			else{
				request.setAttribute("message", "该用户名已存在！");
				request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
			} 
		}
		else if(method.equals("upm")){//修改系统用户
			String id = request.getParameter("id");
			String password = request.getParameter("password"),
					username = request.getParameter("username"),
					email = request.getParameter("email");
			int flag=cBean.comUp("update user set password='"+password+"',email='"+email+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delm")){//删除系统用户
			String id = request.getParameter("id");  
			int flag=cBean.comUp("delete from user where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/system/index.jsp").forward(request, response); 
			}
		} 
		else if(method.equals("upm2")){//修改系统用户
			String id = request.getParameter("id");
			String username=request.getParameter("username"),
			password = request.getParameter("password"),
					email = request.getParameter("email");
			int flag=cBean.comUp("update user set password='"+password+"',email='"+email+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/system/index2.jsp").forward(request, response);
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/system/index2.jsp").forward(request, response); 
			}
		}
		else{//无参数传入转到错误页面
			request.getRequestDispatcher("error.jsp").forward(request, response);
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
