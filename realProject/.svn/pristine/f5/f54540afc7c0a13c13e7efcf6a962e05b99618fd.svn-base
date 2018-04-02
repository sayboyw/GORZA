<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700"
	rel="stylesheet">
<style type="text/css">
.col-md-4 {
	margin-top: 40px;
}

#likeNew {
	width: 200px;
	height: 30px;
	margin: auto;
}

#logo {
	width: 35%;
}
/*  #div2{
			margin:auto;
		}  */
#menubar1 {
	margin: auto;
	width: 100%;
	height: 7%;
}

.round {
	border-radius: 50%;
	height: 6%;
	background-size: 100% 100%;
}

#detailChk {
	cursor: pointer;
}


/* ---------------------------------------코디상세보기----------------------------------------- */
#articleView_layer {
	display: none;
	position: fixed;
	position:absolute;
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

.navbar-nav {
	float: none;
}

#portfolio .portfolio-thumb {
	margin-top: 10px;
}
</style>
</head>
<body>
	<jsp:include page="loginBox.jsp"/>
	<!-- Home Section -->
	<div id="likeNew">
		<button class="btn btn-default" id="likeList" onClick='bListShow(0)'>인기순</button>
		<button class="btn btn-default" id="newList" onClick='bListShow(1)'>최신순</button>
	</div>
	<section id="portfolio">
		<div class="container">
			<div id="boardList" class="row"></div>
		</div>
		<div id="paging" style="text-align: center;"></div>
	</section>
	<!-- light Box Div -->
	<div id="articleView_layer">
		<div id="bg_layer"></div>
		<div id="contents_layer"></div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		console.log("ready굳");
		bListShow(0);
	});

	function bListShow(num,pageNum) {
		//인기순 0 , 최신순 1
		console.log(num);
		$.ajax({
			type : "get",
			url : "bList",
			data : {
				pageNum : pageNum,
				'num' : num
			},
			dataType : "JSON",
			success : function(data) {
				console.log(data);
				var contxt = ""
				for (var i = 0; i < data.blist.length; i++) {
					contxt += "<div class='col-md-4 col-sm-6'>";
					contxt += "<div style='width: 100%; class='col-md-4 col-sm-6'>";
					contxt += "<div><img class='round' style='width:16%' src='./resources/profile/"+data.blist[i][7]+"'>&nbsp;&nbsp;"
					+ "<a style='font-size:15px; font-weight:700' href='myStyle?nickName="+data.blist[i][8]+"'>"+data.blist[i][8]+"</a>";
					contxt += "<a style='position:absolute;right:5%;margin-top: 2%;'>"
							+ data.blist[i][4] + "</a></div></div>";
					contxt += "<a id='detailChk' onclick=detailChk("
							+ data.blist[i][0] + ",'"
							+ data.blist[i][6] + "')>";
					contxt += "<div class='portfolio-thumb'>";
					contxt += "<img style='width: 100%; height: 35%;' src='./"
							+ data.blist[i][3]
							+ "' class='img-responsive' alt='Portfolio'>";
					contxt += "<div class='portfolio-overlay'>";
					contxt += "<div class='portfolio-item'>";
					contxt += "<h3>상세보기</h3>";
					contxt += "<small>클릭하세요</small></div></div></div></a>";
					contxt += "<div> <p style='font-weight:700'>좋아요 "+data.blist[i][2]
							+"&nbsp; 댓글 "+data.blist[i][1]
							+ "</div></p></div>";
				}


				$("#boardList").html(contxt);
				$("#paging").html(data.paging);

			},
			error : function(error) {
				console.log(error);
				alert("일반 게시판 게시글 불러오기 실패");
			}
		});
	}

	$(".navbar navbar-default navbar-static-top").append($("div2"))
	$("#div2").append($("#likeNew"));

	function detailChk(b_num, id) {
		var session = "${sessionScope.mb}"
		console.log(session);
		if(session !=""){
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
		}else{
			alert("로그인이 필요한 서비스 입니다.");
			location.href="mLoginF";
		}
		
	}
</script>
</html>