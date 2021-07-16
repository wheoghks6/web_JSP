package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.dao.BoardDao;
import com.model.Board;


/**
 * Servlet implementation class upload_board
 */
@WebServlet("/upload_board")
public class upload_board extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public upload_board() {
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
	    Board board = new Board();
	    board.setTitle(request.getParameter("title"));
	    board.setUser_id(request.getParameter("user_id"));
	    board.setContent(request.getParameter("content").replace("\r\n", "<br>"));
	    board.setReadcount(0);
	    System.out.print(board.toString());
	    BoardDao boarddao = new BoardDao();
	    if(board.getTitle() == null || board.getUser_id() == null || board.getContent() == null)
	    {
	    	PrintWriter out = response.getWriter();
			String str = "<script>alert('모든 정보를 입력하세요')history.back()</script>";
			out.println(str);
	    }
	    
	    int result = boarddao.addBoard(board);
	    if(result == 1)
	    {
	    	PrintWriter out = response.getWriter();
			String str = "<script>alert('글이 등록되었습니다.')</script>";
			str += "<script>location.href='board.jsp'</script>";
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
