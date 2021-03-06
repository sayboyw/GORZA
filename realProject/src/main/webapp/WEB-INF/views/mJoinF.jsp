<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>일반 회원가입</title>
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
    height: 76%;
    margin-top: 20px;
    margin-bottom: 100px;
    padding-top: 3%;
}

.area {
	margin: 5px 5px;
	padding: 5px 5px;
	width: 96%;
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

#userEmail1 {
	width: 40%;
}

#userEmail2 {
	width: 25%;
}
</style>
</head>
	<body>
	<jsp:include page="loginBox.jsp"/>
					<div class="section-title">
				<h3 style="text-align: center; font-size: 22px">일반 회원가입</h3>
			</div>
		<div id="divjoin">
			<div >
				<table id="jointable">
					
					<tr>
						<td class = "td1">아이디</td>
						<td class = "td2">
							<input type="text" class = "area" id="userId" name="userId" onkeyup="keyUp()"/>
							</td>
							<td>
							<input type="button" class="btn btn-default" name="overId" onclick="idChk()" value="중복확인">
						</td>
					</tr>
					
					<tr>
						<td class = "td1">비밀번호</td>
						<td>
							<input type="password" id="userPassword1" class="pass" name="userPassword1" 
								oninput="chkPw()" placeholder="비밀번호는 8~20자 영문,숫자,특수문자 각각 1개이상을 입력해주세요."/>
						</td>
					</tr>
					
					<tr>
						<td class = "td1">비밀번호 확인</td>
						<td>
							<input type="password" id="userPassword2" class="pass" name="userPassword2" 
								oninput="chkPw()" placeholder="비밀번호는 8~20자 영문,숫자,특수문자 각각 1개이상을 입력해주세요."/>
						</td>
						<tr>
						<td class = "td1">
						</td>
						<td class="td2">
						<font name="checkMessage" size="2"></font>
						</td>
						</tr>
					</tr>
				</table>
			</div>
			
			<div>
				<table id="jointable">
					<tr>
						<td class = "td1">이름</td>
						<td class = "td2">
							<input type="text"  class = "area" id="userName" name="userName"/>
						</td>
					</tr>
					
					<tr>
						<td class = "td1" >성별</td>
						<td class = "td2" style="padding: 10px 10px;">
							&nbsp; &nbsp; &nbsp; &nbsp;<input type="radio" id="userGender" name="userGender" value="남자"/>남자&nbsp; &nbsp; &nbsp;  
							<input type="radio" id="userGender" name="userGender" value="여자"/>여자
						</td>
					</tr>
					
					<tr>
						<td class = "td1">닉네임</td>
						<td class = "td2">
							<input type="text"  class = "area" id="usernickName" name="usernickName"/>
						</td>
						<td><input type="button" class="btn btn-default" name="overNick" onclick="nickChk()" value="중복확인"></td>
					</tr>
						
					
					<tr>
			            <td class = "td1" >생년월일</td>
			            <td class = "td2" style="padding: 10px 10px;">
			            	<select id="birthYY">
			            		<%for(int i=2012; i>=1950; i--){ %>
			            			<option value="<%=i %>"><%=i %></option>
			            		<%} %>
			            	</select>년
			                       
				            <select id="birthMM">
				            	<%for(int i=1; i<=12; i++){ %>
				            		<option value="<%=i %>"><%=i %></option>
				            	<%} %>
				            </select>월
				        
				            <select id="birthDD">
				            	<%for(int i=1; i<=31; i++){ %>
				            		<option value="<%=i %>"><%=i %></option>
				           		<%} %>
				            </select>일
			            </td>
		            </tr>

					<tr>
						<td class = "td1">이메일</td>
						<td class = "td2" style="padding: 10px 10px;">
							<input type="text"  id="userEmail1" name="userEmail1">&nbsp;@&nbsp;
							<input type="text"  id="userEmail2" name="userEmail2" disabled value="naver.com"> 
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
					</tr>

					<tr>
						<td class = "td1" >비밀번호 찾기 질문</td>
						<td class = "td2" style="padding: 10px 10px;">
							<select id="userPw_Q" name="userPw_Q">
								<option>자신의 보물 제 1호는?</option>
								<option>내가 좋아하는 캐릭터는?</option>
								<option>인상 깊게 읽은 책 제목은?</option>
								<option>다시 태어나면 되고 싶은 것은?</option>
								<option>유년시절 별명은?</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td class = "td1">비밀번호 찾기 답변</td>
						<td class = "td2">
							<input type="text"  class = "area" id="userPw_A" name="userPw_A">
						</td>
					</tr>
				</table>
				<div style="width: 90%; text-align: center; margin: 5%;">
				<input type="button" class="btn btn-default" value="회원가입" onclick="mJoinSend()">
				<input type="button" class="btn btn-default" value="돌아가기" onclick="cancel()"/>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"/>
	</body>
	<script>
	//중복체크 여부 변수
	var overI = 0;
	var overN = 0;
	
	
	//이메일 입력방식 선택 
	$('#selectEmail').change(function(){ 
		$("#selectEmail option:selected").each(function () {
			if($(this).val()== '1'){ //직접입력일 경우
				$("#userEmail2").val(''); //값 초기화 
				$("#userEmail2").attr("disabled",false); //활성화
				 form.str_email02.focus();
			}else{ //직접입력이 아닐경우 
				$("#userEmail2").val($(this).text()); //선택값 입력 
				$("#userEmail2").attr("disabled",true); //비활성화 
			} 
		});
				
	}); 
	
	//아이디 길이 유효성
	$(document).ready(function(){
		
		$('#userId').on('keyup',function() {
			
			if($(this).val().length > 15) {
				$(this).val($(this).val().substring(0,15));
			}
		});
	});
	
	
	//아이디 중복체크
	var specialPattern = /[!,@,#,$,%,^,&,*,?,_,~,-]/;
	var hangeul = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var regId = /^[A-za-z]{1}/g;
	var idchkA = false;
	var idchkB = false;

	function idChk() {
		overI = 1;
			if($("input[name='userId']").val() == "") {
	    		alert("아이디를 입력해주세요.");
	    		idchkA = false;
			}else if(specialPattern.test($("input[name='userId']").val())) {
				alert("아이디에 특수문자는 사용하실 수 없습니다.");
			}else if(hangeul.test($("input[name='userId']").val())) {
				alert("아이디에 한글은 사용하실 수 없습니다.");
			}else if($("input[name='userId']").val().length < 5 || $("input[name='userId']").val().length > 15){
	    		alert("아이디는 5자 이상 15자 이하로 만들어주세요.");
	    	}else{
	    		
		    	$.ajax({
			        type: 'GET',
			        url: 'overlay',
			        data: {id :$("input[name='userId']").val()},
			        dataType: "json",
			       	success: function(data) {
			        	console.log(data);
		            	if(data.id == 0) {
		            		console.log(data.id);
		            		alert("사용 가능한 아이디입니다.");
		            		idchkB = true;
		            	}else {
		            		alert("이미 사용중인 아이디입니다.");
		            		$("input[name='userId']").val("");
		            		idchkB = false;
		            	}
			       
		           	},
					error: function(error){
						console.log(error);
					}          
	           	});		
		}
	}
           
	function keyUp(){
		idchkB = false;
	}
	//비밀번호 확인
	var pwchkA = 0;
	var pwc = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
	
    function chkPw() {
    	var pwclass = $('.pass').val();
        var repw = $('#userPassword2').val();
        if(repw=="" && (pwclass != repw && pwclass == repw)){
        	$("#userPassword1").css("background-color", "#FFCECE");
        	$("#userPassword2").css("background-color", "#FFCECE");
       
        }else if (pwclass == repw && pwc.test($('#userPassword1').val())) { // 비밀번호 일치
        	$("#userPassword1").css("background-color", "#B0F6AC");
        	$("#userPassword2").css("background-color", "#B0F6AC");
        	$('font[name=checkMessage]').text('사용 가능한 패스워드입니다.');
            $('font[name=checkMessage]').css('color','green');
            pwchkA=true;
            pwchkA = 1;
        
        }else if (pwclass != repw) { // 비밀번호 불일치
        	pwchkA = 0;
        	$("#userPassword1").css("background-color", "#FFCECE");
        	$("#userPassword2").css("background-color", "#FFCECE");
        	$('font[name=checkMessage]').text('비밀번호를 양식을 확인해주세요.');
            $('font[name=checkMessage]').css('color','red');
            
        }
    }
    
    
  	//닉네임 중복확인
  	var nickChkA = false;
	var nickChkB = false;
	var nickhangeul = /[ㄱ-ㅎ|ㅏ-ㅣ]/;
	
	function nickChk() {
		overN = 1;
   		if($("input[name='usernickName']").val() == "") {
    		alert("닉네임을 입력해주세요.");
    		nickChkA = false;
   		}else if(nickhangeul.test($("input[name='usernickName']").val())) {
			alert("닉네임 자음과 모음만으로 구성할 수 없습니다.");
   		}else if($("input[name='usernickName']").val().length < 2 || $("input[name='usernickName']").val().length > 15){
    		alert("닉네임은 2자 이상 15자 이하로 만들어주세요.");
   		}else if(specialPattern.test($("input[name='usernickName']").val())) {
			alert("닉네임에 특수문자는 사용하실 수 없습니다.");
    
			
    	}else {
	    	$.ajax({
		        type: 'GET',
		        url: 'nickOverlay',
		        data: {nickName :$("input[name='usernickName']").val()},
		        dataType: "json",
		       	success: function(data) {
		       		console.log(data);
	            	if(data.nickName == 0) {
	            		alert("사용 가능한 닉네임입니다.");
	            		nickChkB = true;
	            	}else {
	            		alert("이미 사용중인 닉네임입니다.");
	            		$("input[name='usernickName']").val("");
	            		nickChkB = false;
	            	}
		       
	           	},
				error: function(error){
					console.log(error);
				}          
           	});
   	 	}
	}	
    
	var reNumber = /^[0-9]+$/;
	
	
	//회원가입 + 유효성
	function mJoinSend() {
		if($("input[name='userId']").val() == "") {
    		alert("모든 내용을 입력하세요.");
		}else if(reNumber.test($("input[name='userName']").val())) {
			alert("이름에 숫자를 넣을 수 없습니다.");
		}else if(nickhangeul.test($("input[name='userName']").val())) {
			alert("이름은 자음과 모음만으로 구성할 수 없습니다.");
		}else if(specialPattern.test($("input[name='userName']").val())) {
			alert("이름에 특수문자는 사용할 수 없습니다.");
		}else if(overI == 0) {
			alert("아이디 중복체크를 확인해주세요.");
		}else if($("input[name='userPassword1']").val() == "") {
			alert("모든 내용을 입력하세요.");
		}else if($("input[name='userPassword2']").val() == "") {
			alert("모든 내용을 입력하세요.");
		}else if($("input[name='userName']").val() == "") {
			alert("모든 내용을 입력하세요.");
		}else if($("input:radio[name=userGender]").is(":checked") == false) {
			alert("모든 내용을 입력하세요.");
		}else if($("input[name='usernickName']").val() == "") {
			alert("모든 내용을 입력하세요.");
		}else if(overN == 0) {
			alert("닉네임 중복체크를 확인해주세요.");
		}else if($("input[name='userEmail1']").val() == "") {
			alert("모든 내용을 입력하세요.");
		}else if($("input[name='userEmail2']").val() == "") {
			alert("모든 내용을 입력하세요.");
		}else if($("input[name='userPw_Q']").val() == "") {
			alert("모든 내용을 입력하세요.");
		}else if($("input[name='userPw_A']").val() == "") {
			alert("모든 내용을 입력하세요.");
		}else {
			$.ajax({
					type : 'GET',
					url : './mJoinF',
					data : {
						id : $("#userId").val(),
						pw1 : $("#userPassword1").val(),
						pw2 : $("#userPassword2").val(),
						name : $("#userName").val(),
						gender : $("input[name='userGender']:checked").val(),
						nickName : $("#usernickName").val(),    
						birthYY : $("#birthYY").val(),
						birthMM : $("#birthMM").val(),
						birthDD : $("#birthDD").val(),
						email1 : $("#userEmail1").val(),
						email2 : $("#userEmail2").val(),
						pw_q : $("#userPw_Q").val(),
						pw_a : $("#userPw_A").val()
					},
					dataType: "json",
					success : function(data) {
						if(data.success == 1){
							alert("회원가입에 성공하셨습니다.");
							location.href="mLoginF";	// 페이지 이동은 수정해야함
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
		location.href = "mLoginF";
	}
	</script>
</html>