<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
	

<style>

#close{
    position: relative;
    top: -40px;
    text-align: center;
    left: 45%;
}
.navbar-nav{
	float: none;
}
#replyArea2{
	position: relative;
    left: 8%;
    font-size: 19px;
    border-collapse: initial;
    margin: -22px;
}
table tr th{
	position: relative;
    left: -6px;
    padding: 6px;
}
table tr td{
	padding: 3px;
}
#title{
	font-size: 30px;
    font-weight: 600;
	font-family: "Segoe UI",Arial,sans-serif;
}
#replyArea{
	position: relative;
    left: 0%;
    font-size: 17px;
    border-collapse: inherit;
    margin: -13px;
}
</style>

</head>
<body>
	<a id="title">댓글 전체보기</a>
		<div align="center" style="margin-bottom: 5px;height: 20px;" id="closeButton2">
			<a id='close' href='#'  class='btn btn-default' onclick='closePop2()' >닫기</a>
		</div>
	<table id="replyArea2">
      
   </table>
	<div id="loadBar" style="text-align: center;display: none;padding-top: 20px">
	 	<img  src='./resources/images/loadingbars.gif' alt='Loading' />
	</div>
</body>
<script>
var sessionId = "${sessionScope.mb.id}";

$(document).ready(function(){
	$.ajax({
        type : 'get',
        url : 'allReply',
        data : {
        	b_num : b_num,
        },
        dataType : 'JSON',
        success : function(data) {
           console.log(data);
           rListMethod(data.rlist);
        },
        error : function(e) {
           alert("응안돼");
           console.log(e);
        }
     });
});

/////////////////////////////////////////////////////////////////////////////////////////////////
var rListLength;
var lengthZ = 0;
var rListZ;

function rListMethod(rlist){//리스트 뿌려주기
	$("#replyArea2").html("");
	rListLength = rlist.length;
	rListZ = rlist;
	
	if(lengthZ>=rListLength){
		lengthZ = rListLength;
	}else if(rListLength < 10){
		lengthZ = rListLength;
	}else{
		lengthZ = 10;
	}

	var contxt = "";
    contxt +="<tr><th>작성자&nbsp;&nbsp;</th><th>내용&nbsp;&nbsp;</th><th>작성날짜&nbsp;&nbsp;</th><th></th></tr>";
       for (var i = 0; i <lengthZ; i++) {
          contxt += "<tr>";
          contxt += "<td>"+rlist[i].nickName+"</td>";
          contxt += "<td>"+rlist[i].re_content+"</td>"
          contxt += "<td>"+rlist[i].re_date+"</td>";
          if(rlist[i].id==sessionId){
          contxt +=   "<td><a href='#' onclick='bReUpdatF2("+rlist[i].re_num+")'>수정</a>&nbsp;&nbsp;<a href='#' onclick='bReplyDel2("+rlist[i].re_num+")'>삭제</a></td>";
          }
          contxt += "</tr>";
       }
       
       $("#replyArea2").append(contxt);
       
	var sc = $("#contents_layer2").scroll();
	console.log(sc);
	$("#contents_layer2").scroll(function(ev){ //div 스크롤 감지
		 if ((sc[0].offsetHeight + sc[0].scrollTop-16) > sc[0].scrollHeight){
			 console.log("됐나");
		    	rListScroll(rListZ);
		    }  
	});
}


function rListScroll(rListZ){//반응형 스크롤
	if(lengthZ != rListLength){
	$("#loadBar").css("display","block");
	setTimeout(function(){
		
		var firstLengt = lengthZ;
		lengthZ = lengthZ+10;
		
		if(firstLengt >= rListLength){
			firstLengt = rListLength;
			lengthZ = rListLength;
		}else if(lengthZ >= rListLength){
			lengthZ = rListLength;
		}
		
		var cac = ""	
		
			for (var ztz = firstLengt; ztz < lengthZ; ztz++) {
				cac += "<tr>";
				cac += "<td>"+rListZ[ztz].nickName+"</td>";
				cac += "<td>"+rListZ[ztz].re_content+"</td>"
				cac += "<td>"+rListZ[ztz].re_date+"</td>";
		          if(rListZ[ztz].id==sessionId){
		        cac += "<td><a href='#' onclick='bReUpdatF2("+rListZ[ztz].re_num+")'>수정</a>&nbsp;&nbsp;<a href='#' onclick='bReplyDel2("+rListZ[ztz].re_num+")'>삭제</a></td>";
		          }
		        cac += "</tr>";
		       }
		
			$("#loadBar").css("display","none");
			$("#replyArea2").append(cac);
			
    },1000);
	}
}
/////////////////////////////////////////////////////////////////////////////////////////////////





function bReplyDel2(re_num){//댓글 삭제기능
	   
    console.log("알이넘 : "+re_num);
    console.log("비넘 : "+b_num);
    
    $.ajax({
        type : 'get',
        url : 'bReplyDel',
        data : {
        	 id : sessionId,
        	b_num : b_num,
           re_num : re_num
        },
        dataType : 'JSON',
        success : function(data) {
           console.log(data);
           $("#replyArea2").html("");
           var rListLength = data.rlist.length; 
           var contxt = "";
           contxt +="<tr><th>작성자&nbsp;&nbsp;</th><th>내용&nbsp;&nbsp;</th><th>작성날짜&nbsp;&nbsp;</th><th></th></tr>";
              for (var i = 0; i <rListLength; i++) {
                 contxt += "<tr>";
                 contxt += "<td>"+data.rlist[i].nickName+"</td>";
                 contxt += "<td>"+data.rlist[i].re_content+"</td>"
                 contxt += "<td>"+data.rlist[i].re_date+"</td>";
                 if(data.rlist[i].id==sessionId){
                 contxt +=   "<td><a href='#' onclick='bReUpdatF2("+data.rlist[i].re_num+")'>수정</a>&nbsp;&nbsp;<a href='#' onclick='bReplyDel2("+data.rlist[i].re_num+")'>삭제</a></td>";
                 }
                 contxt += "</tr>";
              }
              
              $("#replyArea2").append(contxt);
        },
        error : function(e) {
           alert("댓글 삭제에 실패하였습니다.");
           console.log(e);
        }
     });
    
 }
 
$("#bg_layer").click(function(){
	   closePop2();
 });
 
	function closePop2(){
	    $("#articleView_layer2").removeClass("open2");
	    detailChk(b_num,sessionId);
	 }
	


</script>
</html>