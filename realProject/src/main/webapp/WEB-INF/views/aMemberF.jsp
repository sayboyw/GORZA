<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<link rel="stylesheet" href="resources/css/font-awesome.min.css">
		
		<!-- Main css -->
		<link rel="stylesheet" href="resources/css/style.css">
		<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
		<title>관리자 - 일반회원 관리페이지</title>
		<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
<style>
.intro {
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

.intro:hover {
	text-overflow: inherit;
	overflow: visible;
}

#div2 {
	margin: auto;
	border: 20px solid #8794A3;
	padding: 3%;
	width: 37%;
}

#memTable th {
	text-align: center;
}

#member_ban {
	border: 1px solid #BDBDBD;
	padding: 2px;
	width: 18%;
	position: relative;
	top: 5px;
	left: -4px;
	margin: 4px;
	-webkit-appearance: none;
	-moz-appearance: none;
	background: url(./resources/images/arrowDown.jpg) no-repeat 99% 32%;
	height: 28px;
}
</style>
</head>
	<body>
		<jsp:include page="loginBox.jsp"></jsp:include>
	
			<div class="section-title">
                <h3 style="text-align: center; font-size: 22px">회원관리</h3>
            </div>
	
		<jsp:useBean id="nMember" class="com.board.bean.N_member">
			<jsp:setProperty name="nMember" property="state" value="0" />
		</jsp:useBean>
		<!-- 	일반회원임을 의미 -->
		
		<div id="div2">
		<input type="hidden" id="memState" value=<%= nMember.getState()%> />
		<form>
			<div id="member_divide">
				<!-- 멤버분류 -->
				<select name="member_ban" id="member_ban">
					<option value="normal" selected="selected">일반회원</option>
					<option value="banned">정지회원</option>
					<option value="leave">탈퇴회원</option>
				</select>
				
				</div>
			
			<div id="member_search">
				<!-- 회원검색 -->
				<input type="text" id="keyword" name="keyword"
					placeholder="닉네임으로 회원검색" /> <input type="button" class="btn btn-default"
					
					onclick="searchChk(form)" value="검색">
	
			</div>
		</form>
		<input type="button" class="btn btn-default" onclick="allm()" value="전체회원보기">
		<table id="memTable" style="width: 100%;text-align: center;border: 1px solid #d1d1d1;">
	
		</table>
		</div>
		<jsp:include page="footer.jsp" />
	</body>
	<script>
		var banstate;
		var banleave;
		var banstate;
		var banstop;
		var str;
		var datechk;
		var i;
		var bcnt;
		var loginId="${sessionScope.mb.id}";
		// 세션값을 가져와서 로그인여부 확인	
		var state = "${sessionScope.mb.state}"
		if(loginId ==""){	//로그인 안된 상태일 때
			alert("로그인이 필요한 서비스입니다.");
			location.href="mLoginF";	
		}else{
			if(state !=2){
				alert("권한이 없습니다.");
				location.href="./";
			}
		}
		
		//페이지 로드 시에 회원전체리스트 가져오기
	$(document).ready(function(){
		mainPrtint();
	});
		
	function mainPrtint(){
		var str ="";
		$.ajax({
			type:"post",
			url:"aMemberListF",
			data:{
				memState:$("#memState").val()
			},
			dataType:"JSON",
			success:function(data){
				console.log(data);
				console.log("1번 전체");
				console.log(data.newList.length);
				console.log("--------------");
				console.log("회원리스트 불러오기");
				
				var mListStart =data.newList[0];
				console.log("0번리스트의 사이즈 : " +mListStart);
					str="";
					str+="<tr style='border:1px solid #d1d1d1'><th>"+"닉네임"+"&nbsp</th>";
					str+="<th>"+"자기소개"+"&nbsp</th>";
					str+="<th>"+"정지내역"+"&nbsp</th>";
					str+="<th>"+"현재상태"+"&nbsp</th></tr>";
					str+="<tr>";
					
					 if($.isNumeric(data.newList[2])){	//리스트가 3개옴
						 for(i=3;i< data.newList.length;i++){
								bcnt=data.newList[i].bcnt;
								console.log("카운트 : "+bcnt);
								datechk=data.newList[i].datechk;
								console.log("날짜 비교값 : "+datechk);
								banleave=data.newList[i].ban_leave;
								
								if(!bcnt){
									banstate="일반회원";
								}else if(bcnt ==3){
									banstate = "영구정지";
								}else{
									if(banleave ==1){
										if(datechk== -1){
											banstate = "탈퇴예정";
										}else{
											banstate= "탈퇴완료";
										}
									}else if(banleave ==0){
										if(!banstop ){
											if(datechk == -1){
												banstate= "정 지 중";
											}else{
												banstate="일반회원";
											}
										}
										
									}
								}
									console.log(banstate);
									console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
									console.log(data.newList[i]);
									console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
							str+="<td>"+data.newList[i].nickName+"</td>";
							if(data.newList[i].intro==null){
								str+="<td>"+"자기소개가 없습니다."+"&nbsp</td>";
							}else {
								str+="<td class='intro' size='10em'>"+data.newList[i].intro+"</td>";

							}
							str+="<td><input type='button' class='btn btn-default' id='detail' onclick=detail('"+data.newList[i].id+"') value='정지내역'/>&nbsp</td>";
							str+="<td value='"+data.newList[i].id+"'>"+banstate+"&nbsp" ;
							if(banstate=="일반회원"){
								str+= " &nbsp<input type='button' style='background-color: #f0f2f4;' class='btn btn-default' id='ban' onclick=banPopupOpen('"+data.newList[i].id+"') value='정지'/>";
							}else if (banstate=="정 지 중"){
								str+= " &nbsp<input type='button' class='btn btn-default' id='remove' onclick=remove('"+data.newList[i].id+"') value='해제'/>";
							}
							str+="</td>";
							str+="</tr>";
					 	}
					 
				 	}else if($.isNumeric(data.newList[1])){	//리스트2개
						 for(i=2;i< data.newList.length;i++){
							// 밴 테이블에 있는 사람들 추출			
							bcnt=data.newList[i].bcnt;
							console.log("카운트 : "+bcnt);
							datechk=data.newList[i].datechk;
							console.log("날짜 비교값 : "+datechk);
							banleave=data.newList[i].ban_leave;
							
							if(!bcnt){
								banstate="일반회원";
							}else if(bcnt ==3){
								banstate = "영구정지";
							}else{
								if(banleave ==1){
									if(datechk== -1){
										banstate = "탈퇴예정";
									}else{
										banstate= "탈퇴완료";
									}
								}else if(banleave ==0){
									if(!banstop ){
										if(datechk == -1){
											banstate= "정 지 중";
										}else{
											banstate="일반회원";
										}
									}
								}
							}
								console.log(banstate);
								console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
								console.log(data.newList[i]);
								console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
						str+="<td>"+data.newList[i].nickName+"</td>";
						if(data.newList[i].intro==null){
							str+="<td>"+"자기소개가 없습니다."+"&nbsp</td>";
						}else {
							str+="<td class='intro' size='10em'>"+data.newList[i].intro+"</td>";
	
						}
						str+="<td><input type='button' class='btn btn-default' id='detail' onclick=detail('"+data.newList[i].id+"') value='정지내역'/>&nbsp</td>";
						str+="<td value='"+data.newList[i].id+"'>"+banstate+"&nbsp" ;
						if(banstate=="일반회원"){
							str+= " &nbsp<input type='button' style='background-color: #f0f2f4;' class='btn btn-default' id='ban' onclick=banPopupOpen('"+data.newList[i].id+"') value='정지'/>";
						}else if (banstate=="정 지 중"){
							str+= " &nbsp<input type='button' class='btn btn-default' id='remove' onclick=remove('"+data.newList[i].id+"') value='해제'/>";
						}
						str+="</td>";
						str+="</tr>";
					 }
						
				 }else if(!$.isNumeric(data.newList[1])){		//리스트 한개
					 for(i=1;i< data.newList.length;i++){
							bcnt=data.newList[i].bcnt;
							console.log("카운트 : "+bcnt);
							datechk=data.newList[i].datechk;
							console.log("날짜 비교값 : "+datechk);
							banleave=data.newList[i].ban_leave;
							
							if(!bcnt){
								banstate="일반회원";
							}else if(bcnt ==3){
								banstate = "영구정지";
							}else{
								if(banleave ==1){
									if(datechk== -1){
										banstate = "탈퇴예정";
									}else{
										banstate= "탈퇴완료";
									}
								}else if(banleave ==0){
									if(!banstop ){
										if(datechk == -1){
											banstate= "정 지 중";
										}else{
											banstate="일반회원";
										}
									}
									
								}
							}
								console.log(banstate);
								console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
								console.log(data.newList[i]);
								console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
						str+="<td>"+data.newList[i].nickName+"</td>";
						if(data.newList[i].intro==null){
							str+="<td>"+"자기소개가 없습니다."+"&nbsp</td>";
						}else {
							str+="<td class='intro' size='10em'>"+data.newList[i].intro+"</td>";

						}
						str+="<td><input type='button' class='btn btn-default' id='detail' onclick=detail('"+data.newList[i].id+"') value='정지내역'/>&nbsp</td>";
						str+="<td value='"+data.newList[i].id+"'>"+banstate+"&nbsp" ;
						if(banstate=="일반회원"){
							str+= " &nbsp<input type='button' style='background-color: #f0f2f4;' class='btn btn-default' id='ban' onclick=banPopupOpen('"+data.newList[i].id+"') value='정지'/>";
						}else if (banstate=="정 지 중"){
							str+= " &nbsp<input type='button' class='btn btn-default' id='remove' onclick=remove('"+data.newList[i].id+"') value='해제'/>";
						}
						str+="</td>";
						str+="</tr>";
				 	}
				 }
					$("#memTable").html(str);
			}, 
			error:function(e){
				alert("일반회원 리스트 가져오기에 실패하였습니다.");
				console.log(e);
			}
		});
	}	
	
	  //회원 검색 사전작업
	function searchChk(frm){
        var keyword = $("#keyword").val();
        var member_ban=$("#member_ban").val();
        if(keyword ==""){
        	keyword=null;
        }
        console.log("서치 사전작업");
        console.log(keyword);
       	console.log(member_ban);
        search(keyword, member_ban);      
    }
	
	  //회원검색
	function search(keyword, member_ban){		 
		$.ajax({
		type:"get",
		url:"aMemberSearch",
		data:{
			keyword : keyword,
			member_ban : member_ban
		},
		dataType:"JSON",
		success:function(data){
			console.log(data);
			console.log("값 받는거확인작업 : "+$("#member_ban").val());
			console.log("회원검색하기 아작스 성공")
			console.log(data.newList.length);
			console.log("--------------");
			console.log(!$.isNumeric(data.newList[1]));
			
			var mListStart =data.newList[0];
			console.log(mListStart);
			var str = "";
				 	str+="<tr><th>"+"닉네임"+"&nbsp</th>";
					str+="<th>"+"자기소개"+"&nbsp</th>";
					str+="<th>"+"정지내역"+"&nbsp</th>";
					str+="<th>"+"현재상태"+"&nbsp</th></tr>";
					str+="<tr>";
					
			 if($("#member_ban").val()=="normal"){				//일반회원
				 if(!$.isNumeric(data.newList[1])){		//리스트 하나에서만 받아옴
					 for(i=1;i< data.newList.length;i++){
						 	bcnt=data.newList[i].bcnt;
							console.log("카운트 : "+bcnt);
							datechk=data.newList[i].datechk;
							console.log("날짜 비교값 : "+datechk);
							banleave=data.newList[i].ban_leave;
							
							if(!bcnt){
								banstate="일반회원";
							}else if(bcnt ==3){
								banstate = "영구정지";
							}else{
								if(banleave ==1){
									if(datechk== -1){
										banstate = "탈퇴예정";
									}else{
										banstate= "탈퇴완료";
									}
								}else if(banleave ==0){
									if(!banstop ){
										if(datechk == -1){
											banstate= "정 지 중";
										}else{
											banstate="일반회원";
										}
									}
									
								}
							}
								console.log(banstate);
								console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
								console.log(data.newList[i]);
								console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
						str+="<td>"+data.newList[i].nickName+"</td>";
						if(data.newList[i].intro==null){
							str+="<td>"+"자기소개가 없습니다."+"&nbsp</td>";
						}else {
							str+="<td class='intro' size='10em'>"+data.newList[i].intro+"</td>";

						}
						str+="<td><input type='button' class='btn btn-default' id='detail' onclick=detail('"+data.newList[i].id+"') value='정지내역'/>&nbsp</td>";
						str+="<td value='"+data.newList[i].id+"'>"+banstate+"&nbsp" ;
						if(banstate=="일반회원"){
							str+= " &nbsp<input type='button' style='background-color: #f0f2f4;' class='btn btn-default' id='ban' onclick=banPopupOpen('"+data.newList[i].id+"') value='정지'/>";
						}else if (banstate=="정 지 중"){
							str+= " &nbsp<input type='button' class='btn btn-default' id='remove' onclick=remove('"+data.newList[i].id+"') value='해제'/>";
						}
						str+="</td>";
						str+="</tr>";
					 }
				 }else{		//리스트 2개에서 받아오는것을 의미
					 for(i=2;i< data.newList.length;i++){
							bcnt=data.newList[i].bcnt;
							console.log("카운트 : "+bcnt);
							datechk=data.newList[i].datechk;
							console.log("날짜 비교값 : "+datechk);
							banleave=data.newList[i].ban_leave;
							
							if(!bcnt){
								banstate="일반회원";
							}else if(bcnt ==3){
								banstate = "영구정지";
							}else{
								if(banleave ==1){
									if(datechk== -1){
										banstate = "탈퇴예정";
									}else{
										banstate= "탈퇴완료";
									}
								}else if(banleave ==0){
									if(!banstop ){
										if(datechk == -1){
											banstate= "정 지 중";
										}else{
											banstate="일반회원";
										}
									}
									
								}
							}
								console.log(banstate);
								console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
								console.log(data.newList[i]);
								console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
						str+="<td>"+data.newList[i].nickName+"</td>";
						if(data.newList[i].intro==null){
							str+="<td>"+"자기소개가 없습니다."+"&nbsp</td>";
						}else {
							str+="<td class='intro' size='10em'>"+data.newList[i].intro+"</td>";

						}
						str+="<td><input type='button' class='btn btn-default' id='detail' onclick=detail('"+data.newList[i].id+"') value='정지내역'/>&nbsp</td>";
						str+="<td value='"+data.newList[i].id+"'>"+banstate+"&nbsp" ;
						if(banstate=="일반회원"){
							str+= " &nbsp<input type='button' style='background-color: #f0f2f4;' class='btn btn-default' id='ban' onclick=banPopupOpen('"+data.newList[i].id+"') value='정지'/>";
						}else if (banstate=="정 지 중"){
							str+= " &nbsp<input type='button' class='btn btn-default' id='remove' onclick=remove('"+data.newList[i].id+"') value='해제'/>";
						}
						str+="</td>";
						str+="</tr>";
				 	}
				 
			 	}
			 
			 }else{		//탈퇴,정지 회원
				 for(i=1;i< data.newList.length;i++){
					// 밴 테이블에 있는 사람들 추출			
					bcnt=data.newList[i].bcnt;
					console.log("카운트 : "+bcnt);
					datechk=data.newList[i].datechk;
					console.log("날짜 비교값 : "+datechk);
					banleave=data.newList[i].ban_leave;
					
					if(!bcnt){
						banstate="일반회원";
					}else if(bcnt ==3){
						banstate = "영구정지";
					}else{
						if(banleave ==1){
							if(datechk== -1){
								banstate = "탈퇴예정";
							}else{
								banstate= "탈퇴완료";
							}
						}else if(banleave ==0){
							if(!banstop ){
								if(datechk == -1){
									banstate= "정 지 중";
								}else{
									banstate="일반회원";
								}
							}
							
						}
					}
						console.log(banstate);
						console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
						console.log(data.newList[i]);
						console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
				str+="<td>"+data.newList[i].nickName+"</td>";
				if(data.newList[i].intro==null){
					str+="<td>"+"자기소개가 없습니다."+"&nbsp</td>";
				}else {
					str+="<td class='intro' size='10em'>"+data.newList[i].intro+"</td>";

				}
				str+="<td><input type='button' class='btn btn-default' id='detail' onclick=detail('"+data.newList[i].id+"') value='정지내역'/>&nbsp</td>";
				str+="<td value='"+data.newList[i].id+"'>"+banstate+"&nbsp" ;
				if(banstate=="일반회원"){
					str+= " &nbsp<input type='button' style='background-color: #f0f2f4;' class='btn btn-default' id='ban' onclick=banPopupOpen('"+data.newList[i].id+"') value='정지'/>";
				}else if (banstate=="정 지 중"){
					str+= " &nbsp<input type='button' class='btn btn-default' id='remove' onclick=remove('"+data.newList[i].id+"') value='해제'/>";
				}
				str+="</td>";
				str+="</tr>";
			 }
			}
			 
			$("#memTable").html("");
			
			$("#memTable").html(str);
			 
		}, 
		error:function(e){
			alert("일반회원 검색에 실패하였습니다.");
			console.log(e);
		}
		
		});
		
	  }
	  

	//정지상태인애 해제하기
	function remove(aaa){	
		console.log("id받아오기"+aaa );
		$.ajax({
			type:"get",
			url:"aMemberRemove",
			data:{
				id : aaa,
			},
			dataType:"JSON",
			success:function(data){
				alert("작업 성공");
				window.location.reload();
		},
			error:function(e){
				alert("에러");
				console.log(e);
			}
		});
	}	 
	
	//회원정지 팝업
	function banPopupOpen(aaa){		
		var popUrl = "banPop?id="+aaa;	//팝업창에 출력될 페이지 URL => 컨트롤러 필요

		var popOption = "width=500, height=500, resizable=no, menubar=no, location=no, directories=no, scrollbars=no, status=no, toolbar=no;";    
		//팝업창 옵션(optoin)
		console.log("id받아오기 : "+aaa );
		window.open(popUrl,"",popOption);

		}

	//전체회원
	function allm(){
		console.log("전체보기");
		mainPrtint();
	}
	
	//정지내역 상세보기팝업
		function detail(aaa){		
			var popUrl = "aMemberBanDetail?id="+aaa;	//팝업창에 출력될 페이지 URL => 컨트롤러 필요
			var popOption = "width=600, height=500, resizable=no, menubar=no,location=no, directories=no, scrollbars=no, status=no, toolbar=no;";  
					//팝업창 옵션(optoin)
			console.log("id받아오기 : "+aaa );
			window.open(popUrl,"",popOption);

		}
		
	</script>
</html>