<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
<style>
.area {
    margin: 5px 5px;
    border: 3px solid #8794A3;
    padding: 5px 5px;
    text-align: center;
    width: 99%;
    color: #585858;
    font-size: 24px;
}

#writeFarea {
    margin: auto;
    border: 20px solid #8794A3;
    padding: 20px;
    width: 73%;
    height: 50%;
    margin-top: 20px;
    margin-bottom: 100px;
}

#hashtag {
	height: 8%;
	word-spacing: inherit;
}

#b_title {
	margin-top: 3%;
}

#btnArea {
    float: right;
    position: relative;
    top: 38px;
}
.area2 {
    font-size: 17px;
}
.area4 {
    padding: 5PX;
    font-weight: 600;
    font-size: 20px;
    margin: 10px;
    text-align: center;
}
.area3 {
    border: 3px solid #8794A3;
    color: #585858;
    font-size: 18px;
    padding: 10px;
    width: 100%;
}
.car {
    color: #777;
    font-size: 22px;
    font-weight: 600;
    line-height: 38px;
    position: relative;
    letter-spacing: 1.2px;
    transform: translateY(36%);
    text-align: center;
}
</style>
</head>
<body>
<fieldset id="writeFarea">
	<input id="cd_title" readonly class="area" type="text" value="${coordiSend.cd_title }" name="cd_title"><br/>
	
	<div id="checkArea" class = "area2" >
	<p class="car">카테고리</p>
	<div class="area4">
		<span class="boxCate" ><input class="sitChek"  type="checkbox" name="cd_sitAll" value="남친룩" />남친룩</span>
		<span class="boxCate" ><input class="sitChek"  type="checkbox" name="cd_sitAll" value="하객룩" />하객룩</span>
		<span class="boxCate" ><input class="sitChek"  type="checkbox" name="cd_sitAll" value="데일리룩" />데일리룩</span>
		<span class="boxCate" ><input class="sitChek"  type="checkbox" name="cd_sitAll" value="빈티지룩" />빈티지룩</span>
		<span class="boxCate" ><input class="sitChek"  type="checkbox" name="cd_sitAll" value="캐주얼룩" />캐주얼룩</span>
	</div>
	</div>
	
	<textarea id="cd_content"  name="cd_content" class="area3" readonly>${coordiSend.cd_content}</textarea><br/>
	    
	<br/>
	<div class="area2">
	<c:forEach var="coordiList" items="${coordiList }">
	<a href="coordiDown?oriName=${coordiList.oriName}&sysName=${coordiList.sysName}"><b class = "area2">첨부파일 : ${coordiList.oriName}</b></a><br/>
	</c:forEach>
	</div>
	
	<div id="btnArea">
	<input class="btn btn-default" type="button" id="bWrite" onclick="link(3)" value="목록"/>
	</div>
</fieldset>
<div></div>
</body>
<script>

var cd_sit = "${coordiSend.cd_sit}";

var cls = cd_sit.split("/");
console.log(cls);

var car = $("input[type='checkbox']");
console.log(car);

for(var i=1;i<cls.length;i++){
	for(var j=0;j<car.length;j++){
		if(cls[i]==car[j].value){
			car[j].checked = true;
		}
	}
}

</script>
</html>