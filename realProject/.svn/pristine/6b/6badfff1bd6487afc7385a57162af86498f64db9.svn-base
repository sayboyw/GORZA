<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 수정하기</title>
<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="resources/css/style.css">
<style>
/* 알림ㅏ차아아앙 */
html, body {
	height: 100%;
}
#Notice {

}
#Contents {
	border: 20px solid #8794A3;
	padding: 3%;
	width: 35%;
	float: left;
	position: absolute;
	height: 80%;
	top: 36%;
	left: 33%;
}
#notice {
	LEFT: 20%;
	font-size: 19px;
	position: absolute;
	width: 9%;
	height: 5%;
	top: 37%;
	color: #777;
	background-color: #white;
	border: 2px solid #e5e5e5;
	border-radius: 0px 20px 0px 0px;
	padding: 8px;
}
#notice2 {
	left: 20%;
	font-size: 19px;
	position: absolute;
	top: 42%;
	width: 9%;
	height: 5%;
	color: #777;
	background-color: #e5e5e5;
	border: 2px solid #e5e5e5;
	border-radius: 0px 0px 20px 0px;
	padding: 8px;
}

#notice:hover {
	left: 20%;
	position: absolute;
	width: 9%;
	height: 5%;
	border-radius: 0px 20px 0px 0px;
	background-color: #e5e5e5;
	color: #777;
	padding: 8px;
}

.img {
	width: 100%;
	height: 200px;
}

.img img {
	width: 100%;
	height: 267px;
}

.content {
	position: absolute;
	top: 11%;
	width: 267px;
	left: 113px;
}

#file {
	cursor: pointer;
	position: relative;
	top: 7px;
}

.filement {
	position: relative;
	top: 17px;
	left: 23px;
}

.area {
	margin: 5px 5px;
	padding: 5px 5px;
}

.noticewritebtn {
	text-align: right;
	margin-top: 16%;
}

.area {
	margin: 5px 5px;
	padding: 5px 5px;
	width: 97.7%;
}

.noticewritebtn {
	text-align: right;
	margin-top: 16%;
}
.block{
	height: 15%;
}
.box{
	width: 100%;
    height: 280px;
}
img{
    width: 100%;
    border: 3px black solid;
    position: relative;
}
#img_box{
    position: absolute;
    width: 33%;
}
</style>
</head>
<body>
<jsp:include page="loginBox.jsp"/>
				<div class="section-title">
				<h3 style="text-align: center; font-size: 22px">공지사항 수정하기</h3>
			</div>
<div id="Notice">
		<a id="notice" href="aQuestionF">문의사항</a><br/>
		<a id="notice2" href="aNoticeF">공지사항</a><br/>
		<div id="Contents">
			<input type="hidden" name="no_num" value="${nDetail.no_num }">
			<input type="hidden" name="noticePhoto" value="${noticePhoto}"/>
			<form action="./aNoticeUpdate?no_num=${nDetail.no_num}" method="post" enctype="multipart/form-data">

				<table style="width: 100%;">
					<tr>
						<td>
							<input type="text" class="area" name="no_title" value="${nDetail.no_title}"/>
						</td>
					</tr>
					<tr>
						<td><textarea class="area" rows="10" name="no_content">${nDetail.no_content}</textarea></td>
					</tr>
					<tr>	
						<td id="add" >
							<input class="photo" id="file" type="file" name="files[]" onchange="fileInfo(this)"/><br/>
							<input type="hidden" id="fileChk" name="fileChk" value="0">
						</td>
					</tr>
					<tr>
						<td>
							<c:if test="${noticePhoto !=null}">
								<div class="box">
									<img style="position:absolute;width: 80%;height:39%" id="photoupdate" class="img1" src="${noticePhoto}" alt="이미지">
									<div id="img_box">
										<div class="img2"></div>
									</div>
								</div>
							</c:if>
						</td>
					</tr>
					<tr>
						<td>
							<div class="btn3" style="position:relative;top:9px;left:73%;">
								<button id="btn1" class="btn btn-default">수정</button>
								<button id="btn2" class="btn btn-default" onclick="location.href='aNoticeF'">목록보기</button>
							</div>
						</td>
					</tr>
				</table>
			</form>
			<div class="block"></div>
		</div>
</div>
</body>
<script>
	//이미지 파일 유효성검사
    function getCmaFileView(f) {
       var fileNm = $(".photo").val();
       var fileNm2 = $("#photoupdate").val();
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
    	getCmaFileView(f);
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
    		$('#img_box').html('<img src="' + rst.target.result + '">'); // append 메소드를 사용해서 이미지 추가
    		$(".img1").css("display", "none");
    		// 이미지는 base64 문자열로 추가
    		// 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
    	}
    	reader.readAsDataURL(file[0]); // 파일을 읽는다, 배열이기 때문에 0 으로 접근
    }
    
    var msg = "${msg}";
    if(msg != ""){
        alert(msg);
        location.href="aNoticeF";
    }
    
</script>
</html>