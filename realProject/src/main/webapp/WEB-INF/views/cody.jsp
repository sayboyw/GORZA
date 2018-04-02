<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<link
   href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700"
   rel="stylesheet">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700">

<style>
#sideManu li {
	background-color: white;
	padding: 7px;
	list-style: none;
	border: 5px solid #e5e5e5;
	width: 70%;
	font-size: 18px;
	margin-bottom: 20px;
	border-radius: 20px;
}

#sideManu li:hover {
	margin-bottom: 20px;
    padding: 7px;
    border: 5px solid #e5e5e5;
    background-color: #e5e5e5;
    width: 70%;
    font-size: 18px;
    border-radius: 20px;
}

.sitChek {
	width: 20px;
	height: 20px;
}

.boxCate {
	font-size: 20px;
}

#findArea {
    text-align: center;
    padding: 10px;
    position: relative;
    left: 10%;
    height: 6%;
    font-size: 16px;
}

#brandarticleView_layer {
	display: none;
	position: fixed;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

.col-md-4 {
	margin-top: 40px;
}

#likeNew {
	width: 200px;
	height: 30px;
	margin: auto;
}

#logo {
	width: 35%;
}

#menubar1 {
	margin: auto;
	width: 100%;
	height: 7%;
}

.round {
	border-radius: 50%;
	height: 6%;
	background-size: 100% 100%;
}

#detailChk {
	cursor: pointer;
}

#brandarticleView_layer.open {
	display: block;
	color: red
}

#brandArticleView_layer #brand_bg_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 5000px;
	background: #000;
	opacity: .7;
	filter: alpha(opacity = 90);
	z-index: 9990;
}

#bcontents_layer {
	position: fixed;
	top: 30%;
	left: 27%;
	max-width: 1000px;
	width: 910px;
	height: 600px;
	margin: auto;
	background: #fff;
	font-size: 12px;
	z-index: 9999;
	color: #767676;
	line-height: normal;
	white-space: normal;
	overflow: hidden;
}

.navbar-nav {
	float: none;
}

#portfolio .portfolio-thumb {
	margin-top: 10px;
}

.br_brand_li {
	list-style: none;
}

.colorfind li {
	float: left;
	list-style: none;
	margin-right: 5px;
}



#brsit {
	transform: translate(-10%, 10%);
	max-height: 50%;
}

.center {
	position: relative;
	top: 0px;
	float: left;
	left: 24%;
	width: 64%;
}

.select {
	float: left;
	margin-right: 1px;
}

.color_tooltip {
	position: absolute;
	top: -35px;
	margin-left: 15;
}

.tooltip_pointer {
	margin-left: 10;
}

.tooltip_text {
	z-index: 10;
	background-color: white;
}

</style>
</head>
<body>
   <jsp:include page="loginBox.jsp" />

   <!-- 인기게시글 영역 -->
   <!-- 코디등록버튼 -->


   <div id="brsit"
      style="float: left; width: 17%; height: 100%; margin-left: 8%; position: absolute; z-index: 10">
      <ul id="sideManu" class="sit_li"
         style="margin-top: 10%; margin-right: 30%; text-align: center;">
         <li class="select" onclick="toggle(this)">
            <div style="display: none;">
               <div>기타</div>
               <div>
                  <img src="" alt="" />
               </div>
            </div> <span> <input type="radio" class="br_sit" data-label="남친룩"
               name="br_sit" id="br_sit1" value="남친룩" style="cursor: pointer;" />
               <label for="br_sit1"><span style="cursor: pointer;">남친룩</span></label>
         </span>
         </li>
         <br />
         <li class="select" onclick="toggle(this)">
            <div style="display: none;">
               <div>기타</div>
               <div>
                  <img src="" alt="" />
               </div>
            </div> <span> <input type="radio" class="br_sit" data-label="하객룩"
               name="br_sit" id="br_sit2" value="하객룩" style="cursor: pointer;" />
               <label for="br_sit2"><span style="cursor: pointer;">하객룩</span></label>
         </span>
         </li>
         <br />
         <li class="select" onclick="toggle(this)">
            <div style="display: none;">
               <div>기타</div>
               <div>
                  <img src="" alt="" />
               </div>
            </div> <span> <input type="radio" class="br_sit" data-label="데일리룩"
               name="br_sit" id="br_sit3" value="데일리룩" style="cursor: pointer;" />
               <label for="br_sit3"><span style="cursor: pointer;">데일리룩</span></label>
         </span>
         </li>
         <br />
         <li class="select" onclick="toggle(this)">
            <div style="display: none;">
               <div>기타</div>
               <div>
                  <img src="" alt="" />
               </div>
            </div> <span> <input type="radio" class="br_sit" data-label="빈티지룩"
               name="br_sit" id="br_sit4" value="빈티지룩" style="cursor: pointer;" />
               <label for="br_sit4"><span style="cursor: pointer;">빈티지룩</span></label>
         </span>
         </li>
         <br/>
         <li class="select" onclick="toggle(this)">
            <div style="display: none;">
               <div>기타</div>
               <div>
                  <img src="" alt="" />
               </div>
            </div> <span> <input type="radio" class="br_sit" data-label="캐주얼룩"
               name="br_sit" id="br_sit5" value="캐주얼룩" style="cursor: pointer;" />
               <label for="br_sit5"><span style="cursor: pointer;">캐주얼룩</span></label>
         </span>
         </li>
         
      </ul>
   </div>

   <section id="portfolio">
      <div class="container" >

         <c:if test="${sessionScope.mb.state ==2 }">
            <div style="text-align: right;">
               <button style="text-align: right;" onclick="codyWrite()">코디등록</button>
            </div>
         </c:if>
         <div class="container" id='aTag'>
            <div id="findArea"></div>

            <div class="center">
               <div id="colorFindArea">
                  <ul class="colorfind">
                     <li class="select selChk" onclick="toggle(this)"
                        onmouseover="colChk(this)" onmouseleave="colNone(this)">
                        <div class="color_tooltip" style="display: none;">
                           <div class="tooltip_text">흰색</div>
                           <div class="tooltip_pointer">
                              <img src="./resources/images/tip_img.gif" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_color"
                           name="br_color" id="br_color1" value="white" /> <label
                           for="br_color1"><img src="./resources/images/흰색.png"></label>
                     </span>
                     </li>
                     <li class="select selChk" onclick="toggle(this)"
                        onmouseover="colChk(this)" onmouseleave="colNone(this)">
                        <div class="color_tooltip" style="display: none;">
                           <div class="tooltip_text">검정</div>
                           <div class="tooltip_pointer">
                              <img src="./resources/images/tip_img.gif" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_color"
                           name="br_color" id="br_color2" value="black" /> <label
                           for="br_color2"><img style="padding-right: 1%"
                              src="./resources/images/검정.png"></label>
                     </span>
                     </li>
                     <li class="select selChk" onclick="toggle(this)"
                        onmouseover="colChk(this)" onmouseleave="colNone(this)">
                        <div class="color_tooltip" style="display: none;">
                           <div class="tooltip_text">회색</div>
                           <div class="tooltip_pointer">
                              <img src="./resources/images/tip_img.gif" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_color"
                           name="br_color" id="br_color3" value="gray" /> <label
                           for="br_color3"><img src="./resources/images/회색.png"></label>
                     </span>
                     </li>
                     <li class="select selChk" onclick="toggle(this)"
                        onmouseover="colChk(this)" onmouseleave="colNone(this)">
                        <div class="color_tooltip" style="display: none;">
                           <div class="tooltip_text">갈색</div>
                           <div class="tooltip_pointer">
                              <img src="./resources/images/tip_img.gif" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_color"
                           name="br_color" id="br_color4" value="brown" /> <label
                           for="br_color4"><img src="./resources/images/갈색.png"></label>
                     </span>
                     </li>
                     <li class="select selChk" onclick="toggle(this)"
                        onmouseover="colChk(this)" onmouseleave="colNone(this)">
                        <div class="color_tooltip" style="display: none;">
                           <div class="tooltip_text">베이지</div>
                           <div class="tooltip_pointer">
                              <img src="./resources/images/tip_img.gif" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_color"
                           name="br_color" id="br_color5" value="beige" /> <label
                           for="br_color5"><img src="./resources/images/베이지.png"></label>
                     </span>
                     </li>
                     <li class="select selChk" onclick="toggle(this)"
                        onmouseover="colChk(this)" onmouseleave="colNone(this)">
                        <div class="color_tooltip" style="display: none;">
                           <div class="tooltip_text">녹색</div>
                           <div class="tooltip_pointer">
                              <img src="./resources/images/tip_img.gif" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_color"
                           name="br_color" id="br_color6" value="green" /> <label
                           for="br_color6"><img src="./resources/images/녹색.png"></label>
                     </span>
                     </li>
                     <li class="select selChk" onclick="toggle(this)"
                        onmouseover="colChk(this)" onmouseleave="colNone(this)">
                        <div class="color_tooltip" style="display: none;">
                           <div class="tooltip_text">파랑</div>
                           <div class="tooltip_pointer">
                              <img src="./resources/images/tip_img.gif" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_color"
                           name="br_color" id="br_color7" value="blue" /> <label
                           for="br_color7"><img src="./resources/images/파랑.png"></label>
                     </span>
                     </li>
                     <li class="select selChk" onclick="toggle(this)"
                        onmouseover="colChk(this)" onmouseleave="colNone(this)">
                        <div class="color_tooltip" style="display: none;">
                           <div class="tooltip_text">보라</div>
                           <div class="tooltip_pointer">
                              <img src="./resources/images/tip_img.gif" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_color"
                           name="br_color" id="br_color8" value="purple" /> <label
                           for="br_color8"><img src="./resources/images/보라.png"></label>
                     </span>
                     </li>
                     <li class="select selChk" onclick="toggle(this)"
                        onmouseover="colChk(this)" onmouseleave="colNone(this)">
                        <div class="color_tooltip" style="display: none;">
                           <div class="tooltip_text">노랑</div>
                           <div class="tooltip_pointer">
                              <img src="./resources/images/tip_img.gif" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_color"
                           name="br_color" id="br_color9" value="yellow" /> <label
                           for="br_color9"><img src="./resources/images/노랑.png"></label>
                     </span>
                     </li>
                     <li class="select selChk" onclick="toggle(this)"
                        onmouseover="colChk(this)" onmouseleave="colNone(this)">
                        <div class="color_tooltip" style="display: none;">
                           <div class="tooltip_text">핑크</div>
                           <div class="tooltip_pointer">
                              <img src="./resources/images/tip_img.gif" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_color"
                           name="br_color" id="br_color10" value="pink" /> <label
                           for="br_color10"><img src="./resources/images/핑크.png"></label>
                     </span>
                     </li>
                     <li class="select selChk" onclick="toggle(this)"
                        onmouseover="colChk(this)" onmouseleave="colNone(this)">
                        <div class="color_tooltip" style="display: none;">
                           <div class="tooltip_text">빨강</div>
                           <div class="tooltip_pointer">
                              <img src="./resources/images/tip_img.gif" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_color"
                           name="br_color" id="br_color11" value="red" /> <label
                           for="br_color11"><img src="./resources/images/빨강.png"></label>
                     </span>
                     </li>
                     <li class="select selChk" onclick="toggle(this)"
                        onmouseover="colChk(this)" onmouseleave="colNone(this)">
                        <div class="color_tooltip" style="display: none;">
                           <div class="tooltip_text">주황</div>
                           <div class="tooltip_pointer">
                              <img src="./resources/images/tip_img.gif" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_color"
                           name="br_color" id="br_color12" value="orange" /> <label
                           for="br_color12"><img src="./resources/images/주황.png"></label>
                     </span>
                     </li>
                     <li class="select selChk" onclick="toggle(this)"
                        onmouseover="colChk(this)" onmouseleave="colNone(this)">
                        <div class="color_tooltip" style="display: none;">
                           <div class="tooltip_text">기타</div>
                           <div class="tooltip_pointer">
                              <img src="./resources/images/tip_img.gif" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_color"
                           name="br_color" id="br_color13" value="etc" /> <label
                           for="br_color13"><img src="./resources/images/기타.png"></label>
                     </span>
                     </li>
                  </ul>
               </div>
                  </div>
               <br /> <br />
               <div id="br_divide" style="position:relative;left: 3%;">
                  <ul class="br_divide" style="position: relative;left: 36%;">
                     <li class="select" onclick="toggle(this)">
                        <div style="display: none;">
                           <div>기타</div>
                           <div>
                              <img src="" alt="" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_divide"
                           data-label="아우터" name="br_divide" id="br_divide1"
                           value="outerWear" /> <label for="br_divide1"><span>아우터</span></label>
                     </span>
                     </li>
                     <li class="select" onclick="toggle(this)">
                        <div style="display: none;">
                           <div>기타</div>
                           <div>
                              <img src="" alt="" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_divide"
                           data-label="상의" name="br_divide" id="br_divide2" value="top" />
                           <label for="br_divide2"><span>상의</span></label>
                     </span>
                     </li>
                     <li class="select" onclick="toggle(this)">
                        <div style="display: none;">
                           <div>기타</div>
                           <div>
                              <img src="" alt="" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_divide"
                           data-label="하의" name="br_divide" id="br_divide3" value="bottom" />
                           <label for="br_divide3"><span>하의</span></label>
                     </span>
                     </li>
                     <li class="select" onclick="toggle(this)">
                        <div style="display: none;">
                           <div>기타</div>
                           <div>
                              <img src="" alt="" />
                           </div>
                        </div> <span> <input type="checkbox" class="br_divide"
                           data-label="신발" name="br_divide" id="br_divide4" value="shoes" />
                           <label for="br_divide4"><span>신발</span></label>
                     </span>
                     </li>
                  </ul>
               </div>
            </div>
      
         <div id="likeNew" style="text-align: center;">
            <button class="btn btn-default" id="likeList" onClick='bListShow(0)'>인기순</button>
            <button class="btn btn-default" id="newList" onClick='bListShow(1)'>최신순</button>
         </div>

         <div class="container">
            <div id="boardList" class="row"></div>
         </div>
         <div id="paging" style="text-align: center;"></div>

      </div>
   </section>

   <!-- Footer Section -->
   <jsp:include page="footer.jsp" />


   <!-- SCRIPTS -->

   <script src="resources/js/jquery.js"></script>
   <script src="resources/js/bootstrap.min.js"></script>
   <script src="resources/js/custom.js"></script>

   <!-- light Box Div -->
   <div id="brandArticleView_layer">
      <div id="brand_bg_layer"></div>
      <div id="bcontents_layer"></div>
   </div>

</body>
<script>

   function colChk(e){
      e.children[0].setAttribute("style","display:block");
   }

   function colNone(e){
      e.children[0].setAttribute("style","display:none");
   }
   
   function codyWrite(){
      location.href="codyWriteF";   
   }
   $(document).ready(function() {
      var sessionState = "${sessionScope.mb.state}";
      console.log("세션 상태 : "+sessionState);
      if(sessionState !=2){
         $("#codyInsert").css("display","none");
      }
      console.log("ready굳");
      bListShow(0);
      brandShow();
   });

   var num = 0;
   
   $(".navbar navbar-default navbar-static-top").append($("div2"))
   $("#div2").append($("#likeNew"));
   
   function detailChk(b_num, id) {
      var session = "${sessionScope.mb}"
      console.log("디테일 콘솔");
      console.log(session);
      if(session !=""){
         console.log("비넘 : " + b_num);
         console.log("아이디 : " + id);
         $("#brandArticleView_layer").addClass('open');
         $.ajax({
            type : 'get',
            url : 'brandDetail',
            data : {
               id : id,
               b_num : b_num,
               num : 1
            },
            dataType : 'html',
            success : function(data) {
               console.log("ajax 성공");
               //console.log(data);
               $("#bcontents_layer").html(data);
            },
            error : function(e) {
               alert("상세보기실패");
               console.log(e);
            }
         });
      }else{
         alert("로그인이 필요한 서비스 입니다.");
         location.href="mLoginF";
      }
      
   }
   var str="";
   
   //브랜드 리스트 가져오기
   function brandShow(){
      $.ajax({
         type:"get",
         url:"getList",
         data:{},
         dataType:"JSON",
         success:function(data){
            console.log(data);
            console.log("ajax 성공");
            str="";
            str+="<ul id='brandList'>";
            if(data.brandList.length!=0){
                for(i=0;i<data.brandList.length;i++){
                  str+="<li class='select' onclick='toggle(this)'><div></div><span>";
                  str+="<input type='checkbox' class='br_brand' name='br_brand' id='br_brand"+[i]+"' value='"+data.brandList[i].nickName+"'/>"
                  str+="<label for='br_brand"+[i]+"'>"+data.brandList[i].nickName+"&nbsp;&nbsp;</label>";
                  str+="</span></li>";
               }
                str+="</ul>";
            }
            console.log(str);
            $("#findArea").html(str);
            
         }, 
         error:function(e){
            alert("브랜드 리스트 불러오기 실패");
            console.log(e);
         }
      });
   }


   var sit ="";
   var color=new Array();
   var brand=new Array();
   var divide=new Array();
   var result;
   var pageNum = 0;
   function toggle(e){

      console.log("토글함수");
      console.log(e);
      /* console.log("체크된거 확인"+$(e.children[1].children[0]).is(":checked")); */
      $(e).toggleClass('checked');
      
      result=$(e.children[1].children[0]).val();
      
       if($(e.children[1].children[0]).is(":checked")){
          console.log('헤이');
            if($(e.children[1].children[0]).hasClass('br_sit')) {
               console.log("ddd");
                sit=result;
             }
             if($(e.children[1].children[0]).hasClass('br_color')) {
                color.push(result);
             }
             if($(e.children[1].children[0]).hasClass('br_brand')) {
                brand.push(result);
             }
             if($(e.children[1].children[0]).hasClass('br_divide')) {
                divide.push(result);
             }

      }else{    //체크 해제시키기

         console.log("고고");
          if($(e.children[1].children[0]).hasClass('br_sit')){ 
               sit='';
            }
         if($(e.children[1].children[0]).hasClass('br_color')){
               color.splice(color.indexOf(result),1);
            }
         if($(e.children[1].children[0]).hasClass('br_brand')){
               brand.splice(brand.indexOf(result),1);
            }
         if($(e.children[1].children[0]).hasClass('br_divide')){
               divide.splice(divide.indexOf(result),1);
            }
      
      }   
         console.log("추가된 값 :"+ result);
          
         console.log($(e.children[1].children[0]).hasClass('br_sit'));
         console.log("배열 sit :"+sit);
         console.log("배열 color :"+color);
         console.log("배열 brand :"+brand);
         console.log("배열 push :"+divide);
         if(pageNum == 0){
            pageNum = 1;
         }
         searchMethod(sit,color,brand,divide,num,pageNum); 
   }
   
   jQuery.ajaxSettings.traditional = true;
   //ajax로 배열넘기기 위한 설정

      function bListShow(clickNum) {
      num = clickNum;
      //인기순 0 , 최신순 1
      if(pageNum == 0){
          pageNum = 1;
       }
      searchMethod(sit,color,brand,divide,num,pageNum); 
      };
      
   function searchMethod(sit,color,brand,divide,num,pageNum){
      $.ajax({
         type:"get",
         url:"multiSearch",
         data:{
            br_sit : sit,
            br_color : color,
            br_divide : divide,
            br_brand : brand,
            num : num,
            pageNum : pageNum
         },
         dataType:"JSON",
         success:function(data){
            console.log(data);
            console.log("서치 ajax 성공");
            console.log(data.blist);
            var contxt = ""
            for (var i = 0; i < data.blist.length; i++) {
               contxt += "<div class='col-md-4 col-sm-6'>";
               contxt += "<div style='width: 100%; class='col-md-4 col-sm-6'>";
               contxt += "<div><img class='round' style='width:16%' src='./resources/profile/"+data.blist[i].sysName+"'>&nbsp;&nbsp;"
               + "<a style='font-size:15px; font-weight:700' href='myStyle?nickName="+data.blist[i].nickName+"'>"+data.blist[i].nickName+"</a>";
               contxt += "<a style='position:absolute;right:5%;margin-top: 2%;'>"
                     + data.blist[i].br_date + "</a></div></div>";
               contxt += "<a id='detailChk' onclick=detailChk("
                     + data.blist[i].b_num + ",'"
                     + data.blist[i].id + "')>";
               contxt += "<div class='portfolio-thumb'>";
               contxt += "<img style='width: 100%; height: 35%;' src='./"
                     + data.blist[i].ap_path
                     + "' class='img-responsive' alt='Portfolio'>";
               contxt += "<div class='portfolio-overlay'>";
               contxt += "<div class='portfolio-item'>";
               contxt += "<h3>상세보기</h3>";
               contxt += "<small>클릭하세요</small></div></div></div></a>";
                contxt += "<div> <p style='font-weight:700'>좋아요 "+data.blist[i].likeC
                     +"&nbsp; 댓글 "+data.blist[i].comCount
                     + "</div></p></div>";
            }

            $("#boardList").html(contxt);
            $("#paging").html(data.paging);

         },
         error:function(e){
            alert("중복 검색 실패");
            console.log(e);
         }
      });
   }
</script>
</html>