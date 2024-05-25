<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>main.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file = "/include/bs4.jsp" %>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f8f9fa;
      color: #343a40;
    }
    
    .fakeimg {
      height: 200px;
      background: #aaa;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-size: 1.5rem;
      border-radius: 8px;
    }

    h2, h3 {
      color: #007bff;
    }

    .nav-pills .nav-link {
      border-radius: 0;
      color: #007bff;
      transition: background-color 0.3s ease;
    }

    .nav-pills .nav-link.active {
      background-color: #007bff;
      color: white;
    }

    .nav-pills .nav-link:hover {
      background-color: #e2e6ea;
    }

    .table {
      margin-top: 20px;
    }

    .table th {
      background-color: #007bff;
      color: white;
    }

    .table-striped tbody tr:nth-of-type(odd) {
      background-color: rgba(0, 123, 255, 0.05);
    }

    .table-hover tbody tr:hover {
      background-color: rgba(0, 123, 255, 0.1);
    }

    .container {
      margin-top: 30px;
    }

    .mb-4 {
      margin-bottom: 1.5rem;
    }

    .text-right {
      text-align: right;
    }

    .footer {
      padding: 20px 0;
      background-color: #343a40;
      color: white;
      text-align: center;
    }

    @font-face {
    	font-family: 'Ownglyph_ryurue-Rg';
    	src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-2@1.0/Ownglyph_ryurue-Rg.woff2') format('woff2');
    	font-weight: normal;
    	font-style: normal;
		}
		
		p {
			font-family: 'Ownglyph_ryurue-Rg';
			font-size: 20pt;
		}
  </style>
</head>
<body>

<%@ include file = "/include/nav.jsp" %>

<%@ include file = "/include/header.jsp" %>

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-4">
      <h5 class="mb-4">로그인 중인 회원 : ${sNickName}</h5>
      <h6 class="text-right">최근 가입한 회원</h6>
      <div class="fakeimg">
        <table class="table table-striped table-hover text-center">
          <thead>
            <tr>
              <th>아이디</th>
              <th>성명</th>
              <th>지역</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="vo" items="${recentVos}">
              <tr>
                <td>${vo.mid}</td>
                <td>${vo.name}</td>
                <td>${vo.address}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <p>길 위에 둥둥 떠다니기</p>
      <h3>Some Links</h3>
      <p>Lorem ipsum dolor sit ame.</p>
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
      </ul>
      <hr class="d-sm-none">
    </div>
    <div class="col-sm-8">
      <h2>같이 걸을래</h2>
      <h5>Title description, Dec 7, 2017</h5>
      <div class="fakeimg">Fake Image</div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
      <br>
      <h2><img src="https://cdn.icon-icons.com/icons2/758/PNG/96/clear-night-weather-symbol-of-crescent-moon-with-stars_icon-icons.com_64205.png"/>별 보러 가자<img src="https://cdn.icon-icons.com/icons2/758/PNG/96/clear-night-weather-symbol-of-crescent-moon-with-stars_icon-icons.com_64205.png"/><h2>
      <h5>Title description, Sep 2, 2017</h5>
      <div class="fakeimg">Fake Image</div>
      <p>Some text..</p>
      <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
    </div>
  </div>
</div>

<%@ include file = "../../include/footer.jsp" %>
</body>
</html>
