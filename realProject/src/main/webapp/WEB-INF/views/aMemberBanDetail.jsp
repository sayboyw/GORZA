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
		#detailTable th{
			text-align: center;
		}
		</style>
	</head>
	<body>
		<input type="hidden" name="id" value="${param.id}"/>
		
		<table id="detailTable" style="width: 100%;text-align: center;border: 1px solid #d1d1d1;">
			<c:forEach items="${List}" var="List">
			<tr>
				<td>${List.nickName}</td>
				<td >${List.ban_reason}</td>
				<td >${List.ban_start}</td>
				<td >${List.ban_stop}</td>
			</tr>
		</c:forEach>
		</table>
	</body>
	<script>
	 var str;
	$(document).ready(function(){
		$.ajax({
			type:"post",
			url:"banDetail",
			data:{
				id : $("input[name=id]").val(),
			},
			dataType:"JSON",
			success:function(data){
				console.log(data);
				str+="<tr><th>"+"닉네임"+"&nbsp</th>";
				str+="<th>"+"정지사유"+"&nbsp</th>";
				str+="<th>"+"정지시작일"+"&nbsp</th>";
				str+="<th>"+"정지종료일"+"&nbsp</th></tr>";
				str+="<tr>";
				for(var i = 0 ; i< data.List.length;i++){
					str+="<td>"+data.List[i].nickName+"</td>";
					str+="<td>"+data.List[i].ban_reason+"</td>";
					str+="<td>"+data.List[i].ban_start+"</td>";
					str+="<td>"+data.List[i].ban_stop+"</td>";
					str+="</tr>";
				}
				$("#detailTable").html(str);
			}, 
			error:function(e){
				alert("정지사유 상세보기에 실패하였습니다.");
				console.log(e);
			}
		});
	});
	
	</script>
</html>