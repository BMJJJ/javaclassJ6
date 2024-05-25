<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ include file = "/include/certification.jsp" %> --%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>memberMain.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f8f9fa;
      color: #343a40;
      margin: 0;
      padding: 0;
    }
    
    .container {
      margin-top: 30px;
    }

    h2, h5 {
      color: #007bff;
    }

    p {
      font-size: 1rem;
    }

    hr {
      border: 1px solid #007bff;
    }

    .row {
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .col {
      flex: 1;
    }

    .col img {
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .col:first-child {
      padding-right: 20px;
    }

    .col:last-child {
      text-align: center;
    }

    .footer {
      padding: 20px 0;
      background-color: #343a40;
      color: white;
      text-align: center;
    }
    
    .highlight {
      color: #007bff;
      font-weight: bold;
    }

    .level {
      color: #dc3545;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <jsp:include page="/include/nav.jsp" />
  <jsp:include page="/include/header.jsp" />
  <p><br/></p>
  <div class="container">
    <h2>회원 전용방</h2>
    <hr/>
    <!-- 실시간 채팅방(DB) -->
    <hr/>
    <div class="row">
      <div class="col">
        <p>현재 <b><span class="highlight">${sNickName}</span>(<span class="level">${strLevel}</span>)</b> 님이 로그인 중이십니다.</p>
        <p>총 방문횟수 : <b>${mVo.visitCnt}</b> 회</p>
        <p>오늘 방문횟수 : <b>${mVo.todayCnt}</b> 회</p>
      </div>
      <div class="col">
        <p><img src="${ctp}/images/member/${mVo.photo}" width="200px"/></p>
      </div>
    </div>
    <hr/>
    <div>
      <h5>활동내역</h5>
      <p>방명록에 올린글수 : <b>${guestCnt}</b> 건</p>
      <p>게사판에 올린글수 : ___건</p>
      <p>자료실에 올린글수 : ___건</p>
    </div>
  </div>
  <p><br/></p>
  <jsp:include page="/include/footer.jsp" />
</body>
</html>