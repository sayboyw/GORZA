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

<!-- 다음 주소api -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">

<style type="text/css">
#logo {
	width: 35%;
}

#menubar1 {
	margin: auto;
}

#div2 {
	position: absolute;
	left: 20%;
}

#portfolio {
	padding-top: 0px;
}

#home {
	padding-bottom: 0px;
}

.round2 {
	margin: auto;
	border-radius: 50%;
	width: 120px;
	height: 120px;
	background-size: 100% 100%;
}

.round {
	border-radius: 50%;
	height: 6%;
	background-size: 100% 100%;
}

#myself {
	margin: auto;
	width: 400px;
	height: 40px;
}

#detailChk {
	cursor: pointer;
}

.nav-tabs .nav-link {
	width: 180px;
	color: #6E6E6E;
	border-color: #D8D8D8 #D8D8D8 #F2F2F2 #D8D8D8;
	border-radius: 7px 7px 0px 0px;
	text-align: center;
	font-size: 15px;
}

.nav-link.active {
	color: #6E6E6E;
}

.nav-tabs .nav-link:hover {
	color: #6E6E6E;
	background-color: #E6E6E6;
	border-color: #BDBDBD #BDBDBD #D8D8D8 #BDBDBD;
	border-radius: 10px 10px 0px 0px;
}

.nav-link.active:hover {
	border-color: #D8D8D8 #D8D8D8 #FFFFFF #BDBDBD;
	border-radius: 5px 5px 0px 0px;
}

#articleView_layer4 {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

#articleView_layer4.open {
	display: block;
	color: red
}

#articleView_layer4 #bg_layer4 {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 9990px;
	background: #000;
	opacity: .7;
	filter: alpha(opacity = 50);
	z-index: 9990;
}

#contents_layer4 {
	position: fixed;
	top: 30%;
	left: 36%;
	width: 500px;
	height: 500px;
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

#articleView_layer3 {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

#articleView_layer3.open {
	display: block;
	color: red
}

#articleView_layer3 #bg_layer3 {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 9990px;
	background: #000;
	opacity: .7;
	filter: alpha(opacity = 50);
	z-index: 9990;
}

#contents_layer3 {
	position: fixed;
	top: 30%;
	left: 36%;
	width: 400px;
	height: 300px;
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
/* ---------------------------코디상세보기-------------------------*/
#articleView_layer {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

#articleView_layer.open {
	display: block;
	color: red
}

#articleView_layer #bg_layer {
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


#contents_layer {
	position: fixed;
	top: 20%;
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

.navbar-nav {
	float: none;
}
</style>
</head>
<body>
<jsp:include page="loginBox.jsp"/>
	
<!-- 메뉴영역 -->
<section id="home" style="padding-top: 0px">
     <div class="container">
          <div class="row">
          		
				<div class="round2">
				<img style="width: 100%;height: 100%;border-radius: 50%" alt="" src="resources/profile/${nMember.sysName }">
				</div>
				<br/>
				<p id="nickName" style="font-size: 25px">${nMember.nickName }</p>
				<p id="follow" style="font-weight:bold; font-size: 17px">팔로우 0 &nbsp;&nbsp; 팔로잉0</p>
				<div id="followBtn">
				<c:if test="${nMember.nickName==sessionScope.mb.nickName }">
				<button style="width: 150px;" class="btn btn-default" onclick="location.href='mMyPageF'">프로필수정</button>
				<button style="width: 150px;" class="btn btn-default" onclick="location.href='bWriteF'">업로드</button>
				</c:if>	
				<c:if test="${nMember.nickName!=sessionScope.mb.nickName }">
					<c:if test="${followChk == 0 }">
					<button style="width: 150px; background-color: #52cbbc;" class="btn btn-default" onclick="follow(0)">+팔로우</button>
					</c:if>
					<c:if test="${followChk == 1 }">
					<button style="width: 150px; " class="btn btn-default" onclick="follow(1)">팔로우해제</button>
					</c:if>
				<button style="width: 150px;" class="btn btn-default" onclick="mReportF()">신고하기</button>
				</c:if>
				</div>
				<br/>

				<div id="myself">${nMember.intro }</div>
          </div>
     </div>
</section>

<!-- 사각형영역 -->

<section id="portfolio2">
		<div class="container">
			<div>
				<ul class="nav nav-tabs">
					<li class="nav-item on" value="1" id="li1"><a
						class="nav-link active" data-toggle="tab" href="#" id="name1"
						onclick="mPostScrabList(0)">Post</a></li>
					<li class="nav-item" value="0" id="li2"><a class="nav-link "
						data-toggle="tab" href="#" id="name2" onclick="mPostScrabList(1)">Scrap</a>
					</li>
				</ul>
				<div id="PostScrabList" class="row"></div>

				<div id="loadingbars"
					style="text-align: center; display: none; padding-top: 20px">
					<img src='./resources/images/loadingbars.gif' alt='Loading' />
				</div>

			</div>
		</div>
	</section>

<!-- Footer Section -->

<footer>
     <div class="container">
          <div class="row">
          <div class="col-md-3 col-sm-3">
                    <img id="logo" src="resources/images/logo.png">
               </div>
               <div class="col-md-4 col-sm-4">
                    <p>인천광역시 남구 학익동 663-1 태승빌딩 5층</p>
               </div>

               <div class="col-md-offset-1 col-md-4 col-sm-offset-1 col-sm-3">
                    <p><a href="mailto:youremail@gmail.com">hello@yourstudio.co</a></p>
                    <p>(+01) 2048937 / 02 203403</p>
               </div>

               <div class="clearfix col-md-12 col-sm-12">
                    <hr>
               </div>

               <div class="col-md-6 col-sm-6">
                    <div class="footer-copyright">
                         <p>© 2018 Gorza Studio | All Rights Reserved.</p>
                    </div>
               </div>

               <div class="col-md-6 col-sm-6">
                    <ul class="social-icon">
                         <li><a href="#" class="fa fa-facebook"></a></li>
                         <li><a href="#" class="fa fa-twitter"></a></li>
                         <li><a href="#" class="fa fa-linkedin"></a></li>
                    </ul>
               </div>
               
          </div>
     </div>
</footer>


<!-- SCRIPTS -->

<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/custom.js"></script>

<!-- light Box Div 팔로우 리스트 -->
	<div id="articleView_layer">
		<div id="bg_layer"></div>
		<div id="contents_layer"></div>
	</div>
	<!-- light Box Div 신고하기-->
<div id="articleView_layer3">
	<div id="bg_layer3"></div>
	<div id="contents_layer3"></div>
</div>

<!-- light Box Div 상세보기용-->
	<div id="articleView_layer4">
		<div id="bg_layer4"></div>
		<div id="contents_layer4"></div>
	</div>
</body>
<script >

$("#bg_layer3").click(function(){
	   closePop3();
});

	var id = null;
	
	
	$(document).ready(function(){		//페이지 로딩을 할 때 실행하는 부분
		
		 $.ajax({
			type:"GET",
			url:"followCount",
			data:{
				nickName: $("#nickName").html()
			},
			dataType:"JSON",
			success:function(data){
				console.log(data);
				$("#follow").html("<a href='#' onclick='followList(0)'>팔로우 "+ data.follow.followerC +"</a>&nbsp;&nbsp; <a href='#' onclick='followList(1)'>팔로잉 "+data.follow.followingC+"</a>");
				id=data.follow.id;
				mPostScrabList(0);
			},
			error:function(e){
				alert("ajax 실패");
				console.log(e);
			}
		});
		 
	});

	function mPostScrabList(num){
		$.ajax({
			type : "get",
			url : "mPostScrabList",
			data : {
				num : num,
				id : id
			},
			dataType : "JSON",
			success : function(data) {
				console.log(data);
				scrollList(data.mPostScrabList);
		},
		error : function(error) {
			console.log(error);
			alert("실패");
		}
	});	
}
	var listLength;
	var z;
	var mPostScrabListZ;
	
	function scrollList(mPostScrabList){//리스트 뿌려주기
		listLength = mPostScrabList.length;
		mPostScrabListZ = mPostScrabList;
		
		if(z>=listLength){
			z = listLength;
		}else if(listLength < 10){
			z = listLength;
		}else{
			z = 10;
		}
		
		var contxt = ""	
			for (var i = 0; i < z; i++) {
				contxt += "<div class='col-md-4 col-sm-6'>";
				contxt += "<a id='detailChk' onclick=detailChk("+mPostScrabList[i].b_num+",'"+mPostScrabList[i].id+ "')>";
				contxt += "<div class='portfolio-thumb'>";
				contxt += "<img style='width: 100%; height: 400px;' src='./"+mPostScrabList[i].ap_path+"' class='img-responsive' alt='Portfolio'>";
				contxt += "<div class='portfolio-overlay'>";
				contxt += "<div class='portfolio-item'>";
				contxt += "<h3>상세보기</h3>";
				contxt += "<small>클릭하세요</small>";
				
				contxt += "</div></div></div></a></div>";
			}
			
			$("#PostScrabList").html(contxt);
			
			window.onscroll = function(ev) {//스크롤 반응
			    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
			    	scrollMethod(mPostScrabListZ);
			    }
			}
	}
	
	function scrollMethod(mPostScrabListZ){//반응형 스크롤
		console.log(mPostScrabListZ);
	if(z != listLength){
		$("#loadingbars").css("display","block");
		setTimeout(function(){
			
			i = z;
			z = z+9;
			if(i >= listLength){
				i = listLength;
				z = listLength;
			}else if(z >= listLength){
				z = listLength;
			}
		
			var cc = ""	
				for (var zz = i; zz < z; zz++) {
					
					cc += "<div class='col-md-4 col-sm-6'>";
					cc += "<a id='detailChk' onclick=detailChk("+mPostScrabListZ[zz].b_num+",'"+mPostScrabListZ[zz].id+ "')>";
					cc += "<div class='portfolio-thumb'>";
					cc += "<img style='width: 100%; height: 400px;' src='./"+mPostScrabListZ[zz].ap_path+"' class='img-responsive' alt='Portfolio'>";
					cc += "<div class='portfolio-overlay'>";
					cc += "<div class='portfolio-item'>";
					cc += "<h3>상세보기</h3>";
					cc += "<small>클릭하세요</small>";
					cc += "</div></div></div></a></div>";	
				}
			
				$("#loadingbars").css("display","none");
				$("#PostScrabList").append(cc);
				
        },1000);
	}
	}
	
	//상세보기
	function detailChk(b_num, id) {
		var session = "${sessionScope.mb}"
		console.log(session);
		if (session != "") {
			console.log("비넘 : " + b_num);
			console.log("아이디 : " + id);
			$("#articleView_layer").addClass('open');
			$.ajax({
				type : 'get',
				url : 'bDetail',
				data : {
					id : id,
					b_num : b_num
				},
				dataType : 'html',
				success : function(data) {
					//console.log(data);
					$("#contents_layer").html(data);
				},
				error : function(e) {
					alert("상세보기 실패");
					console.log(e);
				}
			});
		} else {
			alert("로그인이 필요한 서비스 입니다.");
		}
	}
	
	function followList(num){//팔로우 리스트 가져오기
		$("#articleView_layer4").addClass('open');
		$.ajax({
			type:'get',
			url:'followList',
			data:{id:id , num:num},
			dataType:'html',
			success:function(data){
				$("#contents_layer4").html(data);
			},
			error:function(e){
				alert("팔로우 리스트 가져오기 실패");
				console.log(e);
			}
		});
	}

	function mReportF(){//신고하기
		console.log("신고하기");
		$("#articleView_layer3").addClass('open');
		$.ajax({
			type:'get',
			url:'mReportF',
			data:{nickName: $("#nickName").html()},
			dataType:'html',
			success:function(data){
				//console.log(data);
				$("#contents_layer3").html(data);
			},
			error:function(e){
				alert("신고하기 실패");
				console.log(e);
			}
		});
	}
	
	var nickName = "${nMember.nickName}";
	var sessionId = "${sessionScope.mb.id}";
	
	function follow(num){//+팔로우하기
		$.ajax({
	         type : 'get',
	         url : 'follow',
	         data : {
	            id : sessionId,
	            nickName : nickName,
	            num : num
	         },
	         dataType : 'JSON',
	         success : function(data) {
	            if(data.num==0){
	               $("#followBtn").html("<button style='width: 150px; ' class='btn btn-default' onclick='follow(1)'>팔로우해제</button><button style='width: 150px;' class='btn btn-default' onclick='mReportF()'>신고하기</button>");
	               $("#follow").html("<a href='#' onclick='followList(0)'>팔로우 "+ data.follow.followerC +"</a>&nbsp;&nbsp; <a href='#' onclick='followList(1)'>팔로잉 "+data.follow.followingC+"</a>");
	            }else{
	               $("#followBtn").html("<button style='width: 150px; background-color: #52cbbc;' class='btn btn-default' onclick='follow(0)'>+팔로우</button><button style='width: 150px;' class='btn btn-default' onclick='mReportF()'>신고하기</button>");
	               $("#follow").html("<a href='#' onclick='followList(0)'>팔로우 "+ data.follow.followerC +"</a>&nbsp;&nbsp; <a href='#' onclick='followList(1)'>팔로잉 "+data.follow.followingC+"</a>");
	            }
	         },
	         error : function(e) {
	            alert("팔로우하기 실패");
	            console.log(e);
	         }
	      });
	}
	
	
	
</script>
</html>