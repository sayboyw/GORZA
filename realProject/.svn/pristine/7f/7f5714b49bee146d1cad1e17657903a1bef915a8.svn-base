<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		   <script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
   <script src="resources/js/jquery.form.js"></script>
   <link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
		<title>관리자 - 신청리스트</title>
<style>

#notice1{
	left: 10%;
    font-size: 19px;
    position: absolute;
    top: 32%;
    width: 9%;
    height: 6%;
    color: #777;
    background-color: white;
    border: 2px solid #e5e5e5;
    border-radius: 0px 20px 0px 0px;
    padding: 8px;
}
#notice2{
    left: 10%;
    font-size: 19px;
    position: absolute;
    top: 38%;
    width: 9%;
    height: 6%;
    color: #777;
    background-color: white;
    border: 2px solid #e5e5e5;
    padding: 8px;
}
#notice3{
    left: 10%;
    font-size: 19px;
    position: absolute;
    top: 44%;
    width: 9%;
    height: 5%;
    color: #777;
    background-color: white;
    border: 2px solid #e5e5e5;
    border-radius: 0px 0px 20px 0px;
    padding: 8px;
}
#notice1:hover{
	left: 10%;
    font-size: 19px;
    position: absolute;
    top: 32%;
    width: 9%;
    height: 6%;
    color: #777;
    background-color: #e5e5e5;
    border: 2px solid #e5e5e5;
    border-radius: 0px 20px 0px 0px;
    padding: 8px;
    cursor: pointer;
}
#notice2:hover {
    left: 10%;
    font-size: 19px;
    position: absolute;
    top: 38%;
    width: 9%;
    height: 6%;
    color: #777;
    background-color: #e5e5e5;
    border: 2px solid #e5e5e5;
    padding: 8px;
    cursor: pointer;
}
#notice3:hover {
    left: 10%;
    font-size: 19px;
    position: absolute;
    top: 44%;
    width: 9%;
    height: 5%;
    color: #777;
    background-color: #e5e5e5;
    border: 2px solid #e5e5e5;
    border-radius: 0px 0px 20px 0px;
    padding: 8px;
    cursor: pointer;
}

#area {
	margin: auto;
	height: auto;
	width: 57%;
	position: relative;
	overflow: auto;
}

/* .divide{
   	font-weight: 600;
} */
</style>
</head>
	<body>
		<jsp:include page="loginBox.jsp"/>
		
		<div id="container">
		    <a id="notice1" class="divide" onclick="link(1)">제휴 신청 리스트</a>
  		    <a id="notice2" class="divide" onclick="link(2)">배너 리스트</a>
  		    <a id="notice3" class="divide" onclick="link(3)">코디 리스트</a>
		</div>
		
		<div id = "area">	
		
		</div>

	</body>
	<script>
		var loginId="${sessionScope.mb.id}";
		// 세션값을 가져와서 로그인여부 확인	
		var state = "${sessionScope.mb.state}"
		if(loginId ==""){	//로그인 안된 상태일 때
			alert("로그인이 필요한 서비스입니다.");
			location.href="mLoginF";	
		}else{
			if(state !=2){
				alert("권한이 없습니다.");
				location.href="./";
			}
		}
		function link(divide){
			if(divide ==1){
				$("#area").load("aAllianceF");
			}else if(divide==2){
				$("#area").load("aBannerF"); 
				/* location.href="aBannerF" */
			}else if(divide==3){
				$("#area").load("aComCodyF");
			}
		}
		$(document).ready(function(){
			$("#area").load("aAllianceF");
		});
	</script>
</html>