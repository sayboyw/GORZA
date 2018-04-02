<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>회원가입 선택 페이지</title>
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<link rel="stylesheet" href="resources/css/font-awesome.min.css">

		<!-- Main css -->
		<link rel="stylesheet" href="resources/css/style.css">
		<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet" />
		<style>
		
			.box {
				position: relative;
				display: inline-block;
				width: 80%;
				transform: translateX(-17%);
				left: 50%;
			}
			.div0 {
				float: left;
				margin: 30px;
				height: 200px;
				width: 200px;
				border-radius: 10%;
				board: 3px solid #8794a3;
			}
			.div0 .btn{
		        position: relative;
			    border-radius: 10%;
			    border: 5px #8794a3 solid;
			    width: 102%;
			    left: 1%;
			    height: 100%;
			    top: -9%;
			    background-color: white;
			}
			.p{
			    color: #8794a3;
			    font-size: 22px;
			    font-weight: 600;
			    position: relative;
			    left: 17%;
			    top: -69%;
			    cursor: pointer;
			}
			.p:hover{
				color: #0B2161;
			}
		</style>
	</head>
	<body>
		<jsp:include page="loginBox.jsp"/>
			<form action="typeSelect" method="post" id="stateForm">
				<input type='hidden' id="state" name="state">
				
				<div class="box">
				
					<div class="div0" onclick="stateSend(0)">
						<input class="btn" type="button"  name="state">
						<a class="p">일반 회원가입</a>
					</div>
					<div class="div0" onclick="stateSend(1)">
						<input class="btn" type="button"  name="state">
						<a  class="p">기업 회원가입</a>
					</div>
					
				</div>
				
			</form>
		<jsp:include page="footer.jsp"/>
	</body>
	<script>
		function stateSend(num){
			if(num ==0){
				$("#state").val(0);
			}else{
				$("#state").val(1);
			}
			$("#stateForm").submit();
		}
	</script>
</html>