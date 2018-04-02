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
      <title>배너리스트 보기 페이지</title>
<style>
#button {
    position: relative;
    top: 68px;
    left: -5%;
    padding: 12px;
}

.image {
	width: 100%;
	height: 40%;
}


#adiv {
	border: 20px solid #8794A3;
    padding: 3%;
}

.selectreason {
	border: 1px solid #BDBDBD;
    border-radius: 10px;
    padding: 11px;
    width: 44%;
    position: relative;
    top: -60px;
    left: -2%;
    margin: 4px;
    -webkit-appearance: none;
	-moz-appearance: none;
	background: url("./resources/images/arrowDown.jpg") no-repeat 95% 50%;
}
select{
	cursor: pointer;
}
</style>
</head>
   <body>
<div id="adiv">
   	<table>
   		<tr>
   			<td>
		      <div id="button">
		         <input type=button class="btn btn-default" onclick="submit()" value="등록">
		         <input type=button class='btn btn-default' onclick='banerDel()' value='삭제'>
		         <button class="btn btn-default" onclick="chkAll()">모두 선택</button>
		         <button class="btn btn-default" onclick="chkNone()">선택 해제</button>
		      </div>
		      <br/>
	     	</td>
		</tr>
		<tr>
			<td>
				<div>
		         	<select  class="selectreason" id='sel' name='sOption' onchange="sOption()">
		                  <option value="wait" selected>대기중</option>
		                  <option value="ing" >진행중</option>
		                  <option value="future" >진행예정</option>
		                  <option value="end" >종료</option>
		            </select>
		       	 </div>
		    </td>
		</tr>
	</table>
 	<form name="bannerForm" action="bannerConduct" id="bannerConduct"  method="get">
		<table>
			<tr>
				<td>
	      			<div id= "bannerForm"></div>
				</td>
			</tr>
		</table>
 	</form>
</div>
   </body>
   <script>
		//배너신청한 리스트 가져오기
		function sOption(){ //상태 선택하기
			console.log($('#sel').val());
			$.ajax({
				type:"get",
				url:"aBannerState",
				data:{
					select : $('#sel').val()
				},
				dataType:"JSON",
				success:function(data){
					console.log(data);
					if(data.bannerList.length!=0){
						var str='';
						$("#button").css('display','block');
							var ctx ="";
							if(data.select == 'ing' || data.select == 'future'){
								ctx += "<input type=button class='btn btn-default' onclick='banerDel()' value='내리기'>";								
							}else if(data.select == 'end'){
								ctx += "<input type=button class='btn btn-default' onclick='banerDel()' value='삭제'>";
							}else{
								ctx += "<input type=button class='btn btn-default' onclick='submit()' value='등록'>";
								ctx += "<input type=button class='btn btn-default' onclick='banerDel()' value='삭제'>";
							}
							
							if(data.select == 'wait'){
								for(i=0;i<data.bannerList.length;i++){
									str+="<input type='checkbox' name='choice' value='"+data.bannerList[i].ba_num+"'/>";
									str +="<input type='hidden' name='choose' value='"+data.bannerList[i].b_num+"'>";
									str+="제목 : "+data.bannerList[i].b_title+"<br/>";
									str+="시작일 : "+data.bannerList[i].ba_start+" 종료일 : "+data.bannerList[i].ba_stop+"<br/>";
									str+="<div class='image'><img  alt='bannerFile' style='position:relative;width:100%;height:100%' src='"+data.bannerList[i].ap_path+"'/></div><br/>";
								}
							}else{
								for(i=0;i<data.bannerList.length;i++){
									str+="<input type='checkbox' name='choice' value='"+data.bannerList[i].ba_num+"'/>";
									str +="<input type='hidden' name='choose' value='"+data.bannerList[i].b_num+"'>";
									str+="제목 : "+data.bannerList[i].b_title+"<br/>";
									str+="시작일 : "+data.bannerList[i].ba_start+" 종료일 : "+data.bannerList[i].ba_stop+"<br/>";
									str+="<div class='image'><img  alt='bannerFile' style='position:relative;width:100%;height:100%' src='"+data.bannerList[i].ap_path+"'/></div><br/>";
								}
							}
							
							
							ctx += "<button class='btn btn-default' onclick='chkAll()'>모두 선택</button>";
							ctx += "<button class='btn btn-default' onclick='chkNone()'>선택 해제</button>";
							$("#button").html(ctx);				
	
					}else{
						str="글이 없습니다.";
					}
					
					$("#bannerForm").html(str);
				}, 
				error:function(e){
					alert("신청받은 배너리스트들을 가져오기에 실패했습니다.");
					console.log(e);
				}
			});
			
		}
		
		function banerDel(){
			if($("input[name='choice']").is(":checked")){
				if(confirm("삭제하시겠습니까?") == true){
					$("#bannerConduct").attr("action","bannerDel");
					console.log("서브밋하기");
					$("#bannerConduct").submit();	//서브밋 하기
				}
			}else{
				alert("배너를 선택해 주세요");
				return false
			}
			return true;
		}
		
		var i=0;
		
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

      $(document).ready(function(){//대기중 
         $.ajax({
            type:"get",
            url:"aBannerList",
            data:{},
            dataType:"JSON",
            success:function(data){
               console.log(data);
               console.log(data.bannerList.length);
               console.log("이미지 주소 : " +data.bannerList[i].ap_path);
               console.log("ajax 성공");
               if(data.bannerList.length!=0){
                  var str='';
                  for(i=0;i<data.bannerList.length;i++){
                     str+="<input type='checkbox' name='choice' value='"+data.bannerList[i].ba_num+"'/>";
                     str +="<input type='hidden' name='choose' value='"+data.bannerList[i].b_num+"'>";
                     str+="제목 : "+data.bannerList[i].b_title+"<br/>";
                     str+="시작일 : "+data.bannerList[i].ba_start+" 종료일 : "+data.bannerList[i].ba_stop+"<br/>";
                     str+="<div class='image'><img  alt='bannerFile' style='position:relative;width:100%;height:100%' src='"+data.bannerList[i].ap_path+"'/></div><br/>";
                  }
                  
               }else{
                  str="배너 신청이 없습니다";
                  $("button").css("display","none");
                  $("input:button").css("display","none");
               }
               $("#bannerForm").html(str);
            }, 
            error:function(e){
               alert("에러");
               console.log(e);
            }
         });
      }); 
      
      //전송하기
      function submit(){
    	 
         if($("input[name='choice']").is(":checked")){
        	 if(confirm("등록 하시겠습니까?") == true){
            $("#bannerConduct").attr("action","bannerConduct");
            console.log("서브밋하기");
            $("#bannerConduct").submit();   //서브밋 하기
        	 }
         }else{
            alert("배너를 선택해 주세요");
            return false
         }
         return true;
      }
      //모두 선택
      function chkAll(){
         console.log("전체선택하기");
         $('input:checkbox').attr('checked',true);
          $('input:checkbox').prop('checked',true);
         
      }

      //선택 해제
      function chkNone(){
             console.log("선택해제하기");
             $('input:checkbox').removeAttr('checked');
             $('input:checkbox').prop('checked',false);
             
      }

      
   </script>
</html>