<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
						   <script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
   <script src="resources/js/jquery.form.js"></script>
   <link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
		<title>제휴 신청 리스트</title>
<style>
table tr th {
    text-align: center;
    border-bottom: 3px black solid;
    padding: 25px;
    font-size: 20px;
}
table tr td {
    padding: 15px;
    font-size: 18px;
    font-weight: 300;
    text-align: center;
}
table {
    margin: auto;
    border: 20px solid #8794A3;
    position: relative;
    margin-top: 20px;
}
#subject {
	display: none;
}
</style>
</head>
	<body>
		<div id="reqContainer">
				<table id="reqList">
					
				</table>
		</div>
	</body>
	<script>
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
		
		
		
		//제휴신청한 회사 리스트 가져오기
		$(document).ready(function(){
			$.ajax({
				type:"get",
				url:"aAllianceList",
				data:{},
				dataType:"JSON",
				success:function(data){
					console.log(data);
					console.log(data.reqlist.length);
					console.log("ajax 성공");
					if(data.reqlist.length!=0){
						$("#subject").css("display","block");
						var str='';
						
						str+="<tr><th>법인명</th><th>기업명</th><th>사업자 등록번호</th><th>이메일</th><th>승인/거절</th></tr>";
						
						for(i=0;i<data.reqlist.length;i++){
							str+="<tr>";
							str+="<td><input type='hidden' size='0' name='id' value='"+data.reqlist[i].id+"'/>"+data.reqlist[i].c_name+"</td>";
							str+="<td>"+data.reqlist[i].brand+"</td>";
							str+="<td>"+data.reqlist[i].c_num+"</td>";
							str+="<td>"+data.reqlist[i].c_email+"</td>";
							str+="<td><input type='button' class='btn btn-default' name='divide' onclick=process('"+data.reqlist[i].id+"',1) value='승인'/>";
							str+="<input type='button' class='btn btn-default' name='divide' onclick=process('"+data.reqlist[i].id+"',0) value='거절'></td>";
							str+="</tr>";
						}
						
						str+="<tr id='subject'></tr>"	
						
					}else{	
						$("#reqContainer").html("제휴 신청이 없습니다");
					}
					$("#reqList").append(str); 
				}, 
				error:function(e){
					alert("제휴신청한 회사의 리스트를 가져오는데 실패했습니다.");
					console.log(e);
				}
			});
		}); 
		
		function process(id,divide){
			console.log(id+"//"+divide);
			location.href="comReqUpdate?id="+id+"&divide="+divide;
		}
	</script>
</html>