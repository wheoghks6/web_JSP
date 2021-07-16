package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.NoticeDao;
import com.model.Notice;

/**
 * Servlet implementation class upload_notice
 */
@WebServlet("/upload_notice")
public class upload_notice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public upload_notice() {
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
	    request.setCharacterEncoding("UTF-8");
	    Notice notice = new Notice();
	    notice.setTitle(request.getParameter("title"));
	    notice.setUser_id(request.getParameter("user_id"));
	    notice.setContent(request.getParameter("content").replace("\r\n", "<br>"));
	    notice.setReadcount(0);
	    System.out.print(notice.toString());
	    NoticeDao noticedao = new NoticeDao();
	    if(notice.getTitle() == null || notice.getUser_id() == null || notice.getContent() == null)
	    {
	    	PrintWriter out = response.getWriter();
			String str = "<script>alert('모든 정보를 입력하세요')history.back()</script>";
			out.println(str);
	    }
	    
	    int result = noticedao.addNotice(notice);
	    if(result == 1)
	    {
	    	PrintWriter out = response.getWriter();
			String str = "<script>alert('글이 등록되었습니다.')</script>";
			str += "<script>location.href='notice.jsp'</script>";
			out.println(str);
	    }
	    else
	    {
	    	PrintWriter out = response.getWriter();
			String str = "<script>alert('글 등록에 실패했습니다.')</script>";
			str+= "<script>history.back()</script>";
			out.println(str);	
	    }
	    
	}

}
