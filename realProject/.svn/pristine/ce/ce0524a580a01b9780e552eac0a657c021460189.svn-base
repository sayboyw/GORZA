<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
<title>기업 코디 등록</title>
<style>
textarea{
	resize : none;
	width: 20%;
}
.area {
    position: relative;
    text-align: center;
    font-size: 20px;
    left: 18%;
    border: 1px solid #8794A3;
    top: 10px;
    width: 63%;
}
.area4 {
    text-align: center;
    font-size: 19px;
    font-weight: 600;
    position: relative;
    width: 33%;
    transform: translateX(100%);
    border: 1px gray solid;
}
table {
    border: 20px solid #8794A3;
    left: 18%;
    height: 870px;
}
#cody_content{
    position: relative;
    left: 18%;
    width: 63%;
    border: 1px solid #8794A3;
    font-size: 16px;
    padding: 18px;
}
#btnArea{
    position: relative;
	transform: translateX(75%);
}
#category{
	text-align: center;
}
#color{
	text-align: center;
}
#brandList{
	position: relative;
    text-align: center;
}
table{
	position: relative;
    width: 42%;
	transform: translateX(25%);
}
#cloth{
    text-align: center;
    position: relative;
}
.colorVie{
	border: 3px solid white;
}
.area2{
   	left: 34%;
    position: relative;
}
#img_box{
   	text-align: center;
}
</style>
</head>
	<body>
		<jsp:include page="loginBox.jsp"></jsp:include>
	
<div id="admin">
	<form action="codyWrite" method="post" id="writeForm" enctype="multipart/form-data">
		<table>
			<tr>
				<td>
					<input id="cody_title" class="area" type="text" placeholder="제목을 입력해주세요" maxlength="30" name="b_title"><br/>
				</td>
			</tr>
			<tr>
				<td>
					<textarea id="cody_content" rows="5" name="b_content" class="area3" placeholder="내용을 입력해주세요"></textarea><br/>
				</td>
			</tr>
			<tr>
				<td>
					<div id="category">
						<input type="checkbox"  name= "br_sit" value="남친룩"/>
							<label for="category">남친룩</label>&nbsp;&nbsp;
						<input type="checkbox" name= "br_sit"  value="하객룩"/>
							<label for="category">하객룩</label>&nbsp;&nbsp;
						<input type="checkbox" name= "br_sit"  value="데일리룩"/>
							<label for="category">데일리룩</label>&nbsp;&nbsp;
						<input type="checkbox" name= "br_sit"  value="빈티지룩"/>
							<label for="category">빈티지룩</label>&nbsp;&nbsp;
						<input type="checkbox" name= "br_sit"  value="캐주얼룩"/>
							<label for="category">캐주얼룩</label>&nbsp;&nbsp;
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div  id="color">
						<img class="colorVie" src="./resources/images/흰색.png"  alt="흰색" name="br_color" onclick="aaa(this)" id="white"/>
						<img class="colorVie" src="./resources/images/검정.png"  alt="검은색" name="br_color" onclick="aaa(this)" id="black"/>
						<img class="colorVie" src="./resources/images/회색.png"  alt="회색" name="br_color" onclick="aaa(this)" id="gray"/>
						<img class="colorVie" src="./resources/images/갈색.png"  alt="갈색" name="br_color" onclick="aaa(this)" id="brown"/>
						<img class="colorVie" src="./resources/images/베이지.png"  alt="베이지색" name="br_color" onclick="aaa(this)" id="beige"/>
						<img class="colorVie" src="./resources/images/녹색.png"  alt="녹색" name="br_color" onclick="aaa(this)" id="green"/>
						<img class="colorVie" src="./resources/images/파랑.png"  alt="파랑색" name="br_color" onclick="aaa(this)" id="blue"/>
						<img class="colorVie" src="./resources/images/보라.png"  alt="보라색" name="br_color" onclick="aaa(this)" id="purple"/>
						<img class="colorVie" src="./resources/images/노랑.png"  alt="노랑색" name="br_color" onclick="aaa(this)" id="yellow"/>
						<img class="colorVie" src="./resources/images/핑크.png"  alt="분홍색" name="br_color" onclick="aaa(this)" id="pink"/>
						<img class="colorVie" src="./resources/images/빨강.png"  alt="빨강색" name="br_color" onclick="aaa(this)" id="red"/>
						<img class="colorVie" src="./resources/images/주황.png"  alt="주황색" name="br_color" onclick="aaa(this)" id="orange"/>
						<img class="colorVie" src="./resources/images/기타.png"  alt="기타" name="br_color" onclick="aaa(this)" id="etc"/>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<input type="hidden" id= "colorList" name="br_color"/>
					<div id="cloth">
						<input type="checkbox"  name= "br_divide" value="아우터"/>
							<label for="cloth">아우터</label>&nbsp;&nbsp;
						<input type="checkbox"  name= "br_divide" value="상의"/>
							<label for="cloth">상의</label>&nbsp;&nbsp;
						<input type="checkbox"  name= "br_divide" value="하의"/>
							<label for="cloth">하의</label>&nbsp;&nbsp;
						<input type="checkbox"  name= "br_divide" value="신발"/>
							<label for="cloth">신발</label>&nbsp;&nbsp;
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="brandList">
						
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<textarea id="hashtag" name="hashtag" class="area4" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" placeholder="해시태그를 입력해주세요"></textarea><br/>
				</td>
			</tr>
			<tr>
				<td>	
					<div> 
						<input id="file" name="file"  type="file" class="area2" placeholder="사진 등록" onchange="fileInfo(this)" accept=".jpg, .jpeg, .png"/>
						<input type="hidden" id="fileChk" name="fileChk" value="0">
						<div id="img_box">
							<img id="backImg">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="btnArea">
						<input class="btn btn-default" type="button" id="codyWrite" value="작성"/>
						<input class="btn btn-default" type="button" id="cancel" onclick="location.href='bListF?ca_num=0'" value="취소"/>
					</div>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
	<script>
		var colorArray= new Array() ;	//배열에 담을거
		var color;
		var colorList;
		var loc;
		var fileUpload;
		var str;
		
		$('#hashtag').keydown(function() {
		    if (event.keyCode === 13) {
		        event.preventDefault();
		    }
		});
		
		//색 가져오기
		function aaa(e){
			color=e.getAttribute("id");
			console.log("뽑아온 색 : "+color);
			if(colorArray.length ==0){
				e.setAttribute("style","border: 3px solid black;");
				colorArray.push(color);		//배열에 담기
			}else{
				if(jQuery.inArray(color,colorArray) == -1){		//color값의 배열에서의 위치 (배열에 값이 없으면 -1나옴);
					e.setAttribute("style","border: 3px solid black;");
					colorArray.push(color);		//배열에 담기
				}else{	//배열에 값이 있음 배열에 값 없애기
					e.setAttribute("style","border: 3px solid white;");
					loc =jQuery.inArray(color,colorArray);	
					colorArray.splice(loc,1);
				}
			}
			console.log("배열에 담은 컬러 : "+colorArray);
			colorList=colorArray.join();
			console.log("배열 값 합치기 : " +colorList);
			$("#colorList").val(colorList);
		}
		
		
		
		//유효성 체크
		$("#codyWrite").click(function(){
			console.log("ssss");
			if($("#cody_title").val() == ""){
				alert("제목을 입력하세요.");
			}else if($("#cody_content").val() == ""){
				alert("내용을 입력하세요.");
			}else if($("#fileChk").val() == 0){
				alert("첨부된 파일이 없습니다.");
			}else if($("input:checkbox[name=br_sit]").is(":checked") == false) {
				alert("스타일을 선택해주세요.");
			}else if($("input:checkbox[name=br_divide]").is(":checked") == false) {
				alert("옷 종류를 선택해주세요.");
			}else if($("input:radio[name=br_brand]").is(":checked") == false) {
				alert("브랜드를 선택해주세요.");
			}else if(colorArray.length ==0) {
				alert("색상을 선택해주세요.");
			}else{
				console.log("sdsdsds");
				$("#writeForm").submit();
			}
		});
		
		//공백체크
		function noSpaceForm(obj) { // 공백사용못하게
		    var str_space = /\s/;  // 공백체크
		    if(str_space.exec(obj.value)) { //공백 체크
		        obj.focus();
		        obj.value = obj.value.replace(' ',''); // 공백제거
		        return false;
		    }
		}
		
		//파일 유효성
		var fChk = 0;
		function fileInfo(f){
		   //getCmaFileView(f);
			if(f.value==""){
		        console.log("empty");
		        $("#fileChk").val(0);//파일 첨부 안함
		    }else{
		        console.log("unempty");
		        $("#fileChk").val(1);//파일 첨부 했음
		    }
			
		   var file = f.files; // files 를 사용하면 파일의 정보를 알 수 있음

		   var reader = new FileReader(); // FileReader 객체 사용
		   reader.onload = function(rst){ // 이미지를 선택후 로딩이 완료되면 실행될 부분
		      $('#img_box').html('<img  id="backImg" style=" background-image: none;" src="' + rst.target.result + '">');
		      // 이미지는 base64 문자열로 추가
		      // 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
		   }
		   reader.readAsDataURL(file[0]);
		}
		
		$(document).ready(function(){
			$.ajax({
				type:"get",
				url:"getList",
				data:{},
				dataType:"JSON",
				success:function(data){
					console.log(data);
					console.log("ajax 성공");
					str="";
					if(data.brandList.length!=0){
						 for(i=0;i<data.brandList.length;i++){
							str+="<input type='radio' name='br_brand' value='"+data.brandList[i].nickName+"'/>";
							str+="<label for='br_brand'>"+data.brandList[i].nickName+"</label>"+"&nbsp;&nbsp;&nbsp;";
							if(i>5){
								"<br/>";
							}
						}
					}else{
						str="제휴중인 회사가 없습니다";
					}
					console.log(str);
					$("#brandList").html(str);
				}, 
				error:function(e){
					alert("브랜드 리스트 가져오기 실패");
					console.log(e);
				}
			});
		}); 
		
	</script>
</html>