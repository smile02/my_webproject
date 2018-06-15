<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/mypage/css/style.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function login(){
		var id = $("#id").val();
		var password = $("#password").val();
		console.log(id);
		console.log(password);
		$.ajax({
			url: "${pageContext.request.contextPath}/mypage/reguser/login",
			type: "post",
			data : {id:id, password:password},
			success : function(data){
				if(data == 'y'){
					alert("로그인성공입니다.");
					location.href="${pageContext.request.contextPath}/mypage/main";
				}else if(data == 'n'){
					console.log(data);
					alert("아이디 또는 비밀번호를 확인해 주세요. 5번 실패시 5분동안 계정이 잠깁니다.");
				}else{
					alert("계정이 잠겼습니다. 5분뒤에 시도해주세요.");
				}
			}
		});				
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<jsp:include page="/mypage/mypage_header.jsp"></jsp:include>
			<div class="col-xs-7 col-xs-offset-2">
				<h3 class="text-center">로그인</h3>
				<br /><br />
				<div class="form-group">
					<div class="col-xs-3  col-xs-offset-1">
						<label for="id" class="control-label">아이디</label>
					</div>
					<div class="col-xs-5">
						<input type="text" id="id" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-3 col-xs-offset-1">
						<label for="password" class="control-label">비밀번호</label>
					</div>
					<div class="col-xs-5">
						<input type="password" id="password" class="form-control" />
					</div>
				</div>
				<div class="btn-group login-btn">
					<button type="button" class="btn btn-success btn-lg"
						onclick="login();">로그인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>