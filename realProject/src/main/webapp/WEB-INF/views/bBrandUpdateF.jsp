<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
   <script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
   <script src="resources/js/jquery.form.js"></script>
   <link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
<style>
<
style>

#close {
   position: absolute;
   top: 15%;
   text-align: center;
   left: 90%;
   z-index: 10000px;
}

#portfolio {
   padding-top: 0px;
}

#home {
   padding-bottom: 0px;
}
#popLine{
   width: 100%;
   height: 100%;
}
#popPhoto{
	padding-right : 10px;
   float: left;
   width: 50%;
   height: 100%;
}
.navbar-nav{
	float: none;
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
	    width: 48%;
	    height: 100%;
	    border: 1px solid #999;
	    opacity : 0.4;
	    position: absolute;
	    background-image: url('./resources/images/upload-ico.png');
	    background-color: #f5f5f5;
		}		
		
</style>
</head>
<body>
<form id="bUpdate" action="bUpdate" method="post" enctype="multipart/form-data" style="height: 100%">
<div id="popLine">
	<input id="file" name="file"  type="file" class="area" style="position:absolute; resize: vertical; width: 48%;height: 100%;border: 1px solid #999;cursor: pointer;" placeholder="사진 등록" onchange="fileInfo(this)" />
	<input type="hidden" id="fileChk" name="fileChk" value="0">
	<input type="hidden" name="b_num" value="${allBoard.b_num }">
	<input type="hidden" name="id" value="${allBoard.id }">
	<div id="popPhoto">
	<img style="width: 48%; height: 100%;opacity:0.8;position:absolute" src="./${allBoard.ap_path}" class="mg-responsive" alt="portfolio">
	<img id="backImg">
	</div>
   <div style="width: 100%;height: 9%;" id="popProfile">
      <img style="height: 100%;   margin-top: 2%" class='round' src="./resources/images/${allBoard.sysName}">&nbsp;&nbsp;
      <a style="font-size: 15px; font-weight: 700; color: #262626; ">${allBoard.nickName}</a>
   </div>
   <br/>
   <div style=" height: 40%" id="popContents">
   	<div id="bcontent" style="width: 100%; height: 70%">
     <br/>
     <textarea name="b_content" style="width: 49%;height: 80%;">${allBoard.b_content}</textarea>
     </div>
     <div id="hashtag" style="height:80% ">
     <textarea name="hashtag" style="width: 49%;height: 80%;">${allBoard.hashtag }</textarea>
     
      </div>
      <div style="text-align: center;">
      <input id = "updateSubmit" type="submit"  value="수정"><input type="button" onclick="cancle(${allBoard.b_num},'${allBoard.id }')" value="취소">
      </div>
   </div>
</div>
</form>
<script>

$("#updateSubmit").bind("click", function() {
	$("#aBrandUpdate").ajaxSubmit({
		success : function(data) {
			detailChk(data.b_num, data.id);
		},
		error : function(error) {
			alert("요청 처리 중 오류가 발생하였습니다.");
		}
	});
	return false;
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
      $('#popPhoto').html('<img style="width: 48%; height: 100%;opacity:0.8;position:absolute" class="mg-responsive" src="' + rst.target.result + '"><img id="backImg">');
      // 이미지는 base64 문자열로 추가
      // 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
   }
   reader.readAsDataURL(file[0]);
}

	function cancle(b_num,id){
		detailChk(b_num, id);
	}
</script>
</html>