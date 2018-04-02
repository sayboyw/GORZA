<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>기업 회원가입</title>
		<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
				
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">


<!-- Main css -->
<link rel="stylesheet" href="resources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<style>
#divjoin {
	margin: auto;
	border: 20px solid #8794A3;
	width: 40%;
	height: 70%;
	margin-top: 20px;
	margin-bottom: 100px;
	padding-top: 3%;
}

.area {
	margin: 5px 5px;
	padding: 5px 5px;
	width: 96%;
}

.area2 {
	margin: 5px 5px;
	padding: 5px 5px;
	width: 69%;
}
.pass {
	margin: 5px 5px;
	padding: 5px 5px;
	width: 96%;
}

#jointable {
	width: 100%;
}

.td1 {
	width: 21%;
	text-align: center;
}

.td2 {
	width: 65%;
}

#comEmail1 {
	width: 40%;
}

#comEmail2 {
	width: 25%;
}
</style>
	</head>
	<body>
	<jsp:include page="loginBox.jsp"/>
			<div class="section-title">
				<h3 style="text-align: center; font-size: 22px">기업 회원가입</h3>
			</div>
			<div id="divjoin">
		<table id="jointable">
			<tr>
				<td class = "td1">아이디</td>
				<td class = "td2">
					<input type="text" class = "area" id="comId" name="comId"/>
				</td>
				<td>
					<input type="button" class="btn btn-default" name="overCom" onclick="comIdChk()" value="중복확인">
				</td>
			</tr>
			
			<tr>
				<td class = "td1">비밀번호</td>
				<td class = "td2">
					<input type="password" id="comPassword1" class="pass" name="comPassword1"
						oninput="comChkPw()" placeholder="비밀번호는 8~20자 영문,숫자,특수문자 각각 1개이상을 입력해주세요."/>
				</td>
			</tr>
			
			<tr>
				<td class = "td1">비밀번호 확인</td>
				<td class = "td2">
					<input type="password" id="comPassword2" class="pass" name="comPassword2"
						oninput="comChkPw()" placeholder="비밀번호는 8~20자 영문,숫자,특수문자 각각 1개이상을 입력해주세요."/>
					<font name="checkMessage" size="2"></font>
				</td>
			</tr>
			
			<tr>
				<td class = "td1">브랜드명</td>
				<td class = "td2">
					<input type="text" class = "area" id="comNick" name="comNick"/>
				</td>
				<td>
					<input type="button" class="btn btn-default" name="overComNick" onclick="comNickChk()" value="중복확인">
				</td>
			</tr>
			
			<tr>
				<td class = "td1">법인명</td>
				<td class = "td2">
					<input type="text" class = "area" id="c_name" name="c_name"/>
				</td>
				
			</tr>
			
			<tr>
				<td class = "td1">사업자 등록번호</td>
				<td class = "td2">
					<input type="text" class = "area" id="c_num" name="c_num" maxlength="10" onkeydown="cnum1Chk()"/>
				</td>
			</tr>
			
			<tr>
				<td class = "td1">법인 등록번호</td>
				<td class = "td2">
					<input type="text" class = "area" id="c_num2" name="c_num2" maxlength="13" onkeydown="cnum2Chk()"/>
				</td>
			</tr>
			
			<tr >
				<td class = "td1">이메일</td>
				<td class = "td2" style="padding: 10px 10px;">
					<input type="text"  id="comEmail1" name="comEmail1">&nbsp;@&nbsp;
					<input type="text" id="comEmail2" name="comEmail2" disabled value="naver.com"> 
						<select id="selectEmail" name="selectEmail">
								<option value="1">직접입력</option>
								<option value="naver.com" selected>naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="gmail.com">gmail.com</option>
						</select>
				</td>
				<tr id="inzungArea">
					<td class="td1">이메일인증</td>
					<td class="td2">
					&nbsp;<button id="inzungBtn" class="btn btn-default" onclick="mailSend()">인증 요청</button>
					</td>
				</tr>		
		</table>
		<div style="width: 90%; text-align: center; margin: 5%;">
			<input type="button" class="btn btn-default" value="회원가입" onclick="comJoinSend()"/>
			<input type="button" class="btn btn-default" value="돌아가기" onclick="cancel()"/>
		</div>
		</div>
	<jsp:include page="footer.jsp"/>	
	</body>
	<script>
	//중복체크 여부 변수
	var overI = 0;
	var overN = 0;
	
	//아이디 길이 유효성
	$(document).ready(function() {
		
		$('#comId').on('keyup',function() {
			
			if($(this).val().length > 15) {
				$(this).val($(this).val().substring(0,15));
			}
		});
	});
	
	//이메일 입력방식 선택 
	$('#selectEmail').change(function(){ 
		$("#selectEmail option:selected").each(function () {
			if($(this).val()== '1'){ //직접입력일 경우
				$("#comEmail2").val(''); //값 초기화 
				$("#comEmail2").attr("disabled",false); //활성화
				 form.str_email02.focus();
			}else{ //직접입력이 아닐경우 
			$("#comEmail2").val($(this).text()); //선택값 입력 
			$("#comEmail2").attr("disabled",true); //비활성화 
			} 
		});
				
	}); 
	
	
	//아이디 중복체크
	var specialPattern = /[!,@,#,$,%,^,&,*,?,~]/;
	var hangeul = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var regId = /^[A-za-z]{1}/g;
	
	var comIdChkA = false;
	var comIdChkB = false;
	
	function comIdChk() {
		overI = 1;
			if($("input[name='comId']").val() == "") {
	    		alert("아이디를 입력해주세요.");
	    		comIdChkA = false;
			}else if(specialPattern.test($("input[name='comId']").val())) {
				alert("아이디에 특수문자는 사용하실 수 없습니다.");
			}else if(hangeul.test($("input[name='comId']").val())) {
				alert("아이디에 한글은 사용하실 수 없습니다.");
			}else if($("input[name='comId']").val().length < 5 || $("input[name='comId']").val().length > 15){
	    		alert("아이디는 5자 이상 15자 이하로 만들어주세요.");
	    	}else {
		    	$.ajax({
			        type: 'GET',
			        url: 'overlay',
			        data: {id :$("input[name='comId']").val()},
			        dataType: "json",
			       	success: function(data) {
			        	console.log(data);
		            	if(data.id == 0) {
		            		console.log(data.id);
		            		alert("사용 가능한 아이디입니다.");
		            		comIdChkB = true;
		            	}else {
		            		alert("이미 사용중인 아이디입니다.");
		            		$("input[name='comId']").val("");
		            		comIdChkB = false;
		            	}
			       
		           	},
					error: function(error){
						console.log(error);
					}          
	           	});
			}
	}
	
	//비밀번호 확인
	var pwchkA = 0;
	var pwc = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
	
    function comChkPw() {
    	var pwclass = $('.pass').val();
        var repw = $('#comPassword2').val();
        if(repw=="" && (pwclass != repw && pwclass == repw)){
        	$("#comPassword1").css("background-color", "#FFCECE");
        	$("#comPassword2").css("background-color", "#FFCECE");
       
        }else if (pwclass == repw && pwc.test($('#comPassword1').val())) { // 비밀번호 일치
        	$("#comPassword1").css("background-color", "#B0F6AC");
        	$("#comPassword2").css("background-color", "#B0F6AC");
        	$('font[name=checkMessage]').text('사용 가능한 패스워드입니다.');
            $('font[name=checkMessage]').css('color','green');
            pwchkA=true;
            pwchkA = 1;
        
        }else if (pwclass != repw) { // 비밀번호 불일치
        	pwchkA = 0;
        	$("#comPassword1").css("background-color", "#FFCECE");
        	$("#comPassword2").css("background-color", "#FFCECE");
        	$('font[name=checkMessage]').text('비밀번호를 양식을 확인해주세요.');
            $('font[name=checkMessage]').css('color','red');
            
        }
    }
    
  //기업명 중복체크
	var comNickChkA = false;
	var comNickChkB = false;
	var nickhangeul = /[ㄱ-ㅎ|ㅏ-ㅣ]/;
	
	function comNickChk() {
		overN = 1;//체크 여부
   		if($("input[name='comNick']").val() == "") {
    		alert("기업명을 입력해주세요.");
    		comNickChkA = false;
   		}else if(nickhangeul.test($("input[name='comNick']").val())) {
			alert("기업명은 자음과 모음만으로 구성할 수 없습니다.");
   		}else if($("input[name='comNick']").val().length < 2 || $("input[name='comNick']").val().length > 20) {
    		alert("기업명을 2자 이상 20자 이하로 만들어주세요.");
    	}else {
	    	$.ajax({
		        type: 'GET',
		        url: 'comNickOver',
		        data: {nickname :$("input[name='comNick']").val()},
		        dataType: "json",
		       	success: function(data) {
	            	if(data.nickname == 0) {
	            		alert("사용 가능한 기업명입니다.");
	            		comNickChkB = true;
	            	}else {
	            		alert("이미 사용중인 기업명입니다.");
	            		$("input[name='comNick']").val("");
	            		comNickChkB = false;
	            	}
		       
	           	},
				error: function(error){
					console.log(error);
				}          
           	});
   	 	}
	}	
	var comNum = /^[0-9]{10,10}$/; // 사업자 등록번호 검사식
	//사업자 등록번호 유효성 검사
	function cnum1Chk() {
		if(!((event.keyCode >= 48 && event.keyCode <= 57) 
			|| (event.keyCode >= 96 && event.keyCode <= 105) || event.keyCode == 8)){
			alert("사업자 등록번호는 숫자만 입력 가능합니다.");
			event.returnValue = false;
		}
/* 		if(comNum.test($('#c_num').val()) != true) { // 전화번호 검사
			alert('사업자 등록번호는 10자리의 숫자만 입력해 주세요.');
			return false;
		} */
	}
	
	var corNum = /^[0-9]{13,13}$/; // 사업자 등록번호 검사식
	//법인 등록번호 유효성 검사
	function cnum2Chk() {
		if(!((event.keyCode >= 48 && event.keyCode <= 57) 
			|| (event.keyCode >= 96 && event.keyCode <= 105) || event.keyCode == 8)){
			alert("법인 등록번호는 숫자만 입력 가능합니다.");
			event.returnValue = false;
		}
/* 		if(corNum.test($('#c_num2').val()) != true) { // 전화번호 검사
			alert('법인 등록번호는 13자의 숫자만 입력해 주세요. ');
			return false;
		} */
	}
	
	var inzungNum;
	//인증 메일 발송
	function mailSend() {
		if($('#comEmail1').val()==""){
			alert("이메일을 입력해주세요");
		}else{
			alert("인증번호가 전송되었습니다.");
			$.ajax({
		        type: 'post',
		        url: 'mailSend',
		        data: {
		        	email1 : $("#comEmail1").val(),
					email2 : $("#comEmail2").val(),
		        },
		        dataType: "json",
		       	success: function(data) {
		       		console.log(data);
		       		var ctx = "";
		       		ctx +="<td class='td1'>"
		       		ctx +="</td>"
		       		ctx +="<td class='td2'><button id='inzungBtn' class='btn btn-default' onclick='mailSend()'>재전송</button>";
	       			ctx +="<input id='inIn' type='text' class='area2' placeholder='인증번호 입력해 주세요'>";
	       			ctx +="<input onclick='inzungChk()' class='btn btn-default' type='button' value='확인'>";
	   				ctx +="</td>";
	   				
	   				inzungNum = data.inzungNum;
	   				
		       		$("#inzungArea").html(ctx);
	           	},
				error: function(error){
					console.log(error);
				}          
	       	});
		}
		
		
	}
	
	var zzzung = false;
	function inzungChk(){
		if($("#inIn").val() == inzungNum){
			zzzung = true;
			alert("인증에 성공하셨습니다.");
		}else{
			zzzung = false;
			alert("인증번호를 확인해주세요!!");
		}
	}
	

	var reNumber = /^[0-9]+$/;
	
	//회원가입 + 유효성
	function comJoinSend() {
		if($("input[name='comId']").val() == "") {
    		alert("모든 내용을 입력하세요.");
		}else if(overI == 0) {
			alert("아이디 중복체크를 확인해주세요.");
		}else if($("input[name='comPassword1']").val() == "") {
			alert("모든 내용을 입력하세요.");
		}else if($("input[name='comPassword2']").val() == "") {
			alert("모든 내용을 입력하세요.");
		}else if($("input[name='c_name']").val() == "") {
			alert("모든 내용을 입력하세요.");
		}else if(nickhangeul.test($("input[name='c_name']").val())) {
			alert("법인명을 자음과 모음만으로 구성할 수 없습니다.");	
		}else if($("input[name='c_num']").val() == "") {
			alert("모든 내용을 입력하세요.");
		}else if(!reNumber.test($("input[name='c_num']").val())) {
			alert("사업자 등록번호를 확인해주세요.");	
		}else if($("input[name='c_num2']").val() == "") {
			alert("모든 내용을 입력하세요.");
		}else if(!reNumber.test($("input[name='c_num2']").val())) {
			alert("법인 등록번호를 확인해주세요.");
		}else if(overN == 0) {
			alert("브랜드명(닉네임) 중복체크를 확인해주세요.");
		}else if($("input[name='comEmail1']").val() == "") {
			alert("모든 내용을 입력하세요.");
		}else if($("input[name='comEmail2']").val() == "") {
			alert("모든 내용을 입력하세요.");
		}else if(!zzzung){
			alert("인증번호를 확인해 주세요");
		}else {
			$.ajax({
					type : 'GET',
					url : './mComJoinF',
					data : {
						id : $("#comId").val(),
						pw1 : $("#comPassword1").val(),
						pw2 : $("#comPassword2").val(),
						nickName: $("#comNick").val(),
						c_name : $("#c_name").val(),
						c_num : $("#c_num").val(),
						c_num2: $("#c_num2").val(),
						email1 : $("#comEmail1").val(),
						email2 : $("#comEmail2").val(),
					},
					dataType: "json",
					success : function(data) {
						if(data.success == 1){
							alert("회원가입에 성공하셨습니다.");
							location.href="mLoginF";
						}else {
							alert("회원가입에 실패하셨습니다.");
						}
					},
					error: function(error){
						console.log(error);
					}
					
				});
			
			}
		}
	
	//취소 버튼
	function cancel() {
		location.href = "./";
	}
	</script>
</html>