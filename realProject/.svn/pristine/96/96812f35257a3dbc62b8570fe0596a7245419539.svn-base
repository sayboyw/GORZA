<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/font-awesome.min.css">
	
	<!-- Main css -->
	<link rel="stylesheet" href="resources/css/style.css">
	<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
	<style>
		#area{
			border: 20px solid #8794A3;
		}
	</style>
</head>
<body id="area" style="overflow: hidden;">
	<h3 style="font-size: 20px;">&nbsp;&nbsp;&nbsp;신고함</h3><div style="position: absolute;right: 6%;margin-top: 8px"></div>
	<table style="margin: 0px" class="table table-hover">
	<tr style="width: 100%;">
	<th style="text-align: center; width: 20%;">닉네임</th>
	<th style="text-align: center; width: 25%;">제보항목</th>
	<th style="text-align: center; width: 23%;">제보일자</th>
	<th style="width: 35%; text-align: center;"><button class="btn btn-default"  id="allChk" onclick="allChk()" value="0">전체선택</button>&nbsp;&nbsp;<button class="btn btn-default" onclick="reportDel()">삭제</button></th>
	</tr>
	</table>
	<div style="overflow: scroll;height: 100%">
	<table id="reportList" class="table table-hover"></table>
	</div>
</body>
<script>
	$(document).ready(function(){
		aReportList();
	});
	
	function aReportList(){//신고함 리스트 보기
		$.ajax({
			type:'get',
			url:'aReportList',
			data:{	},
			dataType:'JSON',
			success:function(data){
				console.log(data.reportList);
				var length = data.reportList.length;
				var ctx = "";
				for(var i = 0 ; i<length;i++){
				ctx +="<tr style='width:100%;' class='table-active'>";
				ctx +="<td style='width:20%; text-align:center;'><a href='javascript:' onclick=aReportRecord('"+data.reportList[i].rp_oid+"')>"+data.reportList[i].rp_oid+"</a></td>";
				ctx +="<td style='width:25%; text-align:center;'><a href='javascript:' onclick='aReportDetail("+data.reportList[i].b_num+")'>"+data.reportList[i].rp_reason+"</a></td>";
				ctx +="<td style='width:25%; text-align:center;'>"+data.reportList[i].rp_date+"</td>";
				ctx +="<td style='width:30%; text-align:center;'><input type='checkbox' name='del' value='"+data.reportList[i].b_num+"' /></td>";
				ctx +="</tr>";
			}
				$("#reportList").html(ctx);				
			},
			error:function(e){
				alert("신고 리스트보기에 실패하였습니다.");
				console.log(e);
			}
		});
	}
	
	function reportDel(){ //삭제 기능
		var checked = [];
		$("input[type='checkbox']").each(function(){
            if($(this).is(":checked")){
                checked.push($(this).val());
            }
        });
		
		$.ajax({
            type:"post",
            url:"reportDel",
            data:{
                delValue:checked
            },
            dataType:"json",
            success:function(data){
            	var length = data.reportList.length;
				var ctx = "";
				for(var i = 0 ; i<length;i++){
				ctx +="<tr class='table-active'>";
				ctx +="<td><a href='javascript:' onclick=aReportRecord('"+data.reportList[i].rp_oid+"')>"+data.reportList[i].rp_oid+"</a></td>";
				ctx +="<td><a href='javascript:' onclick='aReportDetail("+data.reportList[i].b_num+")'>"+data.reportList[i].rp_reason+"</a></td>";
				ctx +="<td>"+data.reportList[i].rp_date+"</td>";
				ctx +="<td><input type='checkbox' name='del' value='"+data.reportList[i].b_num+"' /></td>";
				ctx +="</tr>";
			}
				$("#reportList").html(ctx);				
            },
            error:function(error){
            	alert("신고내역 삭제에 실패하였습니다.");
            	}
            });
            
	}
	
	function allChk(){//일괄 선택/해제
		console.log("일괄 선택");
		if($("#allChk").val()==0){
			$("#allChk").val("1");
			$('input:checkbox').attr('checked',true);
		    $('input:checkbox').prop('checked',true);
		    $("#allChk").html("선택해제");
		}else{
			$("#allChk").val("0");
			$('input:checkbox').removeAttr('checked');
	       	$('input:checkbox').prop('checked',false);
	        $("#allChk").html("전체선택");
		}
	}
	
	function aReportRecord(rp_oid){//해당 사람의 신고 내역
		location.href="aReportRecord?rp_oid="+rp_oid;
	}
	
	function aReportDetail(b_num){//신고 내역 상세보기
		location.href="aReportDetail?b_num="+b_num;
	}
	
	$(document).keyup(function(e){//esc 종료
		if(e.keyCode == 27){
			$("#articleView_layer10").removeClass('open10');
		}
	});
</script>
</html>