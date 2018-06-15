<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/mypage/css/style.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	var idCheck = false;
	function signup(f){
		//1. 아이디, 비밀번호, 이름, 성별, 생년월일
		if(!/^[a-z0-9]{4,12}$/.test(f.id.value)){			
			f.id.focus();
			return;
		}
		
		if(!/^(?=.*[!@#$%^*+=-_])(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z]).{8,15}$/.test(f.password.value)){			
			f.password.focus();
			return;
		}
		
		if(!/^[가-힣a-zA-Z]{2,5}$/.test(f.name.value)){			
			f.name.focus();
			return;
		}
		
		if(f.birth.value == ""){
			alert("생년월일을 선택해주세요.");
			return;
		}
				
		if(!idCheck){
			alert("아이디 중복확인을 해주세요.");
			return;
		}
		
		if($("#pwdAlert").html() != "비밀번호가 일치합니다."){
			alert("비밀번호를 다시 확인해주세요.");
			return;
		}
		//4. 두 조건 만족시 회원가입
		alert("회원가입이 완료되었습니다.");
		f.submit();
	}
	
	function pwd_check(){
		var password = $("#password").val();
		var passwordCheck = $("#passwordCheck").val();
		
		if(password == ""){
			$("#pwdAlert").html("");
		}else if(password == passwordCheck){
			$("#pwdAlert").html("비밀번호가 일치합니다.");
			
		}else{
			$("#pwdAlert").html("비밀번호를 확인해 주세요.");			
		}
		
	}
	
	function id_check(){
		var id = $("#id").val();
		
	if (id != "") {
			$.ajax({
				url : "${pageContext.request.contextPath}/mypage/idCheck",
				type : "post",
				data : {
					id : id
				},
				success : function(data) {
					if (data == id) {
						alert("중복되는 아이디입니다.");
					} else if (data != id) {
						alert("사용 가능한 아이디입니다.");
						idCheck = true;
					} else {
						alert("잠시 후에 다시 시도해주세요.");
					}
				}
			});
		}
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<jsp:include page="/mypage/mypage_header.jsp"></jsp:include>
			<div class="col-xs-7 col-xs-offset-2 text-center">
				<h3 class="text-center">회원가입</h3>
				<form action="${pageContext.request.contextPath }/mypage/reguser/signup" class="form-horizontal"
					method="post">
					<table class="table table-hover">
						<caption>계정정보 입력</caption>
						<tr>							
							<td>
								<div class="form-group">
									<div class="col-xs-3 col-xs-offset-1">
										<label for="id" class="control-label">아이디</label>
									</div>
									<div class="col-xs-5">
										<input type="text" id="id" class="form-control" name="id"
											onkeyup="dualCheck = false;" />
									</div>
								</div>
							</td>
							<td>
								<div class="form-group">									
									<div class="col-xs-2">
										<button type="button" class="btn btn-info"
											onclick="id_check();">중복확인</button>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<div class="col-xs-3 col-xs-offset-1">
										<label for="password" class="control-label">비밀번호</label>
									</div>
									<div class="col-xs-5">
										<input type="password" id="password" class="form-control"
											name="password" onkeyup="pwd_check();" />
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<div class="col-xs-3 col-xs-offset-1">
										<label for="passwordCheck" class="control-label">비밀번호 확인</label>
									</div>
									<div class="col-xs-5">
										<input type="password" id="passwordCheck" class="form-control"
											onkeyup="pwd_check();"/>
										<span id="pwdAlert"></span>										
									</div>									
								</div>
							</td>
							
						</tr>
					</table>
					<br />
					<table class="table table-hover"><!-- 이름 성별 생년월일 취미 이메일 폰번호 -->
						<caption>개인정보 입력</caption>
						<tr>
							<td>
								<div class="form-group">
									<div class="col-xs-2 col-xs-offset-1">
										<label for="name" class="control-label">이름</label>
									</div>
									<div class="col-xs-4">
										<input type="text" id="name" name="name" class="form-control" />
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<div class="col-xs-2 col-xs-offset-1">
										<label class="control-label">성별</label>
									</div>
									<div class="col-xs-4">
										<label for="gender1" class="radio-inline">
											<input id="gender1" type="radio" name="gender" value="m" checked="checked"/>
										남자</label>
										<label for="gender2" class="radio-inline">
										 	<input id="gender2" type="radio" name="gender" value="f" /> 
										 여자</label>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<div class="col-xs-2 col-xs-offset-1">
										<label for="birth" class="control-label">생년월일</label>
									</div>
									<div class="col-xs-3">
										<input type="date" name="birth" id="birth"
											class="label-control" />
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<!-- control-label은 오른쪽 정렬 -->
									<div class="col-xs-2 col-xs-offset-1">
										<label class="control-label">취미</label>
									</div>
									<div class="col-xs-6">
										<label for="hobby1" class="checkbox-inline">
										 <input
											type="checkbox" id="hobby1" value="movie" name="hobby" />영화
										</label>
										 <label for="hobby2" class="checkbox-inline">
										 <input
											type="checkbox" id="hobby2" value="sports" name="hobby" />운동
										</label> <label for="hobby3" class="checkbox-inline">
										 <input
											type="checkbox" id="hobby3" value="music" name="hobby" />음악감상
										</label>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group">
									<div class="col-xs-2 col-xs-offset-1">
										<label for="email" class="control-label">이메일</label>
									</div>
									<div class="col-xs-5">
										<input type="email" id="email" class="form-control"
											name="email" />
									</div>
								</div>
							</td>
						</tr>

						<tr>
							<td>
								<div class="form-group">
									<div class="col-xs-2 col-xs-offset-1"> 
										<label for="phone" class="control-label">전화번호</label>
									</div>
									<div class="col-xs-5">
										<input type="tel" id="phone" class="form-control" name="phone"/>
									</div>
								</div>
							</td>
						</tr>						
					</table>
						<div class="btn-group signup-btn col-xs-offset-2 col-xs-7">						
							<button type="button" class="btn btn-success" onclick="signup(this.form);">회원가입</button>
							<button type="button" class="btn btn-default" onclick="history.back();">취소</button>
						</div>
				</form>
				<br /><br /><br /><br /><br />
			</div>
		</div>
	</div>
</body>
</html>