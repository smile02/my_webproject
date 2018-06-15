<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진첩</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">
<style>
	.thumbnail{
		height: 400px;
	}
	.img-container{
		height: 200px;
		
	}
	.thumbnail img{
		width: 100%;
		height: 100% !important;
		
		
	}
	.btn-group>button{
		width:100px;
		margin-right:10px;
		margin-top:10px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function del(id, uri){
	 if(confirm("정말로 삭제하시겠습니까?")){
		$.ajax({
			url:"${pageContext.request.contextPath}/mypage/photo/delete",
			type:"post",
			data:{id:id,uri:uri},
			success : function(data){
				if(data == 'y'){
					location.href="${pageContext.request.contextPath}/mypage/photo/list";
				}
			}
		});
	 }
	}
	
	function down(uri){
		location.href="${pageContext.request.contextPath}/mypage/photo/download?uri="+uri;
	}
	
	function fileCheck(file){
		var point = file.value.lastIndexOf("."); //뒤에있는 .의 위치
		var extension = file.value.substring(point+1, file.value.length); //.다음부터 끝까지의 확장자
		
		if(extension != "jpg" && extension != "JPG"
			&& extension != "png" && extension != "PNG"
			&& extension != "gif" && extension != "GIF"	){
			alert("이미지 이외의 파일은 업로드 할 수 없습니다.");
			
			var parent = file.parentNode;			
			var next = file.nextSibling;
			var tmp = document.createElement("form");
			//tmp에 appendChild하고 reset한 다음 parent에 insertBefore
			tmp.appendChild(file);
			tmp.reset();
			parent.insertBefore(file, next);
			
			return;
		}
	}
	
	function good(id){
		var check = "good";
		$.ajax({
			url:"${pageContext.request.contextPath}/mypage/photo/gnb",
			type:"post",
			data:{id:id, check:check},
			success: function(data){
				if(data == 'y')
				alert("좋아요가 반영되었습니다.");
				location.href="${pageContext.request.contextPath}/mypage/photo/list"
			}
		});
	}
	
	function bad(id){
		var check = "bad";
		$.ajax({
			url:"${pageContext.request.contextPath}/mypage/photo/gnb",
			type:"post",
			data:{id:id, check:check},
			success: function(data){
				if(data == 'y')
				alert("싫어요가 반영되었습니다.");
				location.href="${pageContext.request.contextPath}/mypage/photo/list"
			}
		});
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<jsp:include page="/mypage/mypage_header.jsp"></jsp:include>
			<h3 class="text-center">사진첩</h3>
			<br />
			<form
				action="${pageContext.request.contextPath }/mypage/photo/insert"
				method="post" enctype="multipart/form-data">
				<div class="input-group  col-xs-offset-5">
				<div class="form-group">
					<div class="col-xs-4">
						<label for="content"> <input type="text" id="content"
							name="content" class="form-control" placeholder="메세지 입력" />
						</label>
					</div>

					<div class="col-xs-4">
						<input type="file" name="file" onchange="fileCheck(this);"
								accept="image/gif, image/GIF, image/png, image/PNG, image/jpeg, image/JPEG" />
					</div>
				</div>
					<br /> <br /> <br />
					<div class="col-xs-3 col-xs-offset-3">
						<button class="btn btn-success">등록하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<br />
	<br />
	<div class="container">
		<div class="row">
			<c:if test="${empty photoList }">
				<div class="col-xs-6 col-md-3">
					<p class="text-center">등록된 사진이 없습니다.</p>
				</div>
			</c:if>
			<c:forEach var="photo" items="${photoList}">
				<div class="col-xs-6 col-md-3">
					<div class="thumbnail">
						<div class="img-container">
							<img src="${pageContext.request.contextPath }/mypage/upload/${photo.uri}"/>
						</div>
						<div class="caption">
							<h4>${photo.svo.id} - ${photo.svo.name}</h4>
							<p>${photo.content }</p>
							<p class="text-center">
							<div class="btn-group">
								<button type="button" onclick="good(${photo.id});"
									 class="btn btn-primary">
									 	<span class="glyphicon glyphicon-thumbs-up"></span>
									 	<span>${photo.good}</span>
									 	</button>
									 <button type="button"
									 class="btn btn-danger" onclick="bad(${photo.id})">
									 <span class="glyphicon glyphicon-thumbs-down"></span>
									 <span>${photo.bad}</span>
									 </button>
									 <button type="button" onclick ="down('${photo.uri}');"
									 class="btn btn-info">다운로드</button>
							<c:if test="${sessionScope.id == photo.svo.id }">
								<button type="button" onclick ="del(${photo.id},'${photo.uri}');"
									 class="btn btn-warning">삭제</button>
							</c:if>
							<c:if test="${sessionScope.id != photo.svo.id }">
								<button type="button"
									 class="btn btn-default">댓글</button>
							</c:if>				 
							</div>
							<div class="caption text-center">게시일 : 
							<f:parseDate var="date" value="${photo.regdate }"
							pattern="yyyy-MM-dddd HH:mm:ss"/>				
							<f:formatDate value="${date }" pattern="yy년 MM월 dd일"/>	
							</div>
							<br />
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<br />
	<br />
	<br />
	<!-- BootStrap -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>