<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.io.PrintWriter" %>
 <%@ page import="com.dao.ItemDao" %>
 <%@ page import="com.model.Item" %>
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
		int item_num = 0;
		if(request.getParameter("id") != null) {
			item_num = Integer.parseInt(request.getParameter("id"));
		}
		if(item_num == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('없는 제품입니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		Item item = new ItemDao().getMobileById(item_num);
		if(user_id != null) {
			ItemDao itemDAO = new ItemDao();
			int result = itemDAO.updateMobile_count(item_num);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('구매 실패!')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('구매 완료!')");
				script.println("location.href = 'mobile_list.jsp'");
				script.println("</script>");
			}
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
			
		}
		
		
	%>
</body>
</html>