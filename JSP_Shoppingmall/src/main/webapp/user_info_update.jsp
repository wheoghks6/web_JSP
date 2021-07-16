<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.dao.UserDao" %>
    <%@ page import="com.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

<%
	String id = request.getParameter("id");
String current_id = (String)session.getAttribute("user_id");
	UserDao userdao = new UserDao();
	User current_info = userdao.getUserById(id);
%>
<style>

</style>
<script>
	function delete_User()
	{
		var result = confirm('회원을 삭제하시겠습니까?');
		if(result == 1)
		{
			location.href="./delete_User.jsp?id=<%=id%>"
			
		}
	}
</script>
</head>
<body>
<div class="top_header">
	<div class="top_logo">
	<h1><a href="./index.jsp"><img src="./img/logo.png"></a></h1>
	</div>
</div>
 <form action="updateproc.jsp" method="post">
<div class="container">
        <div class="py-5 text-center">
            <h2>회원 정보 수정</h2>
            <p class="lead">회원 정보 수정</p>
        </div>

        <div class="col-md-12 order-md-1">
            <h4 class="mb-3">회원 정보</h4>
           
                <div class="mb-3">
                    <label for="username">ID</label>
                        <input type="text" class="form-control" id="user_id" name="user_id" placeholder="ID" required name="user-id" value="<%=current_info.getUser_id() %>" readonly>
                        <div class="invalid-feedback" style="width: 100%;">Your ID is required.</div>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="password">password</label> 
                    <input type="password" class="form-control" id="password" name="password" placeholder="" value="<%=current_info.getPassword() %>" required name="user-password">
                    <div class="invalid-feedback">Password input plz</div>
                </div>


                <div class="mb-3">
                    <label for="firstName">Name</label> 
                    <input type="text" class="form-control" id="name" name="name" placeholder="user name" value="<%=current_info.getName() %>" required name="user-real-name">
                    <div class="invalid-feedback">Name input plz.</div>
                </div>

                <div class="mb-3">
                    <label for="email">E-mail</label>
                    <input type="email" class="form-control" id="email" placeholder="you@example.com" name="email" value="<%=current_info.getEmail() %>" required name="email">
                    <div class="invalid-feedback">E-mail input plz.</div>
                </div>

                <div class="mb-3">
                    <label for="address">Phone-Number</label> <input type="text" name="phonenum" class="form-control" id="phonenum" value="<%=current_info.getPhonenum() %>" placeholder="-빼고 입력해주세요." required name="user_phone">
                    <div class="invalid-feedback">Phone Number input plz</div>
                </div>

                <hr class="mb-4">
                <button style="float: right;" class="btn btn-primary btn-lg btn-block" type="submit">수정</button>
                
        </div>        
    </form>
<button style="float: right;" class="btn btn-primary btn-lg btn-block" onClick="delete_User()">삭제</button>
        
</body>
</html>