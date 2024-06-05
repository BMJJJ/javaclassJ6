<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>main.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <%@ include file = "/include/bs4.jsp" %>
  <style>
   body {
     font-family: 'intelone-mono-font-family-regular';
     font-size: 12pt; 
     background-color: beige;
    }
    .container {
      background-color: #ffffff;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      margin-top: 20px;
    }
    h2 {
      margin-bottom: 20px;
      font-weight: 600;
      color: #343a40;
    }
    .table {
      margin-bottom: 0;
    }
    .table th, .table td {
      padding: 10px;
      vertical-align: middle;
    }
    .table th {
      background-color: #343a40;
      color: #ffffff;
    }
    .table-hover tbody tr:hover {
      background-color: #f1f1f1;
    }
    .table-borderless th, .table-borderless td {
      border: none;
    }
    .btn {
      padding: 8px 12px;
      border-radius: 4px;
      font-weight: 600;
    }
    .btn-success {
      background-color: #28a745;
      border: none;
      color: #ffffff;
    }
    .btn-secondary {
      background-color: #6c757d;
      border: none;
      color: #ffffff;
    }
    .page-link {
      color: #343a40;
    }
    .page-link:hover {
      background-color: #343a40;
      color: #ffffff;
    }
    .page-item.active .page-link {
      background-color: #495057;
      border-color: #495057;
    }
    .modal-content {
      border-radius: 10px;
    }
    .modal-header {
      background-color: #343a40;
      color: #ffffff;
      border-bottom: none;
    }
    .modal-footer {
      border-top: none;
    }
    #myModal .modal-body {
      font-size: 16px;
    }
    select, input[type="text"] {
      padding: 8px;
      border-radius: 4px;
      border: 1px solid #ced4da;
    }
    .text-center {
      text-align: center;
    }
    .text-right {
      text-align: right;
    }
   @font-face {
    	font-family: 'intelone-mono-font-family-regular';
    	src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/intelone-mono-font-family-regular.woff2') format('woff2');
    	font-weight: 400;
    	font-style: normal;
		}  
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
    
  </style>
</head>
<body>

<%@ include file = "/include/nav.jsp" %>

<%--  <%@ include file = "/include/header.jsp" %>--%>

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-4">
      <h5 class="mb-4">로그인 중인 회원 : ${sNickName}</h5>
      <h6 class="text-right">같이 걷는 사람들</h6>
      <div class="fakeimg">
        <table class="table">
          <thead>
            <tr>
              <th>카페이름</th>
              <th>회원수</th>
              <th>총방문수</th>
              <th>일일방문수</th>
            </tr>
          </thead>
          <tbody>
              <tr>
                <td>산책로</td>
                <td>${totMem}</td>
                <td>${allVisitCnt}</td>
                <td>${allTodayCnt}</td>
              </tr>
          </tbody>
        </table>
      </div>
      <p>환영합니다. 오늘도 좋은 날 입니다.</p>
      <!-- <p>Lorem ipsum dolor sit ame.</p>
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link active" href="#">Active</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#">Disabled</a>
        </li>
      </ul> -->
      <hr class="d-sm-none">
    </div>
    <div class="col-sm-8">
      <h2></h2>
      <div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${ctp}/images/143.jpg" alt="Los Angeles" width="100" height="500">
      <div class="carousel-caption">
        <h3></h3>
        <p>대청댐</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="${ctp}/images/141.jpg" alt="Chicago" width="100" height="500">
      <div class="carousel-caption">
        <h3></h3>
        <p>향정원</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="${ctp}/images/142.jpg" alt="New York" width="100" height="500">
      <div class="carousel-caption">
        <h3></h3>
        <p>운문사</p>
      </div>   
    </div>
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
      <br>
      <h2>밤</h2>
      <h5>Title description, Sep 2, 2017</h5>
      <div class="w3-content w3-section fakeimg ml-2" style="max-width:500px; height: auto;">
        <img class="mySlides2 w3-animate-fading" src="${ctp}/images/118.jpg" style="width:100%">
        <img class="mySlides2 w3-animate-fading" src="${ctp}/images/119.jpg" style="width:100%">
        <img class="mySlides2 w3-animate-fading" src="${ctp}/images/120.jpg" style="width:100%">
        <img class="mySlides2 w3-animate-fading" src="${ctp}/images/121.jpg" style="width:100%">
      </div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
    </div>
  </div>
</div>
<%@ include file = "../../include/footer.jsp" %>
<script>
'use strict';

	var myIndex2 = 0;
	carousel2();
	
	function carousel2() {
	  var i;
	  var x = document.getElementsByClassName("mySlides2");
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";  
	  }
	  myIndex2++;
	  if (myIndex2 > x.length) {myIndex2 = 1}    
	  x[myIndex2-1].style.display = "block";  
	  setTimeout(carousel2, 6000);    
	}
</script>
</body>
</html>
