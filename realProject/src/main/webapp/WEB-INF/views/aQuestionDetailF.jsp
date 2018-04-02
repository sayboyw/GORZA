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
html, body {
	height: 100%;
}

#Contents {
	border: 20px solid #8794A3;
	padding: 3%;
	width: 35%;
	float: left;
	position: absolute;
	height: 100%;
	top: 36%;
	left: 33%;
}

#two1 {
	position: absolute;
   	left: 67%;
	top: 95%;
}

#two2 {
    position: absolute;
    left: 52%;
    top: 95%;
}

#two3 {
	position: absolute;
   	left: 82%;
	top: 95%;
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

#photo {
	width: 100%;
	position: relative;
	height: 510px;
}

#btn .adminbtn {
	position: relative;
	left: 53%;
	top: 17px;
}

#btn .userbtn {
	position: relative;
	left: 62%;
	top: 18px;
}

.tablecss {
	width: 100%;
}

#btn .adminbtn2 {
	position: relative;
	left: 71%;
	top: 19px;
}

.area {
	margin: 5px 5px;
	padding: 5px 5px;
	width: 97.7%;
	font-weight: 900;
}

.area1 {
	margin: 5px 5px;
	padding: 5px 5px;
	width: 97.7%;
	font-weight: 900;
	text-align: right;
}
</style>


</head>
<body>
<jsp:include page="loginBox.jsp"/>
			<div class="section-title">
				<h3 style="text-align: center; font-size: 22px">문의사항 상세보기</h3>
			</div>
<div id="Notice">
		<a id="notice" href="aQuestionF">문의사항</a><br/>
		<a id="notice2" href="aNoticeF">공지사항</a><br/>
		<div id="Contents">
			<table class="tablecss">
				<tr>
					<td>
						<a style="text-align: right; width:97.7%;">작성날짜 : ${qDetail.rp_date}</a>
						<input type="text" class="area" placeholder="제목 : ${qDetail.b_title}" readonly/>
						<input type="text" class="area" placeholder="닉네임 : ${qDetail.nickName}" readonly/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" class="area" placeholder="사유 : ${qDetail.rp_reason}" readonly/>
						<br/>
						<input type="text" class="area" placeholder="내용 : ${qDetail.b_content}" readonly/><br/><br/><br/>
						<c:if test="${qnabPhoto!=null }">
							<div>
								<img id="photo" src="./${qnabPhoto}" alt="이미지"><br/><br/>
							</div>
						</c:if>
					</td>
				</tr>
		</table>
			<div id="btn">
				<c:choose>
					<c:when test="${state == '0'}">
						<c:if test="${group_num ne upper_num}">
							<button id="two1" class="btn btn-default" onclick="location.href='bReqDel?b_num=${qDetail.b_num }'">삭제하기</button>
							<button id="two2" class="btn btn-default" onclick="location.href='aQuestionUpdateF?b_num=${qDetail.b_num }'">수정하기</button>
							<button id="two3"class="btn btn-default" onclick="location.href='aQuestionF'" >뒤로</button>
						</c:if>
						<c:if test="${group_num eq upper_num}">
							<button id="two3"class="btn btn-default" onclick="location.href='aQuestionF'" >뒤로</button>
						</c:if>
					</c:when>
					<c:when test="${state == '2'}">
						<c:if test="${group_num ne upper_num}">
							<button id="two1" class="btn btn-default" onclick="location.href='aSecretWriteF?b_num=${qDetail.b_num}&&nickName=${qDetail.nickName}&&id=${qDetail.id}&&write_id=${qDetail.write_id}&&group_num=${qDetail.group_num}&&rp_reason=${qDetail.rp_reason}&&upper_num=${qDetail.upper_num}&&rp_divide=${qDetail.rp_divide}'">답글하기</button>
							<button id="two3" class="btn btn-default" onclick="location.href='aQuestionF'" >뒤로</button>
						</c:if>
						<c:if test="${group_num eq upper_num}">
							<button id="two3"class="btn btn-default" onclick="location.href='aQuestionF'" >뒤로</button>
						</c:if>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
		
</body>

<script>
var msg = "${msg}";

if(msg != ""){
    alert(msg);
    location.href="aQuestionF";
}
</script>
</html>

