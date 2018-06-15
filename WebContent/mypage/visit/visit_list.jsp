<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/mypage/css/style.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function del(id){
		location.href="${pageContext.request.contextPath}/mypage/visit/delete?id="+id;
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<jsp:include page="/mypage/mypage_header.jsp"></jsp:include>
			<div class="col-xs-7 col-xs-offset-3">
			<h3 class="text-center">방명록</h3>
				<div class="form-group">
					<form action="${pageContext.request.contextPath }/mypage/visit/insert" method="post">
						<div class="col-xs-6 col-xs-offset-3">
							<input type="text" class="form-control" name="content"/>
						</div>
						<div class="col-xs-3">
							<button class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>
				<br /><hr /><br />
				<c:forEach var="visit" items="${visitList }">
					<div class="list-group">						
						<div class="col-xs-3">
							<label for="visit">${visit.u_id }</label>
						</div>
						
							<div class="input-group">
								<div class="col-xs-8">
									<input id="visit" type="text" value="${visit.content }"
										class="form-control" readonly="readonly" />
								</div>
								<div class="col-xs-3">
									<input type="hidden" value="삭제" />
								</div>
								<c:if test="${sessionScope.id == visit.u_id}">
									<div class="col-xs-3">
										<button type="button" class="btn btn-danger"
											onclick="del(${visit.id});">삭제</button>
									</div>
								</c:if>
							</div>
						
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>