<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의사항 수정하기</title>
<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="resources/css/style.css">
<style>
/* 공지사항 문의사항버튼 */
#Notice {

}

#Contents {
	border: 20px solid #8794A3;
	padding: 3%;
	width: 35%;
	float: left;
	position: absolute;
	height: 85%;
	top: 36%;
	left: 33%;
}
/* 알림ㅏ차아아앙 */
html, body {
	height: 100%;
}

#two1 {
    position: absolute;
    left: 63%;
    top: 94%;
}

#two2 {
    position: absolute;
    left: 73%;
    top: 94%;
}

#notice {
	LEFT: 20%;
	font-size: 19px;
	position: absolute;
	width: 9%;
	height: 5%;
	color: #777;
	background-color: #e5e5e5;
	border: 2px solid #e5e5e5;
	border-radius: 0px 20px 0px 0px;
	padding: 8px;
}

#notice2 {
	left: 20%;
	font-size: 19px;
	position: absolute;
	top: 41%;
	width: 9%;
	height: 5%;
	color: #777;
	background-color: #white;
	border: 2px solid #e5e5e5;
	border-radius: 0px 0px 20px 0px;
	padding: 8px;
}

#notice2:hover {
	left: 20%;
	position: absolute;
	top: 41%;
	width: 9%;
	height: 5%;
	border-radius: 0px 0px 20px 0px;
	background-color: #e5e5e5;
	color: #777;
	padding: 8px;
}

.img {
	width: 100%;
	height: 220px;
}

.img img {
	width: 100%;
	height: 220px;
}

.content {
	position: absolute;
	top: 18%;
	width: 264px;
	left: 112px;
}

.reason2 {
	position: relative;
	left: -104%;
	top: 26px;
}

#reason {
	font-size: 20px;
	font-weight: 600;
	position: relative;
	top: 27px;
	left: 13px;
}

.filement {
	position: relative;
	top: -14px;
	left: 19px;
}

.area {
	margin: 5px 5px;
	padding: 5px 5px;
	width: 100%;
}

#selectreason {
	border: 1px solid #BDBDBD;
	border-radius: 10px;
	padding: 11px;
	width: 97.7%;
	margin: 4px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background: url("./resources/images/arrowDown.jpg") no-repeat 95% 50%;
}
</style>
</head>
<body>
<jsp:include page="loginBox.jsp"/>
			<div class="section-title">
				<h3 style="text-align: center; font-size: 22px">문의사항 수정하기</h3>
			</div>
<div id="Notice">
		<a id="notice" href="aQuestionF">문의사항</a><br/>
		<a id="notice2" href="aNoticeF">공지사항</a><br/>
		<div id="Contents">
			
			<input type="hidden" name="b_num" value="${qDetail.b_num }">
			<input type="hidden" name="questionPhoto" value="${questionPhoto}"/>
			<form action="./aQuestionUpdate?b_num=${qDetail.b_num}" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>
					<input type="text" class="area" name="b_title" placeholder="제목을 입력해주세요"  value="${qDetail.b_title}"/>
					</td>
				</tr>	
				<tr>
					<td>
						<input type="text" class="area" placeholder="사유를 선택해주세요" readonly value="${qDetail.rp_reason}"/>
					</td>
				</tr>
				<tr>
					<td>
						<select id="selectreason" name="rp_reason">      
		                       <option value="그냥">그냥</option>
		                       <option value="심심해서">심심해서</option>
		                       <option value="문의사유입니다">문의사유입니다</option>
		                       <option value="바보야">바보야</option>
		               </select>
	               </td>
				</tr>	
				<tr>
					<td><textarea class="area" rows="10" placeholder="내용을 입력해주세요" name="b_content">${qDetail.b_content}</textarea></td>
				</tr>
				<tr>
					<td id="add">
						<input class="photo"  id="file" type="file" name="files[]" onchange="fileInfo(this)"/><br/>
						<input type="hidden" id="fileChk" name="fileChk" value="0">
					</td>
				</tr>
				<tr>
					<td>
					<c:if test="${questionPhoto !=null}">
						<img id="photoupdate" class="img" src="${questionPhoto}" alt="이미지">
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
						<div class="img">
							<div id="img_box"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<button id="two1" class="btn btn-default">수정</button>
						<button id="two2" class="btn btn-default" onclick="location.href=''aQuestionF">목록보기</button>
					</td>
				</tr>
		</table>
		</form>
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
		$('#img_box').html('<img src="' + rst.target.result + '">');
		$("#photoupdate").css("display", "none");
		// 이미지는 base64 문자열로 추가
		// 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
	}
	reader.readAsDataURL(file[0]); // 파일을 읽는다, 배열이기 때문에 0 으로 접근
}

var msg = "${msg}";
if(msg != ""){
    alert(msg);
    location.href="aQuestionF";
}
</script>
</html>