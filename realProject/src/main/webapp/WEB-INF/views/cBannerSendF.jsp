<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 다음 주소api -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/dal.css">
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700"
	rel="stylesheet">

<style>
#banner {
	text-align: center;
	top: 10%;
}

#cBannerSendFarea {
	margin: auto;
	border: 20px solid #8794A3;
	width: 32%;
	height: 75%;
	margin-top: 20px;
	margin-bottom: 100px;
}

</style>
</head>
<body>
	<jsp:include page="loginBox.jsp" />
	<div id="cBannerSendFarea" style="margin-top: 6%;">
		<form style="padding: 20px" id="bannerSend" action="cBannerSend" name="bannerSend"
			method="post" enctype="multipart/form-data">
			<div class="section-title">
				<h3 style="text-align: center; font-size: 22px">배너 신청하기</h3>
			</div>

			<div id="banner">
				<br /> <input class="area" type="text" size="50" name="b_title"
					placeholder="제목" /> <br /> <br />

				<textarea class="area" rows="13" cols="50" name="b_content"
					style='resize: none;' placeholder="내용을 적어주세요"></textarea>

				<br /> <br /> <input class="btn btn-default" multiple="multiple" style="position: relative;left: 5%;top: -4px;"
					type="file" id="file" name="files[]" onchange='getCmaFileView()' />

				<br /> 
				<input type="text" placeholder="시작일" name="ba_start" id="startDatepicker"> &nbsp;&nbsp;&nbsp; 
				<input type="text" placeholder="종료일" name="ba_stop" id="endDatepicker"> <br />

				<input type="hidden" name="ap_divide" value="3" />
				<!-- <div name="startDay" id="startDatepicker"></div> -->
				<br />

				<input type="button" class="btn btn-default" onclick="bannerUpload()"  value="전송"/>
			</div>

		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
<!-- jQuery UI CSS파일  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<!-- jQuery 기본 js파일 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
      var status = "${sessionScope.cm.c_agree}";
      console.log(status);
      $(document).ready(function(){
  		var sessionConfirm = ${sessionScope.cm.c_agree};
  		console.log("기업 세션값(c_agree): "+sessionConfirm);
  		if(sessionConfirm !=2){
  			alert("권한이 없습니다.");
  			location.href="./";
  		}
  	  });
//날짜 받는 함수
$(function() {
     $( "#startDatepicker" ).datepicker({
           showOn: "both", 
           buttonImage: "resources/images/cal.png", 
           buttonImageOnly: true,
           dateFormat : 'yy-mm-dd',
           mindate : 0
     });
     $( "#endDatepicker" ).datepicker({
         showOn: "both", 
         buttonImage: "resources/images/cal.png", 
         buttonImageOnly: true,
         dateFormat : 'yy-mm-dd'
     });
     
});
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yy = today.getFullYear();

	today = yy + "-" + mm + "-" + dd;
	function bannerUpload() {
		console.log($("#startDatepicker").val());
		console.log($("#endDatepicker").val());
		console.log($("#file").val());
		if ($("#file").val() == "") {
			alert("사진을 업로드 해주세요.");
		}else if ($("#startDatepicker").val() > $("#endDatepicker").val()){
				alert("시작일과 종료일을 다시 확인해 주세요.");
		}else{
			$("#bannerSend").submit();
		}
	}

	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}

	//이미지 파일 유효성검사
	function getCmaFileView() {
		var fileNm = $("#file").val();
		console.log("파일이름 : " + fileNm);

		if (fileNm != "") {
			var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();

			if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
				alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
				fileNm = '';
				$("#file").val('');
				return false;
			}

		}
		return true;

	}
</script>
</html>