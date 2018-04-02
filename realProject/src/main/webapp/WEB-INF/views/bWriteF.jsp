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
<link rel="stylesheet" href="resources/css/style.css">
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700"
	rel="stylesheet">
	<style>
		.area{
			margin: 5px 5px;
			padding: 5px 5px;
			width:97.7%;
		}
		#writeFarea{
			margin: auto;
			border: 20px solid #8794A3;
			width: 32%;
			height: 85%;
			margin-top : 20px;
			margin-bottom: 100px;
		}
		#hashtag{
			height: 8%;
			word-spacing: inherit;
			resize: none;
		}
		#b_title{
			margin-top: 3%;
		}
		#btnArea{
			padding-top: 50px;
			text-align : right;
			padding-right: 5px;
		}
		#file{
		opacity: 0;
		z-index: 10;
		}
		#backImg{
		background-position: center;
	    background-size: auto;
	    background-repeat: no-repeat;
	    resize: vertical; 
	    width: 100%;
	    height: 100%;
	    border: 1px solid #999;
	    position: absolute;
	    background-image: url('./resources/images/upload-ico.png');
	    background-color: #f5f5f5;
		}
	</style>
</head>
<body>
<jsp:include page="loginBox.jsp"/>
<form id="writeForm" action="bWrite" method="post" enctype="multipart/form-data">
	<div class="section-title">
                         <h3 style="text-align: center; font-size: 22px">Write Form</h3>
                    </div>
<fieldset id="writeFarea">
	<input id="b_title" class="area" type="text" placeholder="제목을 입력해주세요" maxlength="30" name="b_title"><br/>
	<textarea id="b_content"  name="b_content" class="area"  style="resize: none; width: 97.7%;height: 25%" placeholder="내용을 입력해주세요"></textarea><br/>
	<div style="width: 97.5%;position: relative;height: 40%;margin: 5px 5px"> 
	<input id="file" name="file"  type="file" class="area" style="position:absolute; resize: vertical; width: 100%;height: 100%;border: 1px solid #999;cursor: pointer;" placeholder="사진 등록" onchange="fileInfo(this)"/>
	<input type="hidden" id="fileChk" name="fileChk" value="0">
	<div id="img_box">
	<img id="backImg">
	</div>
	</div>
	<br/>
	<textarea id="hashtag" name="hashtag" class="area" type="text" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" placeholder="해시태그를 입력해주세요"></textarea><br/>
	<div id="btnArea">
	<input class="btn btn-default" type="button" id="bWrite" value="작성"/>
	<input class="btn btn-default" type="button" id="cancle" value="취소"/>
	</div>
</fieldset>
</form>
<div></div>
</body>
<script>

$('#hashtag').keydown(function() {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
});

//이미지 파일 유효성검사
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
var fChk = 0;
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
      $('#img_box').html('<img  id="backImg" style=" background-image: none;" src="' + rst.target.result + '">');
      // 이미지는 base64 문자열로 추가
      // 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
   }
   reader.readAsDataURL(file[0]);
}
	
	function noSpaceForm(obj) { // 공백사용못하게
	    var str_space = /\s/;  // 공백체크
	    if(str_space.exec(obj.value)) { //공백 체크
	        obj.focus();
	        obj.value = obj.value.replace(' ',''); // 공백제거
	        return false;
	    }
	}
	
	$("#bWrite").click(function(){
		if($("#b_title").val() == ""){
			alert("제목을 입력해주세요!");
		}else if($("#b_content").val() == ""){
			alert("내용도 입력해주세요!");
		}else if($("#fileChk").val() == 0){
			alert("파일을 등록 해주세요");
		}else{
			$("#writeForm").submit();
		}
	});
	
	$("#cancle").click(function(){
		console.log("취소");
		location.href="myStyle?nickName=${sessionScope.mb.nickName }";
	});
	
</script>
</html>