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
			
			#haha{
			    width: 57%;
			    border-radius: 10px;
			    height: 100%;
			    padding: 40px;
			    margin: 0 auto;
			    border: 1px solid;
			    /* transform: translateX(25%); */
			    border: 1px solid #BDBDBD;
			}
			
			#haha input[type=text]{
				border-radius: 10px;
			    margin: 7px;
			    border: 1px solid #BDBDBD;
			    padding: 8px;
			}
			
			#findId{
			    border: 1px solid;
			    border-radius: 10px;
			    margin: 24px auto 0px;
			    padding: 5px;
			    width: 22%;
			    border: 1px solid #BDBDBD;
			}
			
			#pw_q{
			    border: 1px solid #BDBDBD;
			    border-radius: 10px;
			    padding: 11px;
			    width: 40%;
			    margin: 4px;
			    -webkit-appearance: none;
			    -moz-appearance: none;
			    appearance: none;
			    background: url("./resources/images/arrowDown.jpg") no-repeat 95% 50%;
			}
			.findClick:HOVER{
				cursor: pointer;
			}
		</style>
	</head>
	<body>
<jsp:include page="loginBox.jsp"/>

<!-- 사각형영역 -->

<section id="portfolio">
		<div class="container">
			<div>
				<ul class="nav nav-tabs" style="transform: translateX(34.2%);border-bottom: 0px">
					<li class="nav-item on" value="1" id="li1"><a
						class="nav-link active"  data-toggle="tab" href="#" id="name1" onclick="findMethod('id')">아이디 찾기</a></li>
					<li class="nav-item on" value="0" id="li2"><a
						 class="nav-link active" data-toggle="tab" href="#" id="name2" onclick="findMethod('pw')">비밀번호 찾기</a></li>
				</ul>
			</div>
			<div id="haha">
			
			
			</div>
		</div>
		
		
	</section>
	
<jsp:include page="footer.jsp"/>
<!-- Footer Section -->
<!-- SCRIPTS -->

<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/custom.js"></script>
</body>
<script>
	$(document).ready(function(){
		findMethod('id');
	});
	function findMethod(val){
		
		var ctx = "";
		if(val=="id"){
			ctx += "<div style='text-align:center'>";
			ctx += "<input id='name' type='text' placeholder='이름(실명)'></br>";
			ctx += "<input id='email' type='text' placeholder='이메일'></br>";
			ctx += "<div class='findClick' id='findId' onclick='mFindId()'>아이디 찾기</div>";
			ctx += "</div>"
		}else if(val=="pw"){
				ctx += "<div style='text-align:center'>";
				ctx += "<input id='id' type='text' placeholder='아이디'></br>";
				ctx += "<input id='name' type='text' placeholder='이름(실명)'></br>";
				ctx += "<input id='email' type='text' placeholder='이메일'></br>";
				ctx += "<select id='pw_q' name='pw_q'>";
				ctx += "<option selected>비밀번호 찾기 질문</option>";
				ctx += "<option>자신의 보물 제 1호는?</option>";
				ctx += "<option>내가 좋아하는 캐릭터는?</option>";
				ctx += "<option>인상 깊게 읽은 책 제목은?</option>";
				ctx += "<option>다시 태어나면 되고 싶은 것은?</option>";
				ctx += "<option>유년시절 별명은?</option>";
				ctx += "</select><br/>";
				
				ctx += "<input type='text' placeholder='답변'></br>";
				ctx += "<div class='findClick' id='findId' onclick='mFindPw()'>비밀번호 찾기</div>";
				ctx += "</div>"
		}
		$("#haha").html(ctx);
	}

	function mFindId(){ //아이디 찾기
		console.log("아이디 찾기");
	
		 $.ajax({
				type:"post",
				url:"mFindId",
				data:{
					emailAll : $("#email").val(),
					name: $("#name").val()
				},
				dataType:"JSON",
				success:function(data) {
					console.log(data);
					var ctx = "";
					var idListLength = data.idList.length;
					for(var i = 0 ; i<idListLength;i++){
						ctx += "<div>"+data.idList[i]+"</div>";
					}
					if(idListLength==0){
						alert("이름과 이메일 정보를 확인해주세요.");
						location.href="mFindF";
					}
					$("#haha").html("회원님의 아이디는"+ctx+"입니다.");
					$("#haha").css("text-align","center");
					$("#haha").css("color","gray");
					$("#haha").css("font-weight","600");
				},
				error:function(e){
					alert("아이디 찾기 실패");
				}
			}); 
	}
	
	function mFindPw(){ //비밀번호 찾기
		console.log("비밀번호 찾기");
		$.ajax({
			type:"post",
			url:"mFindPw",
			data:{
				emailAll : $("#email").val(),
				name: $("#name").val(),
				pw_q : $("#pw_q").val(),
				id : $("#id").val()
			},
			dataType:"JSON",
			success:function(data){
				alert(data.msg);
				if(data.chk==0){
					window.location.reload();
				}else{
					location.href="mLoginF";
				}
			},
			error:function(e){
				alert("비밀번호 찾기 실패");
			}
		}); 
	}
	
</script>
</html>