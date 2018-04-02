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
	border: 20px solid #8794A3;
	padding:3%;
    width: 35%;
    float: left;
    position: absolute;
    height: 89%;
    top: 36%;
    left: 33%;
}


#notice{
	LEFT: 20%;
    font-size: 19px;
    position: absolute;
    width: 9%;
    height: 5%;
    top:37%;
    color: #777;
    background-color: #white;
    border: 2px solid #e5e5e5;
    border-radius: 0px 20px 0px 0px;
    padding: 8px;
}
#notice2{
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
#photo{
   width: 95%;
    position: relative;
    transform: translateX(2%);
    height: 560px;
}
#btn .adminbtn{
	position: relative;
    left: 51%;
    top: 20px;
}
#btn .userbtn{
	position: relative;
    left: 72%;
    top: 20px;
}
.tablecss{
	width: 100%;
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
.detaildtn{
    width: 110%;
    left: 53%;
    position: relative;
}
.block{
	height: 15%;
}
#back{
    position: relative;
    top: -7px;
    left: 86%;
}
</style>
</head>
<body>
<jsp:include page="loginBox.jsp"/>
			<div class="section-title">
				<h3 style="text-align: center; font-size: 22px">공지사항 상세보기</h3>
			</div>
			<div id="Notice">
				<a id="notice" href="aQuestionF">문의사항</a><br/>
				<a id="notice2" href="aNoticeF">공지사항</a><br/>
					<div id="Contents">
						<table class="tablecss">
							<tr>
								<td>
								<a style="text-align: right; width:97.7%;">작성날짜 : ${nDetail.no_date}&nbsp;&nbsp; 조회수 : ${nDetail.no_hit}</a>
								<input type="text" class="area" placeholder="제목 : ${nDetail.no_title}" readonly/>
								<input type="text" class="area" placeholder="내용 : ${nDetail.no_content}" readonly/>
									<c:if test="${noticePhoto!=null}">
										<div>
											<img id="photo" src="./${noticePhoto}" alt="이미지"><br/><br/>
										</div>
									</c:if>
								</td>
							</tr>
						</table>
							<div id="btn">
								<c:choose>
									<c:when test="${state == '2'}">
									<div class="detaildtn">
										<button class="btn btn-default" onclick="location.href='aNoticeUpdateF?no_num=${nDetail.no_num}'">수정하기</button>
										<button class="btn btn-default" onclick="location.href='aNoticeDel?no_num=${nDetail.no_num }'">삭제하기</button>
										<button class="btn btn-default" onclick="location.href='aNoticeF'">뒤로</button>
									</div>
									</c:when>
									<c:otherwise>
										<button id="back" class="btn btn-default" onclick="location.href='aNoticeF'">뒤로</button>
									</c:otherwise>
								</c:choose>
							</div>
						<div class="block"></div>
					</div>
				</div>
</body>
<script>
var msg = "${msg}";

if(msg != ""){
    alert(msg);
    location.href="aNoticeF";
}



	
</script>
</html>