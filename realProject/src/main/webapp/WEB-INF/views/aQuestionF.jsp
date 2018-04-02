<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>문의사항 리스트</title>
      <script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <link rel="stylesheet" href="resources/css/style.css">
<style>
/* 공지사항 문의사항버튼 */
#Notice {
	padding: 20px;
}

#Contents {
    border: 20px solid #8794A3;
    width: 34%;
    height: 40%;
    position: absolute;
    top: 38%;
    left: 34%;
}

#two {
    position: absolute;
    left: 64%;
    top: 80%;
}

#notice{
	LEFT: 20%;
    font-size: 19px;
    position: absolute;
    width: 9%;
    height: 5%;
    top:37%;
    color: #777;
    background-color: #e5e5e5;
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
    background-color: white;
    border: 2px solid #e5e5e5;
    border-radius: 0px 0px 20px 0px;
    padding: 8px;
}
#notice2:hover {
	top: 42%;
    width: 9%;
    height: 5%;
    color: #777;
    background-color: #e5e5e5;
    border: 2px solid #e5e5e5;
    border-radius: 0px 0px 20px 0px;
    padding: 8px;
}
#head {
	margin: 15px;
	font-size: 19px;
}

#pageing {
    position: absolute;
    top: 72%;
    left: 49%;
    font-size: 20px;
}

#container {
	height: 28%;
	margin: auto;
	width: 58%;
}

#bannerArea {
	position: relative;
}

/* 알림ㅏ차아아앙 */
html, body {
	height: 100%;
}
</style>
</head>
<body>
<jsp:include page="loginBox.jsp"/>
         <div class="section-title">
            <h3 style="text-align: center; font-size: 22px">문의사항 리스트</h3>
         </div>
<div id="Notice">
   <a id="notice" href="aQuestionF">문의사항</a><br/>
   <a id="notice2" href="aNoticeF">공지사항</a><br/>
      <div id="Contents">
         <table id="head">
            <tr>
               <th align="left">글번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
               <th align="left">제목&nbsp;&nbsp;</th>
               <th align="left">닉네임&nbsp;&nbsp;</th>
               <th align="left">작성날짜&nbsp;&nbsp;</th>
            </tr>
            <c:forEach items="${qlist }" var="qlist">
               <tr>
                  <td>
                     ${qlist.b_num}&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td>
                     <a href="./aQuestionDetailF?b_num=${qlist.b_num}&&b_nickName=${qlist.nickName}&&b_id=${qlist.id}&&write_id=${qlist.write_id}&&group_num=${qlist.group_num}&&upper_num=${qlist.upper_num}&&rp_divide=${qlist.rp_divide}">${qlist.b_title}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td>
                     ${qlist.nickName}&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td>
                     ${qlist.rp_date}&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
               </tr>
            </c:forEach>         
         </table>
      </div>
   </div>
<div>
   <b id="pageing">${boardPaging}</b>
   <c:choose>
        <c:when test="${state == '0'}">
            <button id="two" class="btn btn-default" onclick="location.href='./bReqWriteF'">글쓰기</button>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>
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