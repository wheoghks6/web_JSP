package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.model.User;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
		User user = new User();
		user.setUser_id(request.getParameter("user_id"));
		user.setPassword(request.getParameter("password"));
		System.out.print("user.setPassword : "+user.getPassword()+"\n");
		
		UserDao userdao = new UserDao();
		
		int login = userdao.login(user.getUser_id(), user.getPassword());
		if(login == 1)
		{
			user = userdao.getUserById(request.getParameter("user_id"));
			HttpSession session = request.getSession();
			session.setAttribute("user_id",user.getUser_id());
			if(session.getAttribute("user_id").equals("admin") == true)
			{
				session.setAttribute("admin", "true");
			}
			PrintWriter out = response.getWriter();
			String str = "<script>location.href='index.jsp'</script>";
			out.println(str);	
		}
		else if(login == 0)
		{
			PrintWriter out = response.getWriter();
			String str = "<script>alert('비밀번호가 틀렸습니다.')</script>";
			str+= "<script>history.back()</script>";
			out.println(str);	
	
		}
		else
		{
			PrintWriter out = response.getWriter();
			String str = "<script>alert('아이디가 존재하지 않습니다.')</script>";
			str+= "<script>history.back()</script>";
			out.println(str);	
		}
	}

}
