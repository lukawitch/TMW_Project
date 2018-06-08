<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <%@include file="common.jsp"%>


  </head>
</head>
<body>
  <%@include file="index-nav.jsp"%>
 <div class="container">

      <div class="row">

        <div class="col-lg-12">

          <h1 class="my-4">TMW-로그인 해주세요</h1>
          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src="./image/TMW1.png" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="./image/TMW2.png" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="./image/TMW3.png" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
          <div class="list-group">
            <a href="#" class="list-group-item">쓰레기 배출 실태</a>
            <a href="#" class="list-group-item">환급금과 에코포인트 현황</a>
            <a href="#" class="list-group-item">이번달의 에코왕</a>
            <a href="#" class="list-group-item">전체회원과 비교한 개인의 쓰레기 배출량</a>
          </div>

        </div>


    <%@include file="footer.jsp"%>
   
</body>
</html>