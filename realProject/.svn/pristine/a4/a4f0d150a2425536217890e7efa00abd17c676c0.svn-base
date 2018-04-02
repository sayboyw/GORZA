<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 리스트</title>
<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="resources/css/style.css">
<style>
/* 공지사항 문의사항버튼 */
#Notice {
   padding: 20px;
   top: 10px;
   left: 50%;
   overflow: hidden;
}
#Contents {
    border: 20px solid #8794A3;
    width: 33%;
    height: 40%;
    position: absolute;
    top: 38%;
    left: 34%;
}


/* 알림ㅏ차아아앙 */
html, body { height:100%;}

#two1 {
	position: absolute;
    left: 64%;
    top: 76%;
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
#head {
    margin: 15px;
    font-size: 20px;
}

#Contents #pageing{
   font-size: 20px;
    position: absolute;
    left: 46%;
    top: 109%;
}

#Contents #write {
    left: 84%;
    position: absolute;
    top: 116%;
}
</style>
</head>
<body>
<jsp:include page="loginBox.jsp"/>

			<div class="section-title">
				<h3 style="text-align: center; font-size: 22px">공지사항 리스트</h3>
			</div>
<div id="Notice">
   <a id="notice" href="aQuestionF">문의사항</a><br/>
   <a id="notice2" href="aNoticeF">공지사항</a><br/>
      <div id="Contents">
         <table id="head">
            <tr>
               <th align="left">글번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
               <th align="left">제목&nbsp;&nbsp;</th>
               <th align="left">작성날짜&nbsp;&nbsp;</th>
               <th align="left">조회수&nbsp;&nbsp;</th>
            </tr>
            <c:forEach items="${nlist}" var="nlist">
               <tr>
                  <td>
                     ${nlist.no_num}&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td>
                     <a href="./aNoticeDetailF?no_num=${nlist.no_num}">${nlist.no_title}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td>
                     ${nlist.no_date}&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td>
                     ${nlist.no_hit}&nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
               </tr>
            </c:forEach>
         </table>
         <br/>
         <div id="pageing">
            <b style="align:center">${boardPaging}</b>
         </div>
         <div id="write">
            <c:choose>
                 <c:when test="${state == '2'}">
                    <button id="two1" class="btn btn-default"  onclick="location.href='./aNoticeWriteF'">글쓰기</button>
                 </c:when>
                 <c:otherwise>
                 </c:otherwise>
             </c:choose>
         </div>
      </div>
   </div>
</body>
</html>