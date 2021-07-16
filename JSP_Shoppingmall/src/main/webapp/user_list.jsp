<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.List"%>
 <%@ page import="com.dao.*" %>
  <%@ page import="com.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pw4ngc0 mall</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
       #wrap {
    width: 1000px;
	margin:auto;
}
table{
    width: 100%;
    border-collapse: collapse;
    line-height: 24px;
}
table td,th {
    border-top:1px solid blue;
    border-bottom:1px solid blue;
    border-collapse: collapse;
    text-align: center;
    padding: 10px;
}
th {
	background: rgb(221, 221, 221);
}
a{
    text-decoration: none;
    color: blue;
}
a:hover{
    text-decoration: underline;
}
    </style>
</head>
<body>
<div class="top_header">
	<div class="top_logo">
	<h1><a href="./index.jsp"><img src="./img/logo.png"></a></h1>
	</div>
	
		<form method="post" action="Search.jsp">
	
			<div class="search_area">
			<input type="text" name="search_text" class="search_text">
			<input type="submit" value="검색" class="search_button">
		</div>
		</form>
	
	<div class="my_service">
<%
	String id = (String)session.getAttribute("user_id");
	if(id == null){%>
		<a href="./login.jsp"><img src="./img/login.png" class="login_button"></a>
		<a href="./register.jsp"><img src="./img/register.png" class="register_button"></a>
		<%} else{%>
			<a href="./user_info_update.jsp"><img src="./img/info_update.png"></a>
			<a href="./logout.jsp"><img src="./img/logout.png" ></a>
		<%} 
%>

	</div>
</div>
<%
	String admin = (String)session.getAttribute("admin");
	if(admin != null){
		if(admin.equals("true"))
		{
%>
<nav>
	<ul class="nav-container">
		<li class="nav-item"><a href="computer_list.jsp">노트북/컴퓨터</a></li>
		<li class="nav-item"><a href="mobile_list.jsp">테블릿/모바일</a></li>
		<li class="nav-item"><a href="board.jsp">게시판</a></li>
		<li class="nav-item"><a href="notice.jsp">공지사항</a></li>
		<li class="nav-item"><a href="user_list.jsp">회원목록</a>
	</ul>
</nav>
<%}}else{ %>
<nav>
	<ul class="nav-container">
		<li class="nav-item"><a href="computer_list.jsp">노트북/컴퓨터</a></li>
		<li class="nav-item"><a href="mobile_list.jsp">테블릿/모바일</a></li>
		<li class="nav-item"><a href="board.jsp">게시판</a></li>
		<li class="nav-item"><a href="notice.jsp">공지사항</a></li>
	</ul>
</nav>
<%} %>
<center>
<div id="wrap">
<h3>회원정보 목록</h3>
<table>
<tr align="center">
	<td>아이디</td>
	<td>패스워드</td>
	<td>이름</td>
	<td>이메일</td>
	<td>휴대폰번호</td>
	
</tr>
<%
	UserDao dao = new UserDao();
	List<User> users = dao.getAllUsers();
	
	for(User user: users){
%>
	<tr onClick="location.href='./user_info_update.jsp?id=<%=user.getUser_id()%>'">
		<td><%=user.getUser_id() %></td>
		<td><%=user.getPassword() %></td>
		<td><%=user.getName() %></td>
		<td><%=user.getEmail() %></td>
		<td><%=user.getPhonenum() %></td>
	</tr>
<%} %>
</table>
</div>
</center>
</body>
</html>