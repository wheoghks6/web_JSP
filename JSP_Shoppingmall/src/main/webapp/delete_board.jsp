<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
         <%@ page import="com.dao.BoardDao" %>
 <%@ page import="com.model.Board" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String user_id = null;
		if(session.getAttribute("user_id") != null){
			user_id = (String) session.getAttribute("user_id");
		}
		if(user_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		int board_num = 0;
		if(request.getParameter("id") != null) {
			board_num = Integer.parseInt(request.getParameter("id"));
		}
		if(board_num == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('없는 글입니다.')");
			script.println("location.href = 'community.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDao().getBoardById(board_num);
		if(user_id.equals(board.getUser_id()) || user_id.equals("admin")) {
			BoardDao boardDAO = new BoardDao();
			int result = boardDAO.deleteBoard(board_num);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('실패!')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'board.jsp'");
				script.println("</script>");
			}
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'community.jsp'");
			script.println("</script>");
			
		}
		
		
	%>
</body>
</html>