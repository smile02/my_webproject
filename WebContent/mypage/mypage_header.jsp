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
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-8 col-xs-offset-2">
				<div class="media text-center">
					<div class="media-left">
						<img
							src="${pageContext.request.contextPath }/mypage/img/happiness.jpg"
							alt="" class="main-picture" />
					</div>

					<div class="media-body">
						<p class="media-heading main-font">Happiness
							&nbsp;&nbsp;&nbsp;&nbsp;
							<c:if test="${sessionScope.id != null }">
								<span class="text-right" style="font-size:15pt;"><small>${sessionScope.name }님 안녕하세요.</small></span>
							</c:if>											
						</p>
					</div>
				</div>
				<br /><br />
			<div class="btn-group main-btn text-center">
				<button type="button" class="btn btn-default btn-lg"
					onclick="location.href='${pageContext.request.contextPath}/mypage/main'"
					data-toggle="tooltip" title="홈!">
					<span class="glyphicon glyphicon-home text-center"></span></button>
				
				<button type="button" class="btn btn-default btn-lg"
					onclick="location.href='${pageContext.request.contextPath}/mypage/visit/list'"
					data-toggle="tooltip" title="방명록">
					<span class="glyphicon glyphicon-list-alt"></span></button>
				
				<button type="button" class="btn btn-default btn-lg"
					onclick="location.href='${pageContext.request.contextPath}/mypage/photo/list'"
					data-toggle="tooltip" title="사진첩">
					<span class="glyphicon glyphicon-picture"></span></button>
				
				<c:if test="${sessionScope.id == null }">
				<button type="button" class="btn btn-default btn-lg"
					onclick="location.href='${pageContext.request.contextPath}/mypage/reguser/login'"
					data-toggle="tooltip" title="로그인">
						<span class="glyphicon glyphicon-log-in"></span></button>						
				</c:if>
				
				<c:if test="${sessionScope.id != null }">
				<button type="button" class="btn btn-default btn-lg"
					onclick="location.href='${pageContext.request.contextPath}/mypage/reguser/logout'"
					data-toggle="tooltip" title="로그아웃">
						<span class="glyphicon glyphicon-log-out"></span></button>
				</c:if>
				
				<c:if test="${sessionScope.id == null}">
				<button type="button" class="btn btn-default btn-lg"
					onclick="location.href='${pageContext.request.contextPath}/mypage/reguser/signup'"
					data-toggle="tooltip" title="회원가입">
						<span class="glyphicon glyphicon-user"></span></button>
				</c:if>
				
				<c:if test="${sessionScope.id != null}">
				<button type="button" class="btn btn-default btn-lg"
					onclick="location.href='${pageContext.request.contextPath}/mypage/reguser/myinfo'"
					data-toggle="tooltip" title="내정보">
						<span class="glyphicon glyphicon-user"></span></button>
				</c:if>
			</div>
			<br /><br />				
			</div>			
		</div>
	</div>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script>
			$('[data-toggle="tooltip"]').tooltip();
	</script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>