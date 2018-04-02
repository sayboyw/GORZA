<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
		<title>코디 리스트</title>
		
		
		
<style>
table tr th {
    text-align: center;
    font-size: 22px;
}
table tr td {
    font-size: 17px;
    font-weight: 300;
    text-align: center;
}	
table {
    margin: auto;
    border: 20px solid #8794A3;
    position: relative;
    height: 18%;
    margin-top: 20px;
}
#subject {
	display: none;
}
</style>




	</head>
	<body>
		<div id="codyArea" style="width: 100%">
			<table id="codyListArea" style="width: 100%;text-align: center;">
				
			</table>
		</div>
	</body>
	<script>
	
		$(document).ready(function(){
			$.ajax({
				type:"get",
				url:"aComCodyList",
				data:{},
				dataType:"JSON",
				success:function(data){
					codyListMethod(data.codyList);
				},
				error:function(e){
					console.log(e);
				}
			});
		});
		
		//코디 리스트 뽑아오기
		function codyListMethod(codyList){
			console.log(codyList);
			var codyLength = codyList.length;
			
			var codyCtx = "<tr><th>읽음</th><th>제목</th><th>기업명</th><th>작성날짜</th></tr>";
			
			for(var i = 0 ; i<codyLength;i++){
				codyCtx +="<tr>";
				if(codyList[i].cd_read==0){
					codyCtx +="<td><input type='checkbox' name='codyRead'></td>";	
				}else{
					codyCtx +="<td><input type='checkbox' name='codyRead' checked></td>";
				}
				codyCtx +="<td><a href='#' onclick='aComCodyDetail("+codyList[i].cd_num+")'>"+codyList[i].cd_title+"</a></td>";
				codyCtx +="<td>"+codyList[i].nickName+"</td>";
				codyCtx +="<td>"+codyList[i].cd_date+"</td>";
				codyCtx +="</tr>";
			}
			$("#codyListArea").append(codyCtx);
		}
	
		//코디 상세보기
		function aComCodyDetail(cd_num){
			console.log("cd_num : "+cd_num);
			
			$.ajax({
				type:"post",
				url:"aComCodyDetail",
				data:{
					cd_num : cd_num
				},
				dataType:"html",
				success:function(data){
					$("#area").html(data);
				},
				error:function(e){
					alert("코디글 상세보기에 실패하였습니다.");
					console.log(e);
				}
			});
			
		}
		
		
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
		
	</script>
</html>