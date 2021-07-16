<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.dao.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="com.model.User" scope="page"/>
<jsp:setProperty name="user" property="user_id"/>
<jsp:setProperty name="user" property="password"/>
<jsp:setProperty name="user" property="name"/>
<jsp:setProperty name="user" property="email"/>
<jsp:setProperty name="user" property="phonenum"/>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보수정 처리</title>
</head>
<body>
<%
	String user_id = null;

	if(session.getAttribute("user_id") != null){
		user_id = (String)session.getAttribute("user_id");
	}
	if(user_id != null)
	{
		System.out.println(user.toString());
		if(user.getUser_id() != null && user.getPassword() != null && 
				user.getName() != null && user.getEmail() != null && user.getPhonenum() != null)
		{
			UserDao userdao = new UserDao();
			int result = userdao.updateUser(user);
			if(result == -1)
			{
				System.out.printf("\n%d\n", result);
				out.print("<script>alert('정보수정에 실패했습니다.')</script>");
				out.print("<script>history.back()</script>");
			}
			else
			{
				System.out.printf("\n%d\n", result);
				out.print("<script>alert('회원 정보 수정이 완료되었습니다.')</script>");
				out.print("<script>location.href='index.jsp'</script>");
			}
			
		}
		else
		{
			out.print("<script>alert('모든 정보를 입력해주세요')</script>");
			out.print("<script>history.back()</script>");
		}
	}
	else{
		out.print("<script>alert('로그인 후 사용해주세요')</script>");
		out.print("<script>history.back()</script>");
	}
	
		
	
	
%>
</body>
</html>