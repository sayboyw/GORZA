<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<link rel="stylesheet" href="resources/css/font-awesome.min.css">

		<!-- Main css -->
		<link rel="stylesheet" href="resources/css/style.css">
		<link
			href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700"
			rel="stylesheet">

<style>
#PageLogo {
	width: 35%;
}

#menubar1 {
	margin: auto;
}

#memberType0 {
	display: none;
}

#memberType1 {
	display: none;
}

#memberType2 {
	display: none;
}

#com_main {
	display: none;
}

.navbar-nav {
	float: none;
}

#mainMenu {
	background-image: url('resources/images/menubar2.png');
	background-size: cover;
	width: 34%
}

#likeSearch {
	display: none; /* 평상시에는 서브메뉴가 안보이게 하기 */
	height: auto;
	padding: 0px;
	margin: 0px;
	border: 0px;
	position: absolute;
	width: 206px;
	z-index: 200;
}

#alert {
	color: white;
	position: absolute;
	border-radius: 50%;
	top: -47px;
	right: 2px;
	width: 30px;
	background-color: red;
}

#alertList {
	width: 400%;
	border: 1px solid #8794a3;
	position: absolute;
	background-color: white;
	display: none;
	left: -170px;
	z-index: 10;
	height: 400px;
	overflow: auto;
}

#alertListArea {
	height: 100%;
	width: 100%;
}

.alterDetail:HOVER {
	cursor: pointer;
	background-color: skyblue;
	opacity: 0.5;
}

.alterDetail {
	text-align: center;
}

#alterArticleView_layer {
	display: none;
	position: fixed;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

#alterArticleView_layer.open {
	display: block;
	color: red
}

#alterArticleView_layer #alterBg_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 5000px;
	background: #000;
	opacity: .7;
	filter: alpha(opacity = 90);
	z-index: 9990;
}

#alterContents_layer {
	position: fixed;
	top: 30%;
	left: 27%;
	max-width: 1000px;
	width: 910px;
	height: 600px;
	margin: auto;
	background: #fff;
	font-size: 12px;
	z-index: 9999;
	color: #767676;
	line-height: normal;
	white-space: normal;
	overflow: hidden;
}

.alertImg {
	width: 40%;
	height: 61px;
}
</style>
	</head>
	<body>
	
<!-- PRE LOADER -->

<input type="hidden" id="mainPage" value="main"/>

<!-- <div class="preloader">
     <div class="sk-spinner sk-spinner-wordpress">
          <span class="sk-inner-circle"></span>
     </div>
</div> -->

<!-- Navigation section  -->


<div class="navbar navbar-default navbar-static-top" role="navigation">
     <div class="container">

          <div class="navbar-header">
               <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon icon-bar"></span>
                    <span class="icon icon-bar"></span>
                    <span class="icon icon-bar"></span>
               </button>
               <a href="./" class="navbar-brand"><img id="PageLogo" src="resources/images/logo.png"></a>
          </div>
          
          <!-- 메뉴나누기 -->
          <div class="member_divide">
          <!-- 0번상황 -->
          <div id="memberType0">
          	<div  class="collapse navbar-collapse" style="text-align: center">
               <ul class="nav navbar-nav navbar-right" style="text-align: center">
                    <li class="active"><a href="mLoginF" id="login">LOGIN</a></li>
                    <li><a href="mLogout" id="logout">LOGOUT</a></li>
                    <li><a href="mMyPageF">MYPAGE</a></li>
                    <li><a href="myStyle?nickName=${sessionScope.mb.nickName }">MYSTYLE</a></li>
                    <li>
                    <a href="javascript:" class="noti"  id="mNotice0" onclick="notice()">NOTICE</a>
                    <div id="alertArea" style="position: relative;"></div>
                    </li>
                   
               </ul>
          	</div>
          </div>
          <!-- 1번상황 -->
          <div id="memberType1">
          	<div  class="collapse navbar-collapse" style="text-align: center">
               	<ul class="nav navbar-nav navbar-right" style="text-align: center">
	  					<li class="active"><a href="mLogout">LOGOUT</a></li>
	  					<li><a href="cMyPageF">MYPAGE</a></li>
						<li><a href="#" onclick="banOut(0)">제휴신청</a></li>
						<li><a href="#" onclick="banOut(1)">코디신청</a></li>
						<li><a href="#" onclick="banOut(2)">배너신청</a></li>
						<li>
						<a href="javascript:"  class="noti" id="mNotice1" onclick="notice()">NOTICE</a>
						<div id="alertArea" style="position: relative;"></div>
						</li>
				</ul>
				</div>
				</div>
			<!-- 2번상황 -->
			<div id="memberType2">
			<div  class="collapse navbar-collapse" style="text-align: center">
               	<ul class="nav navbar-nav navbar-right" style="text-align: center">
	  					<li class="active"><a href="mLogout">로그아웃</a></li>
						<li><a href="aComAskF">신청 리스트</a></li>
						<li><a href="aMemberF">회원관리</a></li>
						<li><a href="aComMemberF">기업관리</a></li>
						<li><a href="#" onclick="aReportF()">신고함</a></li>
				</ul>
				</div>
				</div>
          </div>
          
          			<!-- 검색창 div -->
          	<div id="isearch" style="float: right">	
				<form id="searchForm" action="iSearch" method="get" class="form-inline my-2 my-lg-0">		
			      <input id="search" name="search" class="form-control mr-sm-2 likeSearch" type="text" placeholder="코디 검색하기"/>
			      
			      <input type="button" onclick="seaBtn()" class="btn btn-secondary my-2 my-sm-0"  value="검색"/>
			      
			      <!-- 검색어 랭킹 -->
			         <ul id="likeSearch" class="nav navbar-nav" style="float: none;">
			           
			         </ul>
			
				</form>
				
			</div>
			
			<!-- 알림창  -->
			<div id="alertList">
				<table id="alertListArea">
				
				</table>
				<div id="loadBar" style="text-align: center;display: none;padding-top: 20px">
	 				<img  src='./resources/images/loadingbars.gif' alt='Loading' />
	 			</div>
			</div>
			
			
			<br/>
			<br/>
			<br/>
			<br/>
  </div><!--컨테이너 영역끝 -->
  <div id="mainMenu"  style="text-align: center; margin: auto; ">
			<ul class="nav navbar-nav" style="display:inline-block;margin: auto;">   
				<li class="active" style="color: white"><a href="iComIntroF">회사소개</a> </li>
				<li class="active" style="color: white"><a href="bListF?ca_num=0">CODY</a></li>
				<li class="active" style="color: white"><a href="bListF?ca_num=1">CODYSHARE</a> </li>
				<li class="active" style="color: white"><a href="aQuestionF">문의하기</a> </li>
				<li class="active" style="color: white"><a href="cCurrentF?id=${sessionScope.mb.id}" id="com_main">현황보기</a></li>
				</ul>
			</div>
 <!-- light Box Div -->
	<div id="alterArticleView_layer">
		<div id="alterBg_layer"></div>
		<div id="alterContents_layer"></div>
	</div>
</div>
	</body>
	<script>
	
	function banOut(num){//유효성 체크
		var sessionConfirm = "${sessionScope.cm.c_agree}";
		console.log("기업 세션값(c_agree): "+sessionConfirm);
		if(num == 1){
			if(sessionConfirm !=2){
				alert("권한이 없습니다.");
				location.href="./";
			}else{
				location.href="cSendF";
			}
		}else if(num == 2){
			if(sessionConfirm !=2){
				alert("권한이 없습니다.");
				location.href="./";
			}else{
				location.href="cBannerSendF";
			}
		}else{
			if(sessionConfirm == 2){
				alert("이미 승인 처리 되었습니다.");
			}else if(sessionConfirm ==1){
				alert("이미 신청 중입니다.");
			}else{
				location.href="cAskF";
			}
		}
	}
	
	var ismain = $("#mainPage").val();	 // 메인페이지인지 확인하기 위한 변수
	
	var loginId="${sessionScope.mb.id}";
	// 세션값을 가져와서 로그인여부 확인
	var state ="${sessionScope.mb.state}";
	// 세션값에서 회원구분 컬럼의 값을 가져오기
	
	
	$(document).click(function(e){
		if($("#alertList").css("display")=="block"){

	    if ($(e.target).is('#alertList') || $(e.target).is('.noti') || $(e.target).is('.alterDetail') || $(e.target).is('.clickA') || $(e.target).is('#alterBg_layer')) {
	    	$("#alertList").css("display","block");
	    }else{
	    	$("#alertList").css("display","none");
	    }
		
		}
	});
	
	function notice(){//알림 리스트
		
		if(loginId!=""){
	
			if($("#alertList").css("display")=="block"){
				$("#alertList").css("display","none");
			}else{
				$("#alertList").css("display","block");
			}		
			
		$.ajax({
			type:'get',
			url:'alertList',
			data:{
				id : loginId
			},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				alertListShow(data.alertList);
				
			},
			error:function(e){
				console.log(e);
			}
		});
	}	
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////////
	var alertListLength;
	var lengthZ = 0;
	var alertListZ;
	
	function alertListShow(alertList){//리스트 뿌려주기
		$("#alertArea").html("");
		alertListLength = alertList.length;
		alertListZ = alertList;
		
		if(lengthZ>=alertListLength){
			lengthZ = alertListLength;
		}else if(alertListLength < 10){
			lengthZ = alertListLength;
		}else{
			lengthZ = 10;
		}
		
		var ctx = "";
		var j = 0;
		for(var i = 0 ; i<lengthZ;i++){
			if(alertList[i].divideNum == 0 ){//알림 테이블
				if(alertList[i].divide == 0){//좋아요
					ctx += "<tr class='alterDetail' onclick=alertDetailChk('"+alertList[i].b_num+"')>";
					ctx += "<td class='clickA' style='width:60%'>"+alertList[i].nickName+"님이 회원님의 게시글을 좋아합니다.</td>";
					ctx += "<td class='clickA' style='width:30%'><img class='alertImg' src='"+alertList[i].ap_path+"'></td>";
				}else if(alertList[i].divide == 1){//스크랩
					ctx += "<tr class='alterDetail' onclick=alertDetailChk('"+alertList[i].b_num+"')>";
					ctx += "<td class='clickA' style='width:60%'>"+alertList[i].nickName+"님이 스크랩했습니다.</td>";
					ctx += "<td class='clickA' style='width:30%'><img class='alertImg' src='"+alertList[i].ap_path+"'></td>";
				}else{//댓글
					ctx += "<tr class='alterDetail' onclick=alertDetailChk('"+alertList[i].b_num+"')>";
					ctx += "<td class='clickA' style='width:60%'>"+alertList[i].nickName+"님이 댓글을 남겼습니다.</td>";
					ctx += "<td class='clickA' style='width:30%'><img class='alertImg' src='"+alertList[i].ap_path+"'></td>";
				}
			}else{//팔로우 테이블
				ctx += "<tr class='alterDetail' onclick=myStyle('"+alertList[i].nickName+"')>";
				ctx += "<td class='clickA' style='width:60%'>"+alertList[i].nickName+" 님이 팔로우 신청 하셨습니다.</td>";
				ctx += "<td class='clickA' style='width:30%'><img class='alertImg' src='resources/profile/"+alertList[i].sysName+"'></td>";
			}
			ctx += "</tr>";
			j = i;
		}
		
		if(j<10){
			for(var z = j ; z<10;z++){
				ctx += "<tr>";
				ctx += "<td class='clickA' style='width:60%'>  </td>";
				ctx += "<td class='clickA' style='width:30%'>  </td>";
				ctx += "</tr>";
			}
		}
		
		$("#alertListArea").html(ctx);
			
		var sc = $("#alertList").scroll();
		
		$("#alertList").scroll(function(ev){ //div 스크롤 감지
			 if (sc[0].offsetHeight + sc[0].scrollTop >= sc[0].scrollHeight){
				 console.log(lengthZ);
				 console.log("됐나");
			    	alertScroll(alertListZ);
			    }  
		});
	}
	
	
	function alertScroll(alertListZ){//반응형 스크롤
		if(lengthZ != alertListLength){
		$("#loadBar").css("display","block");
		setTimeout(function(){
			
			var firstLengt = lengthZ;
			lengthZ = lengthZ+10;
			if(firstLengt >= alertListLength){
				firstLengt = alertListLength;
				lengthZ = alertListLength;
			}else if(lengthZ >= alertListLength){
				lengthZ = alertListLength;
			}
			
			var cac = ""	
				for (var ztz = firstLengt; ztz < lengthZ; ztz++) {
					
					if(alertListZ[ztz].divideNum == 0 ){//알림 테이블
						if(alertListZ[ztz].divide == 0){//좋아요
							cac += "<tr class='alterDetail' onclick=alertDetailChk('"+alertListZ[ztz].b_num+"')>";
							cac += "<td class='clickA' style='width:60%'>"+alertListZ[ztz].nickName+"님이 회원님의 게시글을 좋아합니다.</td>";
							cac += "<td class='clickA' style='width:30%'><img class='alertImg' src='"+alertListZ[ztz].ap_path+"'></td>";
						}else if(alertListZ[ztz].divide == 1){//스크랩
							cac += "<tr class='alterDetail' onclick=alertDetailChk('"+alertListZ[ztz].b_num+"')>";
							cac += "<td class='clickA' style='width:60%'>"+alertListZ[ztz].nickName+"님이 스크랩했습니다.</td>";
							cac += "<td class='clickA' style='width:30%'><img class='alertImg' src='"+alertListZ[ztz].ap_path+"'></td>";
						}else{//댓글
							cac += "<tr class='alterDetail' onclick=alertDetailChk('"+alertListZ[ztz].b_num+"')>";
							cac += "<td class='clickA' style='width:60%'>"+alertListZ[ztz].nickName+"님이 댓글을 남겼습니다.</td>";
							cac += "<td class='clickA' style='width:30%'><img class='alertImg' src='"+alertListZ[ztz].ap_path+"'></td>";
						}
					}else{//팔로우 테이블
						cac += "<tr class='alterDetail' onclick=myStyle('"+alertListZ[ztz].nickName+"')>";
						cac += "<td class='clickA' style='width:60%'>"+alertListZ[ztz].nickName+" 님이 팔로우 신청 하셨습니다.</td>";
						cac += "<td class='clickA' style='width:30%'><img class='alertImg' src='resources/profile/"+alertListZ[ztz].sysName+"'></td>";
					}
					cac += "</tr>";					
				}
			
				$("#loadBar").css("display","none");
				$("#alertListArea").append(cac);
				
        },1000);
		}
	}
/////////////////////////////////////////////////////////////////////////////////////////////////
	
	function myStyle(nickName){//프로필 보기
		location.href="myStyle?nickName="+nickName;
	}
	
	function alertDetailChk(b_num) {//상세보기
		var sessionId = "${sessionScope.mb.id}";
			$("#alterArticleView_layer").addClass('open');
			$.ajax({
				type : 'get',
				url : 'bDetail',
				data : {
					id : sessionId,
					b_num : b_num
				},
				dataType : 'html',
				success : function(data) {
					$("#alterContents_layer").html(data);
				},
				error : function(e) {
					alert("알림 상세보기 실패");
					console.log(e);
				}
			});
		}		
	
	$("#alterBg_layer").click(function(){
   	 $("#alterArticleView_layer").removeClass("open");
  });
	
	
	
	$("#search").click(function(e){
		var dis = $("#likeSearch").css("display");
		if(dis == "none"){
			$("#likeSearch").css("display","block");
		}else{
			$("#likeSearch").css("display","none");
		}
	});

	$("#isearch").mouseleave(function(){

		$("#likeSearch").css("display","none");
		$("#search").blur();
		
	});
	
	$(document).ready(function(){
		searchAjax();//검색어들 가져오기
		if(loginId !=""){
			alertAjax();//알림 가져오기
		}
	});
	
	
	function searchAjax(){//검색어들 가져오기	
		$.ajax({
			type:'get',
			url:'iPopSearchList',
			data:{},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				var ctxpop=""
				for(var i = 0 ; i<data.popList.length;i++){
						ctxpop +="<li><a href='iSearch?search="+data.popList[i].search+"'>"+(i+1)+"."+data.popList[i].search+"</a></li>";
				}
				$("#likeSearch").html(ctxpop);
			},
			error:function(e){
				alert("검색어 가져오기 실패");
				console.log(e);
			}
		});
	}

    var stop;
    
	function alertAjax(){//알림 개수 가져오기	
		clearInterval(stop);
		stop = setInterval(function(){
			$.ajax({
			type:'get',
			url:'alertCount',
			data:{
				id : loginId				
			},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				if(data.alertCount!=0){
					$("#alertArea").html("<div id='alert'>"+data.alertCount+"</div>");
				}
			},
			error:function(e){
				console.log(e);
			}
		});
    },20000);
	}
	
		
		
		if(ismain != "main"){	// 메인페이지가 아닐경우
			if(loginId ==""){	//로그인 안된 상태일 때
				$("#logout").css("display","none");	//안보여줌
				$("#login").css("display","block");	//보여줌
				
				alert("로그인이 필요한 서비스입니다.");
				location.href="mLoginF";	
			} 
		}else{	// 메인페이지인 경우
			// 0: 일반 1: 기업  2: 관리자 
			if(loginId == ""){ // 로그인 안된 상태
				$("#logout").css("display","none");
				$("#login").css("display","block");
				$("#memberType0").css("display","block");
				$("#memberType1").css("display","none");
				$("#memberType2").css("display","none");
			}else{	//로그인 된 경우
				if(state ==0){	//일반회원
					$("#memberType0").css("display","block");
					$("#logout").css("display","block");	
					$("#login").css("display","none");	
					$("#memberType1").css("display","none");
					$("#memberType2").css("display","none");
					$("#mNotice0").after($("#alertList"));
				}else if(state ==1) { //기업회원
					$("#memberType0").css("display","none");
					$("#memberType1").css("display","block");
					$("#memberType2").css("display","none");
					$("#com_main").css("display","block");	//메인메뉴
					$("#mNotice1").after($("#alertList"));
					
				}else{	// 관리자
					$("#memberType0").css("display","none");
					$("#memberType1").css("display","none");
					$("#memberType2").css("display","block");
				}
			}
			
		}

		function aReportF(){//신고함
			console.log("신고하기");
			window.open("aReportF", "pop2", 'width = 700px , height =500px, left=100, top = 50');
		}
		
		function seaBtn(){
			console.log("하하");
			if($("#search").val()==""){
				alert("검색어를 입력해 주세요");
			}else{
				$("#searchForm").submit();
			}
		}
		
	</script>
</html>