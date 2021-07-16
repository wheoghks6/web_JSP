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
    
<main class="form-signin">
  <form>
    <a href="main.jsp"><img class="mb-4" src="./img/logo.png" alt="" width="50" height="57"></a>
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="ID">
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
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