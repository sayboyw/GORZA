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
}

#detailChk {
	cursor: pointer;
}

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
	<h2 style="color: black;position: relative;left: 20%">'#${search }'의 검색결과 </h2>
	<section id="portfolio">
     <div class="container">
          <c:forEach items="${searchList}" var="searchList" >
               <div class="col-md-4 col-sm-6">
               <div style="width: 100%;">
               <div><img class="round" style="width: 16% " src="resources/profile/${searchList.profile }">&nbsp;&nbsp;
						<a style='font-size:15px; font-weight:700' href='myStyle?nickName=${searchList.nickName }'>${searchList.nickName }</a>
						<a style="position:absolute;right:5%;margin-top: 2%;">${searchList.date }</a></div></div>
						<c:if test="${searchList.b_divide == 0 }">
						<a id="detailChk" onclick="detailChk(0,${searchList.b_num },'${searchList.id}')">
						</c:if>
						<c:if test="${searchList.b_divide == 1 }">
						<a id="detailChk" onclick="detailChk(1,${searchList.b_num },'${searchList.id}')">
						</c:if>
						     <div class="portfolio-thumb">
                              <img style="width: 100%; height: 35%;" src="./${searchList.ap_path }" class="img-responsive" alt="Portfolio">
                                   <div class="portfolio-overlay">
                                        <div class="portfolio-item">
                                             <h3>검색글 인기순</h3>
                                             <small>Brand Identity</small>
                                        </div>
                                   </div>
                         </div>
                    </a>
                    <div><p style='font-weight:700'> 좋아요&nbsp; ${searchList.likeC }&nbsp;&nbsp; 댓글&nbsp;${searchList.comCount }</p></div>
               </div>
			</c:forEach>

               <div class="col-md-12 col-sm-12 text-center">
                    <h3>hello, if you interest working together. just send message <a href="contact.html">contact page</a></h3>
               </div>

          </div>
</section>
<!-- light Box Div -->
	<div id="articleView_layer">
		<div id="bg_layer"></div>
		<div id="contents_layer"></div>
	</div>
</body>
<script>

function detailChk(num,b_num, id) {
	var session = "${sessionScope.mb}"
	console.log(session);
	if (session != "") {
		console.log("비넘 : " + b_num);
		console.log("아이디 : " + id);
		console.log("구분자 : "+num);
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
	}

}

</script>
</html>