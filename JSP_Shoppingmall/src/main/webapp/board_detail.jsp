<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="com.dao.BoardDao" %>
 <%@ page import="com.model.Board" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pw4ngc0 mall</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

<style type="text/css">
    #wrap {
	margin:auto;
}
			table {width: 1000px;
			table-layout:fixed;
    border-collapse: collapse;
    line-height: 24px;
			}
			table td,th {
    border-top:1px solid blue;
    border-bottom:1px solid blue;
    border-collapse: collapse;
    text-align: center;
    eight: auto;
	white-space: nowrap;
	word-break:break-all;
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
			#str{
			text-align: left;
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
<%} 
	String board_num = request.getParameter("id");
	int num = Integer.parseInt(board_num);
	
	BoardDao dao = new BoardDao();
	dao.updateReadCount(num);
	Board board = dao.getBoardById(num);
	
%>
<script>
		function delete_board()
		{
			var result = confirm('글을 삭제하시겠습니까?');
			if(result == 1)
			{
				location.href="./delete_board.jsp?id=<%=num%>";
			}
		}
		</script>
<br>
<center>
<div id="wrap">
<form action="./board_update.jsp?id=<%=board.getBoard_num() %>" method="post">
<table border="1">
<tr>
<td>제목</td>
<td><%=board.getTitle() %></td>
</tr>
<td>작성자</td>
<td><%=board.getUser_id() %></td>
<tr>
<td colspan="2">내용</td>
</tr>
<tr>
<td id="str" colspan="2" width="50" height="40">
<%=board.getContent() %>
</td>
</tr>
<tr>
<td>조회수</td>
<td><%=board.getReadcount() %></td>
</tr>

</table>
<%
	if(id != null)
	{
		if(id.equals(board.getUser_id()) || id.equals("admin"))
		{
%>
<input type="submit" class="btn btn-primary btn-lg btn-block" value="수정">
<input type="button" class="btn btn-primary btn-lg btn-block" value="삭제" Onclick="delete_board()">
<% 		}
	}%>
	<input type="button" class="btn btn-primary btn-lg btn-block" value="목록" Onclick="location.href='./board.jsp'">
	
</div>

</form>
</center>
</body>
</html>