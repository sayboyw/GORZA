<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
   <script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
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
#articleView_layer2 {
	display: none;
	position: fixed;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

#articleView_layer2.open2 {
	display: block;
	color: red
}

#articleView_layer2 #bg_layer2 {
position: fixed;
	width: 100%;
	height: 9990px;
	background: #000;
	filter: alpha(opacity = 90);
	opacity: 0.4;
}

#contents_layer2 {
   position: fixed;
   top: 10%;
   left: 15%;
   width: 500px;
   height: 400px;
   margin: auto;
   padding: 28px 28px 0 28px;
   background: #fff;
   font-size: 12px;
   z-index: 9999;
   color: #767676;
   line-height: normal;
   white-space: normal;
   overflow: scroll
}
.navbar-nav{
	float: none;
}
#replyArea{
	position: relative;
    left: 0%;
    font-size: 17px;
    border-collapse: inherit;
    margin: -13px;
}
table tr th{
	position: relative;
    left: -6px;
    padding: 6px;
}
table tr td{
	padding: 3px;
}
</style>
</head>
<body>
<div id="popLine">
   <div id="popPhoto">
   <img style="width: 100%; height: 100%;" src="./${boardPhoto}" class="mg-responsive" alt="portfolio">
   </div>
   <div style="width: 100%;height: 9%;" id="popProfile">
      <img style="height: 100%;  width:6%; margin-top: 2%" class='round' src="./resources/profile/${proFile}">&nbsp;&nbsp;<a style="font-size: 15px; font-weight: 700; color: #262626; " href="myStyle?nickName=${boardDetail.nickName}">${boardDetail.nickName}</a>
        
        <!-- 수정/삭제 영역  -->
      <c:if test="${2==sessionScope.mb.state }">
     <div>
     <span id="sub" style="position:absolute;right: 2.3%;top:4.5%;cursor: pointer;">. . .</span>
	     <ul id="subManu" style="position: absolute;right: 2.1%;top: 8%;list-style: none;display: none">
			<li><a href="javascript:" onclick="bUpdateF('${boardPhoto}','${proFile }','${boardDetail.nickName }','${boardDetail.id }','${boardDetail.b_content}','${boardDetail.hashtag}','${boardDetail.b_num}')">수정</a></li>
			<li><a href="javascript:" onclick="bDel(${boardDetail.b_num},'${boardPhoto }')">삭제</a></li>
		</ul>
	</div>
		</c:if>
        
   </div>
   <br/>
   <div style=" height: 40%" id="popContents">
   	<div id="bcontent" style="width: 100%; height: 70%">
     <%-- <p style="font-weight: 400">${boardDetail.b_title}</p> --%>
     <br/>
     <p style="font-size:15px;font-weight: 700;">${boardDetail.b_content}</p>
     </div>
     <div id="hashtag">
      <p style="color: #003569" id="hashIN">${boardDetail.hashtag}</p>
      </div>
   </div>
      
   <div style="width: 100%; padding-top: 85px;" id="midArea" >

      <span id="likeLike">
      <c:if test="${likeChk==0}">
      <img onclick='bLike(0)' src="resources/images/unlike.png">&nbsp;&nbsp;
      </c:if>
      <c:if test="${likeChk==1}">
      <img onclick='bLike(1)' src="resources/images/like.png">&nbsp;&nbsp;
      </c:if>
      </span>
      <img src="resources/images/chat.png" onclick='allReply(${boardDetail.b_num})'>&nbsp;&nbsp;
      <span id="scrapScrap">
      <c:if test="${scrabChk==0}">
      <img src="resources/images/unmark.png" onclick='bScrap(0)'>
      </c:if>
      <c:if test="${scrabChk==1}">
      <img src="resources/images/mark.png" onclick='bScrap(1)'>
      </c:if>
      </span>
      <br/>
     <p style="font-size: 14px; font-weight: 700; color: #262626"> 좋아요 <span id="likeC">${boardDetail.likeC}</span>&nbsp;&nbsp; 댓글 <span id="comC">${comentCount}</span></p>
  <div style="width: 100%">
  <c:if test="${boardDetail.b_divide==0 }">
  <a style='left:50%; font-size: 13px; color: #262626'>${boardDetail.b_date}</a>
  </c:if>
  <c:if test="${boardDetail.b_divide==1 }">
  <a style='left:50%; font-size: 13px; color: #262626'>${boardDetail.br_date}</a>
  </c:if>
  </div>
      <p style="font-size: 14px;  color: #262626">댓글 <input style="width:30%; height: 5%" type="text"  name="reply" id="bReplyWrite" />
      <button class="btn btn-secondary my-2 my-sm-0" onclick="replyInsert()">등록</button></p>
   </div>
   <table  id="replyArea">
   <c:if test="${rlist.size()!=0}">
      <tr>
         <th>작성자&nbsp;&nbsp;</th>
         <th>내용&nbsp;&nbsp;</th>
         <th>작성날짜&nbsp;&nbsp;</th>
      </tr>
      </c:if>
      <c:forEach items="${rlist }" var="rlist" begin="0" end="3" step="1">
      <tr>
         <td><a href="myStyle?nickName=${rlist.nickName}">${rlist.nickName}</a></td>
         <td >${rlist.re_content }</td>
         <td>${rlist.re_date }</td>
         <c:if test="${sessionScope.mb.id==rlist.id || 2==sessionScope.mb.state }">
         <td>&nbsp;&nbsp;<a href="#" onclick='bReplyDel(${rlist.re_num })'>삭제</a></td>
         </c:if>
      </tr>
      </c:forEach>
   </table>
   </div>
   

<!-- light Box Div -->
	
   <div id="articleView_layer2" >
      <div id="bg_layer2" >
      </div>
      <div id="contents_layer2"></div>
   </div>
</body>
<script>
	console.log("${proFile}");
	$("#sub").click(function(e){
		var dis = $("#subManu").css("display");
		if(dis == "none"){
			$("#subManu").css("display","block");
		}else{
			$("#subManu").css("display","none");
		}
	});

   var sessionId = "${sessionScope.mb.id}"
   var b_num = "${boardDetail.b_num}";
   
   $("#midArea").append($("#replyArea"));
   
///////////////////////////////////////////////////////////////////////////////해시태그 기능
   var hashtag = "${boardDetail.hashtag}";
   var cls = hashtag.split("#");
   console.log(cls);
   var hash = "";
   for(var i = 1;i<cls.length;i++){
	   hash += "<a href='iSearch?search="+cls[i]+"'>#";
	   hash += cls[i];
	   hash += "</a>";
   }
   $("#hashIN").html(hash);
//////////////////////////////////////////////////////////////////////////////해시태그 기능
   //브랜드 게시판 글 수정
   function bUpdateF(ap_path,sysName,nickName,id,b_content,hashtag,b_num){//글 수정
		console.log("경로 ap_path  : "+ap_path);
		console.log("프로필 그림 sysName : "+sysName);
		console.log("닉네임 nickName : "+nickName);
		console.log("아이디 id : "+id);
		console.log("내용 b_content : "+b_content);
		console.log("해시태그 hashtag : "+hashtag);
		console.log("게시글번호 b_num : "+b_num);
		
		$.ajax({
	         type : 'post',
	         url : 'bBrandUpdateF',
	         data : {
	            ap_path : ap_path,
	            sysName : sysName,
	            nickName : nickName,
	            id : id,
	            b_content : b_content,
	            hashtag : hashtag,
	            b_num : b_num
	         },
	         dataType : 'html',
	         success : function(data) {
	       		console.log(data);
	       		$("#bcontents_layer").html(data);
	         },
	         error : function(e) {
	            alert("브랜드 게시판 글 수정 실패");
	            console.log(e);
	         }
	      });
		
	}

   function bDel(b_num,ap_path){//게시글 삭제
		$.ajax({
	         type : 'get',
	         url : 'bDel',
	         data : {
	            b_num : b_num,
	            ap_path : ap_path
	         },
	         dataType : 'JSON',
	         success : function(data) {
	       		console.log(data);
	       		window.location.reload();
	         },
	         error : function(e) {
	            alert("브랜드 게시판 글 삭제 실패");
	            console.log(e);
	         }
	      });
	}
   var o_id = "${boardDetail.id }";
   
   function bLike(num){//좋아요 기능
       $.ajax({
         type : 'get',
         url : 'bLike',
         data : {
            id : sessionId,
            b_num : b_num,
            num : num,
            o_id : o_id
         },
         dataType : 'JSON',
         success : function(data) {
            console.log(data);
            if(data.num==0){
               $("#likeLike").html("<img src='resources/images/like.png' onclick='bLike(1)'>&nbsp;&nbsp;");
               $("#likeC").html(parseInt($("#likeC").html())+1);
            }else{
               $("#likeLike").html("<img src='resources/images/unlike.png' onclick='bLike(0)'>&nbsp;&nbsp;");
               $("#likeC").html(parseInt($("#likeC").html())-1);
            }
         },
         error : function(e) {
            alert("좋아요 기능 실패");
            console.log(e);
         }
      });
   }
   
   function bScrap(num){//스크랩 기능
      console.log("스크랩 num : "+num);
      $.ajax({
         type : 'get',
         url : 'bScrap',
         data : {
            id : sessionId,
            b_num : b_num,
            num : num,
            o_id : o_id
         },
         dataType : 'JSON',
         success : function(data) {
            console.log(data);
            if(data.num==0){
               $("#scrapScrap").html("<img src='resources/images/mark.png' onclick='bScrap(1)'>");
            }else{
               $("#scrapScrap").html("<img src='resources/images/unmark.png' onclick='bScrap(0)'>");
            }
         },
         error : function(e) {
            alert("스크랩 기능 실패");
            console.log(e);
         }
      });
   }
   
   function allReply(b_num){//전체 댓글 보기 기능
	   console.log("댓글 전체 보기 기능");
      $("#articleView_layer2").addClass('open2');
      $.ajax({
         type : 'get',
         url : 'allReply',
         data : {
            b_num : b_num
         },
         dataType : 'html',
         success : function(data) {
            //console.log(data);
            $("#contents_layer2").html(data);
         },
         error : function(e) {
            alert("전체 댓글 보기 실패");
            console.log(e);
         }
      });
   }
   
   function replyInsert(){//댓글 등록 기능
      $.ajax({
         type : 'get',
         url : 'bReplyWrite',
         data : {
            id : sessionId,
            b_num : b_num,
            re_content : $("#bReplyWrite").val(),
            o_id : o_id
         },
         dataType : 'JSON',
         success : function(data) {
            console.log(data);
            $("#replyArea").html("");
            $("#bReplyWrite").val("");
            var rListLength = data.rlist.length;
            
            if(rListLength>3){
               rListLength = 4;
            }
            
            var contxt = ""
            contxt +="<tr><th>작성자&nbsp;&nbsp;</th><th>내용&nbsp;&nbsp;</th><th>작성날짜&nbsp;&nbsp;</th></tr>";
               for (var i = 0; i <rListLength; i++) {
                  contxt += "<tr>";
                  contxt += "<td><a href='myStyle?nickName="+data.rlist[i].nickName+"'>"+data.rlist[i].nickName+"</a></td>";
                  contxt += "<td>"+data.rlist[i].re_content+"</td>"
                  contxt += "<td>"+data.rlist[i].re_date+"</td>";
                  if(data.rlist[i].id==sessionId){
                  contxt +=   "<td>&nbsp;&nbsp;<a href='#' onclick='bReplyDel("+data.rlist[i].re_num+")'>삭제</a></td>";
                  }
                  contxt += "</tr>";
               }
               
               $("#replyArea").append(contxt);
               $("#comC").html(data.rListCount);
               
         },
         error : function(e) {
            alert("댓글 등록 실패");
            console.log(e);
         }
      });
   }
   
   function bReplyDel(re_num){//댓글 삭제기능
	   
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
             $("#replyArea").html("");
             $("#bReplyWrite").val("");
             var rListLength = data.rlist.length;
             
             if(rListLength>4){
                rListLength = 5;
             }          
             var contxt = ""
             contxt +="<tr><th>작성자&nbsp;&nbsp;</th><th>내용&nbsp;&nbsp;</th><th>작성날짜&nbsp;&nbsp;</th></tr>";
                for (var i = 0; i <rListLength; i++) {
                   contxt += "<tr>";
                   contxt += "<td><a href='myStyle?nickName="+data.rlist[i].nickName+"'>"+data.rlist[i].nickName+"</a></td>";
                   contxt += "<td>"+data.rlist[i].re_content+"</td>"
                   contxt += "<td>"+data.rlist[i].re_date+"</td>";
                   if(data.rlist[i].id==sessionId){
                   contxt +=   "<td>&nbsp;&nbsp;<a href='#' onclick='bReplyDel("+data.rlist[i].re_num+")'>삭제</a></td>";
                   }
                   contxt += "</tr>";
                }
                
                $("#replyArea").append(contxt);
                $("#comC").html(data.rListCount);
                
          },
          error : function(e) {
             alert("댓글 삭제 실패");
             console.log(e);
          }
       });
      
   }
   
   function bReplyCancle(){//수정하기 취소 (원상복구 시키기)
      console.log("취소취소");
   }
   
   /* console.log("프로필사진 : ${proFile}");
   console.log("댓글 리스트 : ${rlist}");
   console.log("게시글 사진 : ${boardPhoto}");
   console.log("상세보기 내용 : ${boardDetail}");
   console.log("좋아요 개수 : ${boardDetail.likeC}");s
   console.log("댓글 개수 : ${comentCount}");
   console.log("좋아요 체크 : ${likeChk}");
   console.log("스크랩 체크 : ${scrabChk}"); */
    $("#brand_bg_layer").click(function(){
	   closePop();
   });
   function closePop(){
      $("#brandArticleView_layer").removeClass("open");
   }
   
</script>
</html>