<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 상세보기</title>
<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="resources/css/style.css">
<style>
/* 공지사항 문의사항버튼 */
#Notice {
	padding: 20px;
	align: center;
	top: 10px;
	left: 50%;
	overflow: hidden;
}
/* 알림ㅏ차아아앙 */
html, body { height:100%;}
#Contents {
	border: 3px solid #0B0B3B;
    width: 30%;
    float: left;
    position: absolute;
    height: 81%;
    top: 73px;
    left: 240px;
    border-radius: 10px;
    align: center;
}

.font {
	font-weight: 600;
	font-size: 30px;
	position: absolute;
	left: 240px;
	top: 20px;
}

#two1 {
	position: absolute;
	left: 75%;
    top: 93%;
	background-color: white;
	border: 3px solid #0B0B3B;
	border-radius: 15px 15px 15px 15px;
	font-weight: 600;
	padding: 5px;
}
#two1:hover {
	position: absolute;
	left: 75%;
    top: 93%;
	color: white;
    background-color: black;
	border: 3px solid #0B0B3B;
	border-radius: 15px 15px 15px 15px;
	font-weight: 600;
	padding: 5px;
}

#two3 {
	position: absolute;
    left: 90%;
    top: 93%;
	background-color: white;
	border: 3px solid #0B0B3B;
	border-radius: 15px 15px 15px 15px;
	font-weight: 600;
	padding: 5px;
}
#two3:hover {
	position: absolute;
    left: 90%;
     top: 93%;
	color: white;
    background-color: black;
	border: 3px solid #0B0B3B;
	border-radius: 15px 15px 15px 15px;
	font-weight: 600;
	padding: 5px;
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
#photo{
   width: 95%;
    position: relative;
    transform: translateX(2%);
    height: 560px;
}
</style>


</head>
<body>
<jsp:include page="loginBox.jsp"/>

<div id="Notice">
		<a id="notice" href="aQuestionF">문의사항</a><br/>
		<a id="notice2" href="aNoticeF">공지사항</a><br/>
	<b class="font">문의사항 상세보기</b>
		<div id="Contents">
			<table>
				<tr>
					<td>
						제목 : ${qDetail.b_title} &nbsp;&nbsp;&nbsp;&nbsp; 작성날짜 : ${qDetail.rp_date} &nbsp;&nbsp; 닉네임 : ${qDetail.nickName}
						<br/><br/><br/>
						<div id="photo">문의사유 : ${qDetail.rp_reason}</div>
						<c:if test="${qnabPhoto!=null}">
							<div>
								<img  src="./${qnabPhoto}" alt="이미지">
							</div>
						</c:if>
						<div id="content" style="position:  relative;font-size: 15px;font-weight: 600;left: 15px;">내용 : ${qDetail.b_content}</div><br/><br/><br/>
					</td>
				</tr>
		</table>
	</div>
</div>
		<div>
			<a id="two3" href='aQuestionF'>뒤로</a>
		</div>
</body>

<script>
	
</script>
</html>

