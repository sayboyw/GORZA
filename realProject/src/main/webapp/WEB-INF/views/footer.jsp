<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="text/javascript" src="resources/js/jquery-2.1.1.js"></script>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">

<!-- Main css -->
<link rel="stylesheet" href="resources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<style>
#logo {
	width: 35%;
}

#portfolio {
	padding-top: 0px;
}

#home {
	padding-bottom: 0px;
}

#menubar1 {
	margin: auto;
}

.round {
	border-radius: 50%;
	height: 6%;
	background-image: url("resources/images/profile.png");
	background-size: 100% 100%;
}



#myself {
	margin: auto;
	width: 400px;
	height: 100px;
}

.nav-tabs .nav-link {
	width: 180px;
	color: #6E6E6E;
	border-color: #D8D8D8 #D8D8D8 #F2F2F2 #D8D8D8;
	border-radius: 7px 7px 0px 0px;
	text-align: center;
	font-size: 15px;
}

.nav-link.active {
	color: #6E6E6E;
}

.nav-tabs .nav-link:hover {
	color: #6E6E6E;
	background-color: #E6E6E6;
	border-color: #BDBDBD #BDBDBD #D8D8D8 #BDBDBD;
	border-radius: 10px 10px 0px 0px;
}

.nav-link.active:hover {
	border-color: #D8D8D8 #D8D8D8 #FFFFFF #BDBDBD;
	border-radius: 5px 5px 0px 0px;
}
#articleView_layer {
	display: none;
	position: fixed;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

#articleView_layer.open {
	display: block;
	color: red
}

#articleView_layer #bg_layer {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 5000px;
	background: #000;
	opacity: .7;
	filter: alpha(opacity = 90);
	z-index: 9990;
}

#maxdiv{
	max-width : 800px;
}

#contents_layer {
	position: absolute;
	top: 30%;
	left: 27%;
	max-width : 1000px;
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

 html, body { height:100%;}
 
#container{
	height: 28%;
	margin: auto;
	width: 58%;
	
}

#bannerArea{
	position: relative;	
}
#arrow{
	position: absolute;
	top: 5%;
	height: 200px;
	width: 100%;
}

#right{
	position: absolute;
		right: 15px;
}

#left{
	position: absolute;	
		left: 15px;	
}

ul{
	list-style: none;
	padding: 0px;
	position: relative;
}
#arrow li{
	position: absolute;
	top: 58%;
}
ul.toggle{
	text-align: center;
	position: relative;
}

ul.toggle li{
	display: inline-block;
	margin-left: 10px;
}
#banner{
	margin-bottom: -25px;
}
#banner li{
	position: absolute;
}
.mySlides {display:none}
.dots-check{
	background-image: url("resources/images/toggle_over.png");
}
#thumb{
	margin-top: 30%;
}

</style>
<body>
<!-- Footer Section -->

<footer>
     <div class="container">
          <div class="row">
          <div class="col-md-3 col-sm-3">
                    <img id="logo" style="width: 35%" src="resources/images/logo.png">
               </div>
               <div class="col-md-4 col-sm-4">
                    <p>인천광역시 남구 학익동 663-1 태승빌딩 5층</p>
               </div>

               <div class="col-md-offset-1 col-md-4 col-sm-offset-1 col-sm-3">
                    <p><a href="mailto:youremail@gmail.com">hello@yourstudio.co</a></p>
                    <p>(+01) 2048937 / 02 203403</p>
               </div>

               <div class="clearfix col-md-12 col-sm-12">
                    <hr>
               </div>

               <div class="col-md-6 col-sm-6">
                    <div class="footer-copyright">
                         <p>© 2018 Gorza Studio | All Rights Reserved.</p>
                    </div>
               </div>

               <div class="col-md-6 col-sm-6">
                    <ul class="social-icon">
                         <li><a href="#" class="fa fa-facebook"></a></li>
                         <li><a href="#" class="fa fa-twitter"></a></li>
                         <li><a href="#" class="fa fa-linkedin"></a></li>
                    </ul>
               </div>
               
          </div>
     </div>
</footer>
</body>
</html>