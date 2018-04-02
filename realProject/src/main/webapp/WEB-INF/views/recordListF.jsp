<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/font-awesome.min.css">
	
	<!-- Main css -->
	<link rel="stylesheet" href="resources/css/style.css">
	<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
	<style>
		.area {
		margin: 5px 5px;
		padding: 5px 5px;
		width: 97.7%;
	}
	#divv {
		border: 20px solid #8794A3;
	}
	</style>
</head>
<body id="divv">
	 
	<h3>내역 보기</h3>
	닉네임<br/>
	<input type="text" class="area" value="${recordList[0].rp_oid}" readonly="readonly"/><br/>
	내역<br/><br/>
	<table class="table table-hover">
		<tr>
			<th>신고 내역</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${recordList }" var="recordList">
			<tr>
				<td>${recordList.rp_reason }</td>
				<td>${recordList.rp_date }</td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<button style="position: absolute; left:44%;"  class="btn btn-default" onclick="location.href='aReportF'">목록보기</button>
</body>
<script>
	console.log("${recordList[0].rp_oid}");
</script>
</html>