<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/css/style.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700">
	
	<style>
	#rankArticleView_layer {
		display: none;
		position: fixed;
		position:absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%
	}
	
	#rankArticleView_layer.open {
		display: block;
		color: red
	}
	
	#rankArticleView_layer #rankBg_layer {
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
	
	#rankContents_layer {
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
	.detail1{
		position: absolute;
	  background: #222;
	  color: #ffffff;
	  top: 33px;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  width: 100%;
	  height: 90%;
	  text-align: center;
	  vertical-align: top;
	  padding-top: 32px;
	  opacity: 0;
	  transition: all 0.4s ease-in-out;
	}
	div#selBtn {
    	transform: translateX(50%);
    }
    #part {
    border: 1px solid #BDBDBD;
    padding: 2px;
    width: 6%;
    position: relative;
    top: -15px;
    left: -3%;
    margin: 4px;
    -webkit-appearance: none;
    -moz-appearance: none;
    background: url(./resources/images/arrowDown.jpg) no-repeat 99% 32%;
    height: 32px;
}
#hoverc{
	cursor: pointer;
}
	</style>
</head>
<body>
<jsp:include page="loginBox.jsp"/>
	<div id="selBtn">
		<select name="part" id="part" onchange="chageSelect()">
			<option value="like" selected="selected">좋아요 수</option>
			<option value="reply">댓글 갯수</option>
		</select><br/>
	</div>	
	<div class="container">
		<div id="boardList" class="row"></div>
	</div>
	
	
	<!-- light Box Div -->
	<div id="rankArticleView_layer">
		<div id="rankBg_layer"></div>
		<div id="rankContents_layer"></div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
<script>
	function chageSelect(){		//onchange 값 변경시 작동
		var cId="${id}";
	    var part = $("#part").val();
	    getRank(cId,part);
	}
	
	$(document).ready(function(){
		var cId="${id}";
		var part = $("#part").val();

		console.log("받아온 아이디 : "+cId);
		console.log("선택한 랭크 종류 : "+ part);
		
		var sessionConfirm = "${sessionScope.cm.c_agree}";
		console.log("기업 세션값(c_agree): "+sessionConfirm);
		if(sessionConfirm !=2){
			alert("권한이 없습니다.");
			location.href="./";
		}
		getRank(cId,part);
	});
	
	function getRank(cId,part){
		$.ajax({
			type:"get",
			url:"getRank",
			data:{
				id:cId,
				part:part
			},
			dataType:"JSON",
			success:function(data){
				console.log(data);
				console.log("ajax 성공");
				
				var contxt = ""
		            for (var i = 0; i < data.blist.length; i++) {
		            	contxt += "<div class='col-md-4 col-sm-6'>";
						contxt += "<div style='width: 100%; class='col-md-4 col-sm-6'>";
						contxt += "<div><img class='round' style='width:16%' src='./resources/profile/"+data.blist[i].sysName+"'>&nbsp;&nbsp;"
						+ "<a style='font-size:15px; font-weight:700'>"+data.blist[i].nickName+"</a>";
						contxt += "<a style='position:absolute;right:5%;margin-top: 2%;'>"
								+ data.blist[i].br_date + "</a></div></div>";
						contxt += "<a id='detailChk' onclick=detailChk("
								+ data.blist[i].b_num + ",'"
								+ data.blist[i].id + "')>";
						contxt += "<br/>"
						contxt += "<div class='portfolio-thumb'>";
						contxt += "<img style='width: 100%; height: 35%;cursor: pointer;' src='./"
								+ data.blist[i].ap_path
								+ "' class='img-responsive' alt='Portfolio'>";
						contxt += "<div id='hoverc' class='portfolio-overlay'>";
						contxt += "<div class='portfolio-item'>";
						contxt += "</div></div></div></a>";
						contxt += "<div> <p style='font-weight:700'>좋아요 "+data.blist[i].likeC
								+"&nbsp; 댓글 "+data.blist[i].comCount
								+ "</div></p></div>";
		            }
				
				
				
				 $("#boardList").html(contxt);
			}, 
			error:function(e){
				alert("랭킹 가져오기 실패");
				console.log(e);
			}
		});
	}
	
	 function detailChk(b_num, id) {
	      var session = "${sessionScope.mb}"
	      console.log("디테일 콘솔");
	      console.log(session);
	      if(session !=""){
	         console.log("비넘 : " + b_num);
	         console.log("아이디 : " + id);
	         $("#rankArticleView_layer").addClass('open');
	         $.ajax({
	            type : 'get',
	            url : 'brandDetail',
	            data : {
	               id : id,
	               b_num : b_num,
	               num : 1
	            },
	            dataType : 'html',
	            success : function(data) {
	               console.log("ajax 성공");
	               //console.log(data);
	               $("#rankContents_layer").html(data);
	            },
	            error : function(e) {
	               alert("상세보기실패");
	               console.log(e);
	            }
	         });
	      }else{
	         alert("로그인이 필요한 서비스 입니다.");
	         location.href="mLoginF";
	      }
	      
	   }
	 
	   $("#rankBg_layer").click(function(){
		   $("#rankArticleView_layer").removeClass("open");
	   });
	   
</script>
</html>