<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의하기 답변글쓰기</title>
<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="resources/css/style.css">
<style>
/* 알림ㅏ차아아앙 */
html, body { height:100%;}
#two1 {
	position: absolute;
	left: 76%;
    top: 91%;
}
#two2 {
	position: absolute;
	left: 85%;
    top: 91%;
}


#Notice {
	padding: 20px;
	align: center;
	top: 10px;
	left: 50%;
	overflow: hidden;
}

#Contents {
	border: 20px solid #8794A3;
	padding:3%;
    width: 35%;
    float: left;
    position: absolute;
    height: 75%;
    top: 36%;
    left: 33%;
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
	top: 43%;
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
	top: 43%;
	width: 9%;
	height: 5%;
	border-radius: 0px 0px 20px 0px;
	background-color: #e5e5e5;
	color: #777;
	padding: 8px;
}
.img{
	width: 100%;
	height: 200px;
}

.img img{
	width: 100%;
	height: 200px;
}
.content{
    position: absolute;
    top: 11%;
    width: 267px;
    left: 113px;
}
.file{
	height: 888px;
	font-size: 18px;
    font-weight: 800;
}
#file{
	cursor: pointer;
}
.filement{
	position: relative;
    top: 4px;
    left: 23px;
}
	.area {
		margin: 5px 5px;
		padding: 5px 5px;
		width: 97.7%;
	}
	.secretbtn{
		text-align: right;
	}
</style>
</head>
<body>
<jsp:include page="loginBox.jsp"/>
			<div class="section-title">
				<h3 style="text-align: center; font-size: 22px">문의사항 답변쓰기</h3>
			</div>
<div id="Notice">
	<a id="notice" href="aQuestionF">문의사항</a><br/>
	<a id="notice2" href="aNoticeF">공지사항</a><br/>
			<div id="Contents">
				<form action="aSecretWrite" method="post" enctype="multipart/form-data">
				<input type="hidden" value="${id}" name="write_id">
				<input type="hidden" value="${b_num}" name="b_num">
				<input type="hidden" value="${rp_divide}" name="rp_divide">
				<input type="hidden" value="${group_num}" name="group_num">
				<input type="hidden" value="${rp_reason}" name="rp_reason">
						<table style="width: 100%">
							<tr>
								<td>
								<input type="text" class="area" name="b_title" placeholder="제목을 입력해주세요" "/>
								</td>
							</tr>
							<tr>
								<td><textarea class="area" rows=10 name="b_content" placeholder="내용을 입력해주세요"></textarea></td>
							</tr>
							<tr>
								<td id="add">
									<input class="photo" id="file" type="file" name="files[]" onchange="fileInfo(this)"/><br/>
									<input type="hidden" id="fileChk" name="fileChk" value="0">
								</td>
							</tr>
							<tr>
								<td>
									<div class="img" id="img_box"></div>
								</td>
							</tr>	
							<tr>
								<td>
									<div class="secretbtn">
									<br/>
									<button class="btn btn-default">글작성</button>
									<button class="btn btn-default" onclick="location.href='aQuestionF'">리스트 보기</button>
									</div>
								</td>
							</tr>
					</table>
				</form>
			</div>
</div>

</body>
<script>
console.log('${id}');
console.log('${b_num}');
console.log('${rp_reason}');
console.log('${group_num}');
console.log('${rp_divide}');
var fChk = 0;
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
    		// 이미지는 base64 문자열로 추가
    		// 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
    	}
    	reader.readAsDataURL(file[0]); // 파일을 읽는다, 배열이기 때문에 0 으로 접근
    }
</script>
</html>