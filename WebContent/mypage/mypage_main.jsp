<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/mypage/css/style.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	.carousel-caption>p{
		color:black;
	}
	
	.carousel-caption>h4{
		color:black;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<jsp:include page="/mypage/mypage_header.jsp"></jsp:include>
			<div class="col-sm-offset-3 col-sm-6">
				<div class="carousel slide" data-ride="carousel" id="mycarousel">
					<!-- indicator : 지시자 -->
					<ol class="carousel-indicators"> <!-- 순서가 있음.--> 
						<li data-target="#mycarousel" class="active"
							data-slide-to="0"></li> <!-- 얘가 가리키는게 div태그 -->
						<li data-target="#mycarousel"
							data-slide-to="1"></li>
						<li data-target="#mycarousel"
							data-slide-to="2"></li>
						<li data-target="#mycarousel"
							data-slide-to="3"></li>
						<li data-target="#mycarousel"
							data-slide-to="4"></li>
						<li data-target="#mycarousel"
							data-slide-to="5"></li>
					</ol>
					<!-- 캐러셀 바디 -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="${pageContext.request.contextPath }/mypage/img/홈.PNG"/>
							<div class="carousel-caption">
								<h4>홈 화면</h4>
								<p>방명록과 사진첩은 로그인을 해야 사용가능합니다.</p>
							</div>
						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath }/mypage/img/회원가입.PNG"/>
							<div class="carousel-caption">
								<h4>회원가입</h4>
								<p>회원가입을 할 수 있는 페이지입니다.</p>
							</div>
						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath }/mypage/img/로그인.PNG"/>
							<div class="carousel-caption">
								<h4>로그인</h4>
								<p>로그인을 할 수 있는 페이지입니다.</p>
							</div>
						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath }/mypage/img/방명록.PNG"/>
							<div class="carousel-caption">
								<h4>방명록</h4>
								<p>방명록을 남기며 다른사람과 이야기를 할 수있는 페이지입니다.</p>
							</div>
						</div>
						<div class="item">
							<img src="${pageContext.request.contextPath }/mypage/img/사진첩.PNG"/>
							<div class="carousel-caption">
								<h4>사진첩</h4>
								<p>사진을 올리며 근황을 알려줄 수 있습니다.</p>
							</div>
						</div>
					</div>
					<!-- 컨트롤스 -->
					<a href="#mycarousel" class="left carousel-control"
						data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
					</a>
					<a href="#mycarousel" class="right carousel-control"
						data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script>
		$(".carousel").carousel({
			//시간간격 기본값 : 5초, false는 auto슬라이드 끄기
			interval:3000,
			pause: "hover", //마우스가 올라갔을 때 멈추겠다.
			wrap : true //기본값: true이고 순환을 하겠다.(맨 끝으로 갔을 때 순환이 되게 할 것인지.)			
		});
	</script>
</body>
</html>