<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<title>아이디 찾기</title>
	<script>
		$(function() {
			$("#loginBtn").click(function() {
				location.href = './';
			})
		})
	</script>
	</head>
	<body>
		<div>
			<h3>아이디 찾기 검색결과</h3>
		</div>
		<div>
		<c:forEach items="${idList }" var="idList">
			<h5>회원님의 아이디는 ${idList} 입니다.</h5>
		</c:forEach>
				<button type="button" id=loginBtn>로그인</button>
				<button type="button" onclick="history.go(-1);">취소</button>
		</div>
	</body>
	<script>
	</script>
</html>
