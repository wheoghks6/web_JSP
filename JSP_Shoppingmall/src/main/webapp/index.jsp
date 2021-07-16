<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pw4ngc0 mall</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
	table{
		border-collapse: collapse;
	}
	
	th{
	padding: 10px;
	background-color: #bbdefb;
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
<center>
	<div class="my_service">
<%
	String id = (String)session.getAttribute("user_id");
	if(id == null){%>
		<a href="./login.jsp"><img src="./img/login.png" class="login_button"></a>
		<a href="./register.jsp"><img src="./img/register.png" class="register_button"></a>
		<%} else{%>
			<a href="./user_info_update.jsp?id=<%=id %>"><img src="./img/info_update.png"></a>
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
<h3>메인 제품</h3>
<table border="1">
<tr align="center">
	<th>컴퓨터</th>
	<th>휴대폰</th>
</tr>
<tr>
<td><a href="./computer_list.jsp"><img src="./img/computer/ULTRA_gamming.jpg"></a></td>
<td><a href="./mobile_list.jsp"><img src="./img/mobile/galuxy_S21.jpg"></a></td>
</tr>

</table>
</div>
</center>

</body>
</html>