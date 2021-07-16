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
 * Servlet implementation class update_notice
 */
@WebServlet("/update_notice")
public class update_notice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_notice() {
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
	    Notice notice = new  Notice();
	    notice.setTitle(request.getParameter("title"));
	    notice.setUser_id(request.getParameter("user_id"));
	    notice.setContent(request.getParameter("content"));
	    notice.setNotice_num(Integer.parseInt(request.getParameter("num")));
	    System.out.println(notice.toString());
	    NoticeDao noticedao = new NoticeDao();
	    if(notice.getTitle() == null || notice.getUser_id() == null || notice.getContent() == null)
	    {
	    	PrintWriter out = response.getWriter();
			String str = "<script>alert('모든 정보를 입력하세요')history.back()</script>";
			out.println(str);
	    }
	    
	    int result = noticedao.updateNotice(notice);
	    if(result == 1)
	    {
	    	PrintWriter out = response.getWriter();
			String str = "<script>alert('글이 수정되었습니다.')</script>";
			str += "<script>location.href='notice.jsp'</script>";
			out.println(str);
	    }
	    else
	    {
	    	PrintWriter out = response.getWriter();
			String str = "<script>alert('글 수정에 실패했습니다.')</script>";
			str+= "<script>history.back()</script>";
			out.println(str);	
	    }
	    
	}

}
