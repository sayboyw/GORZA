<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<link rel="stylesheet" href="resources/css/font-awesome.min.css">
		
		<!-- Main css -->
		<link rel="stylesheet" href="resources/css/style.css">
		<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
		<title>관리자 - 기업관리페이지</title>
		<style>
			#div2 {
				margin: auto;
				border: 20px solid #8794A3;
				padding: 3%;
				width: 47%;
			}
			
			#memTable th {
				text-align: center;
			}
			
			#serch {
				padding: 0px 5px;
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
                <h3 style="text-align: center; font-size: 22px">기업관리</h3>
            </div>
		
		<jsp:useBean id="cMember" class="com.board.bean.C_member">
			<jsp:setProperty name="cMember" property="state" value="1" />
		</jsp:useBean>
		<!-- 	기업회원임을 의미 -->
		<div id="div2">
		<input type="hidden" id="memState" value=<%= cMember.getState()%> />
		
		<form>
			<div id="cMember_divide">
				<!-- 멤버분류 (기업회원) -->
				<select name="member_ban" id="member_ban">
					<option value="normal" selected="selected">일반기업</option>
					<option value="banned">정지기업</option>
				</select>
			</div>
			<div id="cMember_search">
				<!-- 기업회원검색 -->
				<input type="text" id="keyword" name="keyword"
					placeholder="닉네임으로 기업회원검색" /> <input type="button" style="height: 31px;position: relative;top: -3px;" id="serch" class="btn btn-default"
					onclick="searchChk(form)" value="검색">
			</div>
		</form>
		<input type="button" class="btn btn-default" onclick="allm()" value="전체기업회원보기">
		<table id="memTable" style="width: 100%;text-align: center;border: 1px solid #d1d1d1;">
			
		</table>
		</div>
		<jsp:include page="footer.jsp" />
	</body>
	<script>
		var banstate;
		var banleave;
		var banstart;
		 var str;
		 var intro;
		 var bcnt;
		 var datechk;
		 var i;
		 
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
			url:"aCMemberListF",
			data:{
				memState:$("#memState").val()
			},
			dataType:"JSON",
			success:function(data){
				console.log(data);
				console.log("기업회원리스트 불러오기");
				console.log(data.newList.length);
				console.log("--------------");
				
				var mListStart =data.newList[0];
				console.log("0번리스트의 사이즈 : " +mListStart);
					str="";
					str+="<tr style='text-align:center'><th>"+"기업명"+"&nbsp</th>";
					str+="<th>"+"이메일"+"&nbsp</th>";
					str+="<th>"+"상태"+"&nbsp</th>";
					str+="<th>"+"정지여부"+"&nbsp</th></tr>";
					str+="<tr>";
					if($.isNumeric(data.newList[1])){	//리스트가 2개옴
						for(var i = 2 ; i< data.newList.length;i++){
							// 밴 테이블에 있는 사람들 추출		
								banstart = new Date();
								banstart=data.newList[i].ban_start;
								console.log("정지시작 : "+banstart);
								bcnt = data.newList[i].bcnt;
								console.log("카운트 : "+bcnt);
								datechk=data.newList[i].datechk;
								console.log("날짜 비교값 : "+datechk);
					
								if(banstart == null){
									banstate="활 동 중";
								}else{
									if(datechk == -1){
										banstate= "정지 상태";
									}else{
										banstate="활 동 중 ";
									}
								}										
							
								console.log(banstate);
								console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
								console.log(data.newList[i].nickName);
								console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
								str+="<td>"+data.newList[i].nickName+"("+data.newList[i].c_name+")"+"</td>";
								str+="<td class='intro_email' size='10em'>"+data.newList[i].email+"</td>";
								str+="<td class='intro_state' size='10em'>"+banstate+"</td>";
								str+="<td>" ;
								if(banstate=="활 동 중"){
									str+= " &nbsp<input type='button' class='btn btn-default' style='background-color: #f0f2f4;' id='ban' onclick=banCom('"+data.newList[i].id+"') value='정지'/>";
								}else if (banstate=="정지 상태"){
									str+= " &nbsp<input type='button' class='btn btn-default' id='remove' onclick=banCancel('"+data.newList[i].id+"') value='해지'/>&nbsp";
									str+= " &nbsp<input type='button' class='btn btn-default' id='delete' onclick=recordDelete('"+data.newList[i].id+"') value='글삭제'/>";
								}
								str+="</td>";
								str+="</tr>";
						}
					}else {
					 	for(var i = 1 ; i< data.newList.length;i++){		//리스트1개
							console.log("카운트 : "+bcnt);
							datechk=data.newList[i].datechk;
							console.log("날짜 비교값 : "+datechk);

							if(banstart == null){
								banstate="활 동 중";
							}else{
								if(datechk == -1){
									banstate= "정지 상태";
								}else{
									banstate="활 동 중 ";
								}
							}										
						
							console.log(banstate);
							console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
							console.log(data.newList[i].nickName);
							console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
							str+="<td>"+data.newList[i].nickName+"("+data.newList[i].c_name+")"+"</td>";
							str+="<td class='intro_email' size='10em'>"+data.newList[i].email+"</td>";
							str+="<td class='intro_state' size='10em'>"+banstate+"</td>";
							str+="<td>" ;
							if(banstate=="활 동 중"){
								str+= " &nbsp<input type='button' class='btn btn-default' style='background-color: #f0f2f4;' id='ban' onclick=banCom('"+data.newList[i].id+"') value='정지'/>";
							}else if (banstate=="정지 상태"){
								str+= " &nbsp<input type='button' class='btn btn-default' id='remove' onclick=banCancel('"+data.newList[i].id+"') value='해지'/>&nbsp";
								str+= " &nbsp<input type='button' class='btn btn-default' id='delete' onclick=recordDelete('"+data.newList[i].id+"') value='글삭제'/>";
							}
							str+="</td>";
							str+="</tr>";
						}
					}
					$("#memTable").html(str);
			}, 
			error:function(e){
				alert("회원리스트를 가져오는데 실패하였습니다.");
				console.log(e);
			}
		});
	}	
	//기업회원 영구정지
	function banCom(aaa){
		$.ajax({
			type:"get",
			url:"aCMemberBan",
			data:{
				id : aaa,
			},
			dataType:"JSON",
			success:function(data){
				if(data.result==1){
					alert("기업회원 정지에 성공하였습니다.");
					window.location.reload();
				}
		},
			error:function(e){
				alert("기업회원 정지에 실패하였습니다.");
				console.log(e);
			} 
		});
	}
	//기업회원 정지해지
	function banCancel(aaa){
		$.ajax({
			type:"get",
			url:"aCMemberCancel",
			data:{
				id : aaa,
			},
			dataType:"JSON",
			success:function(data){
				if(data.result==1){
					alert("기업회원 정지해지에 성공하였습니다.");
					window.location.reload();
				}
		},
			error:function(e){
				alert("기업회원 정지해지에 실패하였습니다.");
				console.log(e);
			}
		});
	}
	
	//기업 글삭제
	function recordDelete(aaa){
		$.ajax({
			type:"get",
			url:"recordDelete",
			data:{
				id : aaa,
			},
			dataType:"JSON",
			success:function(data){
			alert("기업회원 글삭제 성공");
			window.location.reload();
		},
			error:function(e){
				alert("에러");
				console.log(e);
			}
		});
	}
	
	//전체기업회원
	function allm(){
		console.log("전체보기");
		mainPrtint();
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
		var str ="";
		$.ajax({
			type:"get",
			url:"aCMemberSearch",
			data:{
				keyword : keyword,
				member_ban : member_ban
			},
			dataType:"JSON",
			success:function(data){
				console.log(data);
				console.log("기업회원리스트 불러오기");
				console.log(data.newList.length);
				console.log("--------------");
				
				var mListStart =data.newList[0];
				console.log("0번리스트의 사이즈 : " +mListStart);
					str="";
					str+="<tr style='text-align:center'><th>"+"기업명"+"&nbsp</th>";
					str+="<th>"+"이메일"+"&nbsp</th>";
					str+="<th>"+"상태"+"&nbsp</th>";
					str+="<th>"+"정지여부"+"&nbsp</th></tr>";
					str+="<tr>";
					
					if($("#member_ban").val()=="normal"){	
						if($.isNumeric(data.newList[1])){	//리스트가 2개옴
							for(var i = 2 ; i< data.newList.length;i++){
								// 밴 테이블에 있는 사람들 추출		
									banstart = new Date();
									banstart=data.newList[i].ban_start;
									console.log("정지시작 : "+banstart);
									bcnt = data.newList[i].bcnt;
									console.log("카운트 : "+bcnt);
									datechk=data.newList[i].datechk;
									console.log("날짜 비교값 : "+datechk);
		
									if(banstart == null){
										banstate="활 동 중";
									}else{
										if(datechk == -1){
											banstate= "정지 상태";
										}else{
											banstate="활 동 중 ";
										}
									}										
								
									console.log(banstate);
									console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
									console.log(data.newList[i].nickName);
									console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
									str+="<td>"+data.newList[i].nickName+"("+data.newList[i].c_name+")"+"</td>";
									str+="<td class='intro_email' size='10em'>"+data.newList[i].email+"</td>";
									str+="<td class='intro_state' size='10em'>"+banstate+"</td>";
									str+="<td>" ;
									if(banstate=="활 동 중"){
										str+= " &nbsp<input type='button' class='btn btn-default' style='background-color: #f0f2f4;' id='ban' onclick=banCom('"+data.newList[i].id+"') value='정지'/>";
									}else if (banstate=="정지 상태"){
										str+= " <input type='button' class='btn btn-default' id='remove' onclick=banCancel('"+data.newList[i].id+"') value='해지'/>";
										str+= " &nbsp<input type='button' class='btn btn-default' id='delete' onclick=recordDelete('"+data.newList[i].id+"') value='글삭제'/>";
									}
									str+="</td>";
									str+="</tr>";
							}
						}else{		//노멀인데 리스트 1개
							for(var i = 1 ; i< data.newList.length;i++){		//리스트1개
								console.log("카운트 : "+bcnt);
								datechk=data.newList[i].datechk;
								console.log("날짜 비교값 : "+datechk);

								if(banstart == null){
									banstate="활 동 중";
								}else{
									if(datechk == -1){
										banstate= "정지 상태";
									}else{
										banstate="활 동 중 ";
									}
								}										
							
								console.log(banstate);
								console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
								console.log(data.newList[i].nickName);
								console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
								str+="<td>"+data.newList[i].nickName+"("+data.newList[i].c_name+")"+"</td>";
								str+="<td class='intro_email' size='10em'>"+data.newList[i].email+"</td>";
								str+="<td class='intro_state' size='10em'>"+banstate+"</td>";
								str+="<td>" ;
								if(banstate=="활 동 중"){
									str+= " &nbsp<input type='button' class='btn btn-default' style='background-color: #f0f2f4;' id='ban' onclick=banCom('"+data.newList[i].id+"') value='정지'/>";
								}else if (banstate=="정지 상태"){
									str+= " <input type='button' class='btn btn-default' id='remove' onclick=banCancel('"+data.newList[i].id+"') value='해지'/>";
									str+= " &nbsp<input type='button' class='btn btn-default' id='delete' onclick=recordDelete('"+data.newList[i].id+"') value='글삭제'/>";
								}
								str+="</td>";
								str+="</tr>";
							}
						}
					}else {		//밴 멤버 검색
					 	for(var i = 1 ; i< data.newList.length;i++){		//리스트1개
							console.log("카운트 : "+bcnt);
							datechk=data.newList[i].datechk;
							console.log("날짜 비교값 : "+datechk);

							if(banstart == null){
								banstate="활 동 중";
							}else{
								if(datechk == -1){
									banstate= "정지 상태";
								}else{
									banstate="활 동 중 ";
								}
							}										
						
							console.log(banstate);
							console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
							console.log(data.newList[i].nickName);
							console.log("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
							str+="<td>"+data.newList[i].nickName+"("+data.newList[i].c_name+")"+"</td>";
							str+="<td class='intro_email' size='10em'>"+data.newList[i].email+"</td>";
							str+="<td class='intro_state' size='10em'>"+banstate+"</td>";
							str+="<td>" ;
							if(banstate=="활 동 중"){
								str+= " &nbsp<input type='button' class='btn btn-default' style='background-color: #f0f2f4;' id='ban' onclick=banCom('"+data.newList[i].id+"') value='정지'/>";
							}else if (banstate=="정지 상태"){
								str+= " <input type='button' class='btn btn-default' id='remove' onclick=banCancel('"+data.newList[i].id+"') value='해지'/>";
								str+= " &nbsp<input type='button' class='btn btn-default' id='delete' onclick=recordDelete('"+data.newList[i].id+"') value='글삭제'/>";
							}
							str+="</td>";
							str+="</tr>";
						}
					}
					$("#memTable").html(str);
			}, 
			error:function(e){
				alert("회원검색에 실패하였습니다.");
				console.log(e);
			}
		});
	}
	
	</script>
</html>