<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.io.PrintWriter" %>
        <%@ page import="com.dao.UserDao" %>
    <%@ page import="com.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	String id = request.getParameter("id");
	UserDao userdao = new UserDao();
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
	if(request.getParameter("id") != null) {
		id = request.getParameter("id");
	}
	if(id == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('없는 id입니다..')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	}
	
	if(user_id.equals(id) || user_id.equals("admin")) {
		int result = userdao.deleteUser(id);
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
			script.println("alert('삭제 완료했습니다.')");
			if(user_id.equals("admin"))
			{
				script.println("location.href = 'user_list.jsp'");
			}
			else{
			script.println("location.href = 'logout.jsp'");
			}
			script.println("</script>");
		}
	} 
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("history.back()");
		script.println("</script>");
		
	}
	
	
%>
</body>
</html>