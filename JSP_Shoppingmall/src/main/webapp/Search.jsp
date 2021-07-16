<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.dao.BoardDao" %>
 <%@ page import="com.model.Board" %>
      <%@ page import="com.dao.ItemDao" %>
     <%@ page import="com.model.Item" %>
<%@ page import= "java.util.List"%>
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
<style>
table{
		border-collapse: collapse;
		text-align: center;
	}
	th{
	padding: 10px;
	background-color: #bbdefb;
	}
#button {

  background-color: blue;

  border: none;

  color: white;

  padding: 15px 30px;

  text-align: center;

  text-decoration: none;

  display: inline-block;

  font-size: 16px;

  margin: 4px 2px;

  cursor: pointer;

}
</style>
<script>
function mobile_buy(num)
{
	var result = confirm("제품을 구매하시겠습니까?");
	if(result == 1)
	{
		location.href="./mobile_buy.jsp?id="+num;
	}
}
function buy(num)
{
	var result = confirm("제품을 구매하시겠습니까?");
	if(result == 1)
	{
		location.href="./computer_buy.jsp?id="+num;	
	}
}

</script>
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
<%} %>

<center>
<div id="wrap">
<%
	String search_text = request.getParameter("search_text");
	BoardDao dao = new BoardDao();
	List<Board> boards = dao.getSearchList(search_text);
	
%>
		<h3>게시판 검색결과</h3>
		<table border="1" style="width:1000px;">
		<tr align="center">
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>날짜</th>
		</tr>
	<%
	for(Board board: boards){
%>
	<tr onClick="location.href='./board_detail.jsp?id=<%=board.getBoard_num()%>'">
		<td><%=board.getTitle() %></td>
		<td><%=board.getUser_id() %></td>
		<td><%=board.getReadcount() %></td>
		<td><%=board.getTimestamp() %></td>
	</tr>
<%}%>
	</table>

</div>

<div id="wrap">
<%
	ItemDao itemdao = new ItemDao();
	List<Item> items = itemdao.getComputerSearchList(search_text);
	
%>
		<h3>컴퓨터/노트북 검색결과</h3>
		<table border="1" style="width:1000px;">
		<tr align="center">
		<th>제품 사진</th>
	<th>제품명</th>
	<th>제품 설명</th>
	<th>제품 가격</th>
	<th>제품 수량</th>
	<th>비고</th>
		</tr>
	<%
	for(Item item: items){
		%> 
			<tr>
				<td><img src="<%=item.getItem_img() %>" style = "width:175px;height:175px;"></td>
				<td><%=item.getItem_name() %></td>
				<td style="width:500px; vertical-align:middle; text-align:left;"><%=item.getItem_content() %></td>
				<td><%=item.getItem_price() %>원</td>
				<td><%=item.getItem_count() %></td>
				<td><input type="button" id="button" value="구매" onclick="buy('<%=item.getItem_num()%>')" >
			</tr>
		<%} %>
	</table>
</div>
<div id="wrap">
<% 
	items = itemdao.getMobileSearchList(search_text);
	%>
		<h3>휴대폰/테블릿 검색결과</h3>
		<table border="1" style="width:1000px;">
		<tr align="center">
			<th>제품 사진</th>
	<th>제품명</th>
	<th>제품 설명</th>
	<th>제품 가격</th>
	<th>제품 수량</th>
	<th>비고</th>
		</tr>
	<%
	for(Item item: items){
		%> 
			<tr>
				<td><img src="<%=item.getItem_img() %>" style = "width:175px;height:175px;"></td>
				<td><%=item.getItem_name() %></td>
				<td style="width:500px; vertical-align:middle; text-align:left;"><%=item.getItem_content() %></td>
				<td><%=item.getItem_price() %>원</td>
				<td><%=item.getItem_count() %></td>
				<td><input type="button" id="button" value="구매" onclick="mobile_buy('<%=item.getItem_num()%>')" >
			</tr>
		<%} %>
	</table>
</div>



</center>
</body>
</html>