<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
<style>
<
style>
#closeButton {
	position: absolute;
	top: 15%;
	text-align: center;
	left: 90%;
}

#portfolio {
	padding-top: 0px;
}

#home {
	padding-bottom: 0px;
}
			.navbar-nav{
			float: none;
			}
</style>
</head>
<body>

	<div id="fol">
	<c:if test="${num==1}">
	<c:forEach var="flist" items="${flist}">
		<p><img style='height: 100%;  width:13%;' class='round' src="./resources/profile/${flist.sysName}">&nbsp;&nbsp;<a href="myStyle?nickName=${flist.nickName}">${flist.nickName}</a><button style="font-size: 12px; position: absolute; right: 5%;margin-top: 2%" class='btn btn-default' onclick='followCancle("${flist.nickName}","${sessionScope.mb.id }")'>팔로우 취소</button></p>
	</c:forEach>
	</c:if>
	<c:if test="${num==0 }">
	<c:forEach var="flist" items="${flist}">
		<p><img style='height: 100%;width: 13%;' class='round' src="./resources/profile/${flist.sysName}">&nbsp;&nbsp;<a href="myStyle?nickName=${flist.nickName}">${flist.nickName}</a>
		<c:if test="${flist.folfolChk==1}">
		<button style="font-size: 12px; position: absolute; right: 5%;margin-top: 2%" class='btn btn-default' onclick='followCancle("${flist.nickName}","${flist.id }")'>팔로우 취소</button>
		</c:if>
		<c:if test="${flist.folfolChk==0}">
		<button style="font-size: 12px; position: absolute; right: 5%;margin-top: 2%" class='btn btn-default' onclick='listFollow("${flist.nickName}","${flist.id }",3)'>+ 팔로우</button>
		</c:if>
		</p>
	</c:forEach>
	</c:if>
	</div>
	<div align="center" style="margin-bottom: 5px;height: 20px;" id="closeButton"></div>
	
</body>
<script>
	console.log("${flist}")
	 
	$("#closeButton").html("<a id='close' href='#'  class='btn btn-default' onclick='closePop()' >닫기</a>");
	
	function closePop(){
		$("#articleView_layer4").removeClass("open");
		window.location.reload();
	}
	
	var num = "${num}";
	console.log("넘넘넘 : "+num);
	var sessionId = "${sessionScope.mb.id}";
	
	function followCancle(nickName,id){//팔로우 취소하기
		console.log(nickName);
		$.ajax({
			type:"GET",
			url:"followCancle",
			data:{
				nickName: nickName,
				num:num,
				id:id
			},
			dataType:"JSON",
			success:function(data){
				var fol="";
				if(data.num==1){
					for(var i=0;i<data.flist.length;i++){
						fol += "<p><img style='height: 100%;  width:13%;' class='round' src='./resources/profile/"+data.flist[i].sysName+"'>&nbsp;&nbsp;<a href='myStyle?nickName="+data.flist[i].nickName+"'>"+data.flist[i].nickName+"</a><button style='font-size: 12px; position: absolute; right: 5%;margin-top: 2%' class='btn btn-default' onclick=followCancle('"+data.flist[i].nickName+","+sessionId+"')>팔로우 취소</button></p>"
					}
				}else{
					for(var i=0;i<data.flist.length;i++){
						fol += "<p><img style='height: 100%;  width:13%;' class='round' src='./resources/profile/"+data.flist[i].sysName+"'>&nbsp;&nbsp;<a href='myStyle?nickName="+data.flist[i].nickName+"'>"+data.flist[i].nickName;
						if(data.flist[i].folfolChk==1){
						fol += "</a><button style='font-size: 12px; position: absolute; right: 5%;margin-top: 2%' class='btn btn-default' onclick=followCancle('"+data.flist[i].nickName+"','"+data.flist[i].id+"')>";
						fol += "팔로우 취소</button></p>"
						}else{
							fol += "</a><button style='font-size: 12px; position: absolute; right: 5%;margin-top: 2%' class='btn btn-default' onclick=listFollow('"+data.flist[i].nickName+"','"+data.flist[i].id+"',3)>";
							fol += "+ 팔로우</button></p>"
						}
						
					}
				}
				
				$("#fol").html(fol);
			},
			error:function(e){
			}

		});
	}
		function listFollow(nickName,id,num){//+팔로우하기
			
			 $.ajax({
		         type : 'get',
		         url : 'follow',
		         data : {
		            id : id,
		            nickName : nickName,
		            num:num
		         },
		         dataType : 'JSON',
		         success : function(data) {
		        	 var fol="";
		        	 for(var i=0;i<data.flist.length;i++){
							fol += "<p><img style='height: 100%;  width:13%;' class='round' src='./resources/profile/"+data.flist[i].sysName+"'>&nbsp;&nbsp;<a href='myStyle?nickName="+data.flist[i].nickName+"'>"+data.flist[i].nickName;
							if(data.flist[i].folfolChk==1){
							fol += "</a><button style='font-size: 12px; position: absolute; right: 5%;margin-top: 2%' class='btn btn-default' onclick=followCancle('"+data.flist[i].nickName+"','"+data.flist[i].id+"')>";
							fol += "팔로우 취소</button></p>"
							}else{
								fol += "</a><button style='font-size: 12px; position: absolute; right: 5%;margin-top: 2%' class='btn btn-default' onclick=listFollow('"+data.flist[i].nickName+"','"+data.flist[i].id+"',3)>";
								fol += "+ 팔로우</button></p>"
							}
						}
		        	 $("#fol").html(fol);
		         },
		         error : function(e) {
		            console.log(e);
		         }
		      });
	}
</script>
</html>