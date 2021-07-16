<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pw4ngc0 로그인</title>
<link href="style.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

</head>
<body class="text-center">
<%
String user_id = null;

if(session.getAttribute("user_id") != null){
	user_id = (String)session.getAttribute("user_id");
}
if(user_id != null)
{
	out.print("<script>alert('이미로그인되어있습니다.')</script>");
	out.print("<script>location.href='index.jsp'</script>");
}
%>
    
<main class="form-signin">
  <form action="login" method="post">
    <a href="./index.jsp"><img class="mb-4" src="./img/logo.png" alt="" width="50" height="57"></a>
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="ID" id="user_id" name="user_id">
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="Password" id="password" name="password">
    </div>
    <br>
    <button class="btn btn-primary btn-lg btn-block" type="submit">로그인</button>
	<button class="btn btn-primary btn-lg btn-block" type="reset" onclick="location='./register.jsp'">회원가입</button>
  </form>
  

</main>
</body>
<hr>
</body>
</html>