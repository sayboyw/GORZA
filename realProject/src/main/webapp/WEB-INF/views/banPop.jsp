<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<link rel="stylesheet" href="resources/css/font-awesome.min.css">
		
		<!-- Main css -->
		<link rel="stylesheet" href="resources/css/style.css">
		<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
		<title>Insert title here</title>
		<style>
			.area{
			margin-bottom :3%;
			padding: 5px 5px;
			width:99%;
			height: 30%;
		}
		#divbtn{
			text-align: right;
			margin: 1%;
		}
		</style>
	</head>
	<body>
			<input type="hidden" name="id" value="${param.id}"/>
			<textarea id="reason" class="area"  name ="reason" placeholder="정지사유를 적어주세요"></textarea>
			<div id="divbtn">
			<input type="button" class="btn btn-default" onclick="submit()" value="전송"/>
			<input type="button" class="btn btn-default" onclick="cancel()" value="취소"/>
			</div>
	</body>
	<script>
		var reason;
		function submit(){
			reason=$("#reason").val();
			console.log(reason);
			if(reason ==""){
				var result = confirm("정지사유가 없습니다. 그대로 진행하시겠습니까?");
				if(result){
					ajax();
				}else{
					return false;
				}
			}else{
				ajax();
			}
		}
		//실제 아작스로 전송
		function ajax(){
			$.ajax({
				type:"post",
				url:"aMemberBan",
				data:{
					id : $("input[name=id]").val(),
					ban_reason : $("#reason").val()
				},
				dataType:"JSON",
				success:function(data){
					console.log(data);
					if(data.result==1){
						alert("회원 정지에 성공하였습니다.");
						window.opener.location.reload();
						window.close();
					}
					
				}, 
				error:function(e){
					alert("회원정지에 실패하였습니다.");
					console.log(e);
				}
			});
		}
		
		
		function cancel(){
			window.opener.location.reload();
			window.close();
		}
	</script>
</html>