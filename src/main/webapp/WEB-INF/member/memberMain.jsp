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
     font-family: 'Ownglyph_ryurue-Rg';
     font-size: 16pt;
    }
    
    .container {
      margin-top: 30px;
      background-color: #ffffff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h2, h5 {
      color: #037367;
    }

    p {
      font-size: 1.5rem;
      line-height: 1.5;
    }

    hr {
      border: 1px solid #007bff;
      margin: 20px 0;
    }

    .row {
      display: flex;
      align-items: center;
      justify-content: space-between;
      flex-wrap: wrap;
    }

    .col {
      flex: 1;
      padding: 10px;
    }

    .col img {
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      max-width: 100%;
      height: auto;
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
      margin-top: 30px;
    }
    
    .highlight {
      color: #007bff;
      font-weight: bold;
    }

    .level {
      color: #dc3545;
      font-weight: bold;
    }

    @media (max-width: 768px) {
      .row {
        flex-direction: column;
        text-align: center;
      }
      
      .col {
        padding: 10px 0;
      }
      
      .col:first-child {
        padding-right: 0;
      }
    }
    @font-face {
      font-family: 'Ownglyph_ryurue-Rg';
      src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-2@1.0/Ownglyph_ryurue-Rg.woff2') format('woff2');
      font-weight: normal;
      font-style: normal;
    }
  </style>
</head>
<body>
  <jsp:include page="/include/nav.jsp" />
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
      <p>방명록에 올린글수 : <b>${guestCnt}</b> 건</p>  <!-- 방명록에 올린이가 '성명/아이디/닉네임'과 같은면 모두 같은 사람이 올린글로 간주한다. -->
      <p>게사판에 올린글수 : <b>${boardCnt}</b> 건</p>
      <p>자료실에 올린글수 : <b>${pdsCnt}</b> 건</p>
    </div>
  </div>
  <p><br/></p>
  <jsp:include page="/include/footer.jsp" />
</body>
</html>
