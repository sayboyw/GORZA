<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
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

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>

#logo {
	width: 35%;
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

#menubar1 {
	margin: auto;
}

.round {
	border-radius: 50%;
	height: 6%;
	width : 16%;
	background-image: url("resources/profile/profile.png");
	background-size: 100% 100%;
}



#myself {
	margin: auto;
	width: 400px;
	height: 100px;
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
#articleView_layer {
	display: none;
	position: fixed;
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
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 5000px;
	background: #000;
	opacity: .7;
	filter: alpha(opacity = 90);
	z-index: 9990;
}

#maxdiv{
	max-width : 800px;
}

#contents_layer {
	position: absolute;
	top: 30%;
	left: 27%;
	max-width : 1000px;
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

 html, body { height:100%;}
 
#container{
	height: 28%;
	margin: auto;
	width: 58%;
}

#bannerArea{
	position: relative;	
}
#arrow2{
	position: absolute;
	top: 5%;
	height: 200px;
	width: 100%;
}

#right{
	right: 15px;
}
#arrow2 li {
    position: absolute;
    top: 50%;
}
#left{	
	left: 15px;	
}

ul{
	list-style: none;
	padding: 0px;
	position: relative;
}
ul.toggle{
	text-align: center;
	position: relative;
}

ul.toggle li{
	display: inline-block;
	margin-left: 10px;
}
#banner{
	margin-bottom: -25px;
}
#banner li{
	position: absolute;
}
.mySlides {display:none}
.dots-check{
	background-image: url("resources/images/toggle_over.png");
}
#thumb{
	margin-top: 30%;
}

</style>
<body>
<jsp:include page="loginBox.jsp"/>

     <div id="container">
     <div id="bannerArea" style="width: 100%;height: 100%">
		    <ul id="banner" style="width: 100%;height: 100%">
     			
 			 </ul>
 			 <ul id="arrow2">
     			<li id="left">
     				<a href="javascript:" onclick="setBanner(-1)">
 			 			<img src="./resources/images/banner_left.png">
 			 		</a>
 			 	</li>
 			 	<li id="right">
 			 		<a href="#" onclick="setBanner(1)">
 			 			<img src="./resources/images/banner_right.png">
 			 		</a>
 			 	</li>
 			 </ul>
 			 <ul class="toggle" id="toggle">
 			 	
 			 </ul>
 			 
  		</div>
  </div>





<!-- 인기게시글 영역 -->
<section id="portfolio">
     <div class="container" > <!-- style="padding-top: 5%" -->
         	<div id="brandArea">
         			<div class="section-title">
                         <h3 style="text-align: center; font-size: 22px;  padding-top: 4%">　◎Brand CODY◎ </h3>
                    </div>
              	<div id="brandList">
              </div>
				<!-- 일반인게시글 -->
              <div id="normalArea">
                       			<div class="section-title">
                         <h3 style="text-align : center; font-size: 22px; padding-top: 32%">　◎GORZA CODY◎ </h3>
                    </div>
              	<div id="normalList"></div>
              </div>

          </div>
          </div>
</section>

<jsp:include page="footer.jsp"/>


<!-- SCRIPTS -->

<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/custom.js"></script>

<!-- light Box Div -->
	<div id="articleView_layer">
		<div id="bg_layer"></div>
		<div id="contents_layer"></div>
	</div>

</body>
<script>	
	
	var slideIndex = 1;
	var inter;

	$(document).ready(function(){//배너 리스트/ 인기순(브랜드 3개, 일반인 게시글 3개)

		$.ajax({
			type:'get',
			url:'iMainPrint',
			data:{},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				mainBannerList(data.mainBannerList);//배너리스트
				mainBrandList(data.mainBrandList);//브랜드 인기글 리스트
				mainNormalList(data.mainNormalList);//일반 인기글 리스트
			},
			error:function(e){
				alert("응안돼");
				console.log(e);
			}
		});
	});

	//배너리스트
	function mainBannerList(bannerList){
		console.log("배너리스트 체크");
		console.log(bannerList);
		
	 	var bannerlength = bannerList.length;
	 	console.log(bannerlength);
	 	var brdCtx = "";
	 	var toggleCtx = "";
		if(bannerlength!=0){
			for(var i = 0; i<bannerlength;i++){//배너 그림들 출력
		 		brdCtx +="<li style='width: 100%;height: 100%'>";
		 		brdCtx +="<img class='mySlides' style='width: 100%;height: 100%' src='./"+bannerList[i].ap_path+"'>";
		 		brdCtx +="</li>";
		 		toggleCtx += "<li><a href='#' onclick='setBannerIdx("+(i+1)+")'>";
		 		toggleCtx +="<img class='demo' src='./resources/images/toggle_out.png'></a></li>";
		 	}
			
		}else{
			brdCtx +="<li style='width: 100%;height: 100%'>";
	 		brdCtx +="<img style='width: 100%;height: 100%' src='./resources/images/logo.png'>";
	 		brdCtx +="</li>";
		}
		
		$("#banner").html(brdCtx);
	 	$("#toggle").html(toggleCtx);
	 	if(bannerlength !=0){
	 		showBanner(slideIndex);	
	 	}
	}
	
	function setBanner(num){//배너 좌우 선택
		console.log("좌우 : "+num);
		showBanner(slideIndex += num);
	}
	
	function setBannerIdx(num){//배너 dots클릭
		console.log("점 : "+num);
		showBanner(slideIndex = num);
	}
	
	
	function showBanner(n){//배너보여주기
		clearInterval(inter);
		var i;
		var x = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("demo");
		if (n > x.length) {slideIndex = 1}    
		if (n < 1) {slideIndex = x.length}
		for (i = 0; i < x.length; i++) {
		   x[i].style.display = "none";  
		}
		for (i = 0; i < dots.length; i++) {
		   dots[i].className = dots[i].className.replace(" dots-check", "");
		}
		x[slideIndex-1].style.display = "block";  
		dots[slideIndex-1].className += " dots-check";
		
		inter = setInterval(function(){
			slideIndex++;
			showBanner(slideIndex);
		    },3000);
		
	}
	
	//브랜드리스트
	function mainBrandList(brandList){
		console.log("브랜드리스트 체크");
		console.log(brandList);
		var brdCtx = "";
		for(var i = 0;i<brandList.length;i++){
			brdCtx +="<div class='col-md-4 col-sm-6'>";
			brdCtx += "<a id='detailChk' onclick=detailChk(1,"+brandList[i].b_num+",'"+brandList[i].id+ "')>";
			brdCtx +="<div class='portfolio-thumb'>";
			brdCtx +="<img style='width: 100%; height: 311.95px;' src='./"+brandList[i].ap_path+"' class='img-responsive' alt='Portfolio'>";
			brdCtx +="<div class='portfolio-overlay'>";
			brdCtx +="<div class='portfolio-item'>";
			brdCtx +="<h3>브랜드 게시글 TOP "+(i+1)+"</h3>";
			brdCtx +="<small>Fyler Design</small>";
			brdCtx +="</div></div></div></a></div>";
		}
		$("#brandList").html(brdCtx);  
	}
		
	//일반글리스트
	function mainNormalList(normalList){
		console.log("일반글리스트 체크");
		console.log(normalList);
		var norCtx = "";
		for(var i = 0;i<normalList.length;i++){
			norCtx +="<div class='col-md-4 col-sm-6'>";
			norCtx += "<a id='detailChk' onclick=detailChk(0,"+normalList[i].b_num+",'"+normalList[i].id+ "')>";
			norCtx +="<div class='portfolio-thumb'>";
			norCtx +="<img style='width: 100%; height: 311.95px;' src='./"+normalList[i].ap_path+"' class='img-responsive' alt='Portfolio'>";
			norCtx +="<div class='portfolio-overlay'>";
			norCtx +="<div class='portfolio-item'>";
			norCtx +="<h3>일반 게시글 인기 TOP "+(i+1)+"</h3>";
			norCtx +="<small>Fyler Design</small>";
			norCtx +="</div></div></div></a></div>";
		}
		$("#normalList").html(norCtx);
	}
	
	//상세보기
	function detailChk(num,b_num, id) {
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
					num : num,
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
			location.href="mLoginF";
		}
	}
	
	console.log("${sessionScope.mb.id}");
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
	

	
</script>
</html>
