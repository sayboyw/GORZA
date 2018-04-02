<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
	<style>
	#area{
			border: 20px solid #8794A3;
		}
	</style>
</head>
<body id="area" >
<h3 style="font-size: 20px;">&nbsp;&nbsp;&nbsp;신고 사유</h3>
	<div style="width: 100%; padding:3% 15%; text-align: center;">
	<p>닉네임(신고자)</p>
	<input style="width: 80%; height: 10%;" type="text" value="${nickName}" readonly="readonly"/><br/><br/>
	<p>제보항목</p>
	<input style="width: 80%; height: 10%;" type="text" value="${reportDetail.rp_reason}" readonly="readonly"/><br/><br/>
	 <p>내용</p>
	 <input style="width: 80%; height: 10%;" type="text" value="${reportDetail.b_content}" readonly="readonly"/><br/><br/><br/>
	<button class="btn btn-default" onclick="location.href='aReportF'">목록보기</button>
	</div>
</body>
<script></script>
</html>