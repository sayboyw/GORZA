<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/css/style.css">
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700"
	rel="stylesheet">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
	#div2 {
	position: absolute;
	left: 20%;
}
#portfolio{
padding-top: 0px;
}

#home{
	padding-bottom: 0px;
}


.round2 {
	margin: auto;
	border-radius: 50%;
	width: 120px;
	height: 120px;
	background-image: url("resources/profile/profile.png");
	background-size: 100% 100%;
}
#profileDiv{
	transform: translateX(0%);
	width: 40%;
	height: 80%;
	border: 13px solid #8794A3;
	border-radius: 25%;
	margin: auto;
	text-align :  center;
			margin-top : 20px;
			padding: 1%;
}
		.area{
			margin: 5px 5px;
			padding: 5px 5px;
			width:100%;
			max-width: 175%;
			overflow: hidden;
		}
		.td1{
			width: 40%;
			
		}
		.td2{
			width:175%;
		}
		#cUpdateForm{
		    transform: translateX(0%);
			padding-bottom: 10%;
		}
		
			.pass{
			margin: 5px 5px;
			padding: 5px 5px;
			width:150%;
			max-width: 175%;
		}
#file{
		opacity: 0;
		z-index: 10;
		position:absolute; 
		resize: vertical; 
		width: 100%;
		height: 100%;
		border: 1px solid #999;
		cursor: pointer;
		}
		
	#backImg{
		background-position: center;
	    background-size: auto;
	    background-repeat: no-repeat;
	    resize: vertical; 
	    width: 31%;
	    left : 73%;
	    height: 29%;
	    top: 73%;
	    position: absolute;
	    background-image: url('./resources/images/profile_photo.png');
		}	
		#pofileArea{
			position: relative;
			width: 120px;
			height: 120px;
			margin: auto;
		}		
</style>
</head>
<body>
	<jsp:include page="loginBox.jsp" />
	<section id="home" style="padding-top: 0px">
		<div class="container">
			<div class="row">
								<div class="section-title">
                         <h3 style="text-align: center; font-size: 22px">마이 페이지</h3>
                    </div>
			</div>
			</div>
	</section>
	<div id="profileDiv">
	<br/>
	
	<form id="cUpdateForm" action="cUpdate" method="post" enctype="multipart/form-data">
	
	<div id="pofileArea">
		<input id="file" name="file"  type="file" class="area"  placeholder="사진 등록" onchange="fileInfo(this)" />
		<input type="hidden" id="fileChk" name="fileChk" value="0">
		<div class="round2">
			<img style="width: 100%; height: 100%;left:0%;position:absolute;border-radius: 50%;" id="" alt="" src="resources/profile/${sessionScope.cm.sysName }">
			<img id="backImg" alt="" src="">
		</div>
		
	</div>
	
		<br/>
		<table>
			<tr>
				<td class="td1">법인명</td>
				<td class="td2">
				<input style="font-weight: bold; color: #000;" name="c_name" class="area"  value="${sessionScope.cm.c_name}" maxlength="30">
				<input type="hidden" value="${sessionScope.mb.id }" name="id">
				<br/></td>
				
			</tr>
			<tr>
			 	<td class="td1">브랜드명</td>
			 	<td class="td2"><input style="font-weight: bold; color: #000;" name="nickName" class="area" placeholder="${sessionScope.mb.nickName}" maxlength="30" readonly><br/></td>
			 </tr>
			 <tr>
			 	<td class="td1">비밀번호 변경</td>
			 	<td class="td2"><input id="m_pw1" name="pw" oninput="chkPw()" class="pass" type="password" placeholder="변경할 비밀번호를 입력해주세여" maxlength="30"><br/></td>
			 </tr>
			 <tr>
			 	<td class="td1">비밀번호 확인</td>
			 	<td class="td2"><input id="m_pw2" oninput="chkPw()" class="pass" type="password" placeholder="비밀번호를 확인해주세여" maxlength="30"><br/></td>
			 </tr>
			 <tr>
			 	<td class="td1"></td>
			 	<td class="td2"><font style="text-align: center;" name="checkMessage" class="pass" size="2"></font></td>
			 </tr>
			 <tr>
			 	<td class="td1">자기소개</td>
			 	<td class="td2">
			 		<textarea name="intro" class="area"  style="resize: none;height: 40%;width: 175%" maxlength="50" placeholder="자기소개를 입력해주세요(최대 50자)">${sessionScope.mb.intro}</textarea>
			 	</td>
			 </tr>
		</table>
		<br/>
		<div id="banBtn">
		
		</div>
		<br/>
		<br/>
		<br/>
		<input type="button" onclick="update()"  class="btn btn-default" style="float: right; width:10%; margin-right: 13%;" value="수정">
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>

<script>

var msg ="${msg}";
if(!msg ==""){
	alert(msg);
}

function getCmaFileView(f) {
	   var fileNm = $(".photo").val();
	    console.log("파일이름 : "+fileNm);
	    var reader = new FileReader(); // FileReader 객체 사용
	    console.log("파일이름 : "+reader);
	    if (fileNm != "") {
	        var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
	        if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
	            alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
	             fileNm = '';
	             $(".photo").val('');
	            return false;
	        }
	    }
	}

	function fileInfo(f){
	   //getCmaFileView(f);
		if(f.value==""){
	        console.log("empty");
	        $("#fileChk").val(0);//파일 첨부 안함
	    }else{
	        console.log("unempty");
	        $("#fileChk").val(1);//파일 첨부 했음
	    }
	   var file = f.files; // files 를 사용하면 파일의 정보를 알 수 있음

	   var reader = new FileReader(); // FileReader 객체 사용
	   reader.onload = function(rst){ // 이미지를 선택후 로딩이 완료되면 실행될 부분
	      $('.round2').html('<img style="width: 100%; height: 100%;left:0%;position:absolute;border-radius: 50%;" src="' + rst.target.result + '"><img id="backImg" alt="" src="">');
	      // 이미지는 base64 문자열로 추가
	      // 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
	   }
	   reader.readAsDataURL(file[0]);
	}

//비밀번호 확인
var pwchkA = 0;
var pwc = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;

function chkPw() {
	var pwclass = $('.pass').val();
    var repw = $('#m_pw2').val();
    if(repw=="" && (pwclass != repw && pwclass == repw)){
    	$("#m_pw1").css("background-color", "#FFCECE");
    	$("#m_pw2").css("background-color", "#FFCECE");
   
    }else if (pwclass == repw && pwc.test($('#m_pw1').val())) { // 비밀번호 일치
    	$("#m_pw1").css("background-color", "#B0F6AC");
    	$("#m_pw2").css("background-color", "#B0F6AC");
    	$('font[name=checkMessage]').text('사용 가능한 패스워드입니다.');
        $('font[name=checkMessage]').css('color','green');
        pwchkA=true;
        pwchkA = 1;
    
    }else if (pwclass != repw) { // 비밀번호 불일치
    	pwchkA = 0;
    	$("#m_pw1").css("background-color", "#FFCECE");
    	$("#m_pw2").css("background-color", "#FFCECE");
    	$('font[name=checkMessage]').text('8~20자 영문,숫자,특수문자 1개이상');
        $('font[name=checkMessage]').css('color','red');
        
    }
}

var birth;

	function update() {
		console.log("이벤트 체크");
		console.log(pwchkA);
		if(pwchkA==true){
			alert("성공");
			$("#cUpdateForm").submit();
		}else{
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
	}
	
</script>
</html>