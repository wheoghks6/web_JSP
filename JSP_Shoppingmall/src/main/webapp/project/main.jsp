<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pw4ngc0 mall</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="top_header">
	<div class="top_logo">
	<h1><a href="./main.html"><img src="./img/logo.png"></a></h1>
	</div>
	
		<form method="post" action="Search.jsp">
	
			<div class="search_area">
			<input type="text" name="search_text" class="search_text">
			<input type="submit" value="검색" class="search_button">
		</div>
		</form>
	
	<div class="my_service">
		<a href="./login.jsp"><img src="./img/login.png" class="login_button"></a>
		<a href="./register.jsp"><img src="./img/register.png" class="register_button"></a>
	</div>
</div>
<nav>
	<ul class="nav-container">
		<li class="nav-item"><a href="computer_list.html">노트북/컴퓨터</a></li>
		<li class="nav-item"><a href="mobile_list.html">테블릿/모바일</a></li>
		<li class="nav-item"><a href="board.html">게시판</a></li>
		<li class="nav-item"><a href="notice.html">공지사항</a></li>
	</ul>
</nav>

</body>
</html>