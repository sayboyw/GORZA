<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 다음 주소api -->
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
	
	#cSendFarea {
		margin: auto;
		border: 20px solid #8794A3;
		width: 32%;
		height: 70%;
		margin-top: 20px;
		margin-bottom: 100px;
	}
	
	#hashtag {
		height: 8%;
		word-spacing: inherit;
	}
	
	#cd_title {
		margin-top: 3%;
	}
	
	#btnArea {
		padding-top: 50px;
		text-align: right;
		padding-right: 5px;
	}
	
	.sitChek {
		width: 20px;
		height: 10px;
	}
	.boxCate {
		padding: 10px;
	}
</style>
</head>
<body>
<jsp:include page="loginBox.jsp"/>
<div id="cSendFarea" style="margin-top: 6%;" >
<form style="padding: 8px" id="cSendForm" action="cSend" method="post" enctype="multipart/form-data">
<fieldset >
		<div class="section-title">
			<h3 style="text-align: center; font-size: 22px">코디 신청하기</h3>
		</div>
	<input id="cd_title" class="area" type="text" placeholder="타이틀은 입력해주세요" maxlength="30" name="cd_title"><br/>
	<input name="id" type="hidden" value="${sessionScope.mb.id }">
	<div id="checkArea" class = "area" >
	<h4 style="font-size: 15px;">카테고리 선택</h4>
	<div style="text-align: center;">
		<span class="boxCate" ><input class="sitChek"  type="checkbox" name="cd_sitAll" value="남친룩" />남친룩</span>
		<span class="boxCate" ><input class="sitChek"  type="checkbox" name="cd_sitAll" value="하객룩" />하객룩</span>
		<span class="boxCate" ><input class="sitChek"  type="checkbox" name="cd_sitAll" value="데일리룩" />데일리룩</span>
		<span class="boxCate" ><input class="sitChek"  type="checkbox" name="cd_sitAll" value="빈티지룩" />빈티지룩</span>
		<span class="boxCate" ><input class="sitChek"  type="checkbox" name="cd_sitAll" value="캐주얼룩" />캐주얼룩</span>
	</div>
	</div>
	<textarea name=cd_content class="area"  style="resize: vertical; width: 97.7%;height: 30%" placeholder="내용은 이 안에 입력해주세요"></textarea><br/>
	<br/>
	<input multiple="multiple" class="btn btn-default" name="c_file"  type="file" class="area" style="resize: vertical; width: 97.7%;height: 8%;border: 1px solid #999" placeholder="사진 등록" onchange="fileCheck(this)"/><br/>
	<div id="btnArea" >
	<input type="button" class="btn btn-default" id="cd_write" value="보내기"/>
	</div>
</fieldset>
</form>
<div></div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script>
	var status = "${sessionScope.cm.c_agree}";
	console.log(status);
	
 $(document).ready(function(){
		var sessionConfirm = "${sessionScope.cm.c_agree}";
		console.log("기업 세션값(c_agree): "+sessionConfirm);
		if(sessionConfirm !=2){
			alert("권한이 없습니다.");
			location.href="./";
		}
	});
	var fChk = 0;
	function fileCheck(e){
		if(e.value==""){
			fChk=0;
        }else{
        	fChk=1
        }
	}
	
	$("#cd_write").click(function(){
		$("#cSendForm").submit();
	});
</script>
</html>