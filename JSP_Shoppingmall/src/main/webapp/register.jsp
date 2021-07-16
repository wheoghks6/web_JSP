<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pw4ngc0 회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

<style>

</style>
</head>
<body>
<div class="top_header">
	<div class="top_logo">
	<h1><a href="./index.jsp"><img src="./img/logo.png"></a></h1>
	</div>
</div>
 <form action="registerproc.jsp" method="post">
<div class="container">
        <div class="py-5 text-center">
            <h2>회원가입</h2>
            <p class="lead">회원 정보 입력</p>
        </div>

        <div class="col-md-12 order-md-1">
            <h4 class="mb-3">회원 정보</h4>
           
                <div class="mb-3">
                    <label for="username">ID</label>
                        <input type="text" class="form-control" id="user_id" name="user_id" placeholder="ID" required name="user-id">
                        <div class="invalid-feedback" style="width: 100%;">Your ID is required.</div>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="password">password</label> 
                    <input type="password" class="form-control" id="password" name="password" placeholder="" value="" required name="user-password">
                    <div class="invalid-feedback">Password input plz</div>
                </div>


                <div class="mb-3">
                    <label for="firstName">Name</label> 
                    <input type="text" class="form-control" id="name" name="name" placeholder="user name" value="" required name="user-real-name">
                    <div class="invalid-feedback">Name input plz.</div>
                </div>

                <div class="mb-3">
                    <label for="email">E-mail</label>
                    <input type="email" class="form-control" id="email" placeholder="you@example.com" name="email" required name="email">
                    <div class="invalid-feedback">E-mail input plz.</div>
                </div>

                <div class="mb-3">
                    <label for="address">Phone-Number</label> <input type="text" name="phonenum" class="form-control" id="phonenum" placeholder="-빼고 입력해주세요." required name="user_phone">
                    <div class="invalid-feedback">Phone Number input plz</div>
                </div>

                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">가입요청</button>
                <hr class="mb-4">
			
        </div>
    </form>
</body>
</html>