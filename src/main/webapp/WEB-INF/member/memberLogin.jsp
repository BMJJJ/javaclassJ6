<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
    // 로그인창에 아이디 체크 유무에 대한 처리
    // 쿠키를 검색해서 cMid가 있을때 가져와서 아이디입력창에 뿌릴수 있게 한다.
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("cMid")) {
                pageContext.setAttribute("mid", cookies[i].getValue());
                break;
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
  <%@ include file = "/include/bs4.jsp" %>
  <style>
  	body {
     font-family: 'Ownglyph_ryurue-Rg';
     font-size: 16pt;
    }
    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }
    .card {
      width: 100%;
      max-width: 400px;
      border: none;
      border-radius: 15px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s;
    }
    .card-header {
      background-color: #D1D3CF;
      color: black;
      border-radius: 15px 15px 0 0;
      padding: 20px;
      text-align: center;
    }
    .card-body {
      padding: 30px;
    }
    .form-group label {
      font-weight: bold;
      margin-bottom: 10px;
    }
    .form-control {
      border-radius: 5px;
      padding: 10px;
    }
    .btn {
      width: 100%;
      margin-top: 10px;
      padding: 10px;
      border-radius: 5px;
      border: none;
      transition: opacity 0.3s;
    }
    .btn-success {
      background-color: #28a745;
    }
    .btn-warning {
      background-color: #ffc107;
    }
    .btn-primary {
      background-color: #007bff;
    }
    .btn:hover {
      opacity: 0.8;
    }
    .form-check {
      margin-top: 15px;
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
  <div class="container">
    <div class="card">
      <div class="card-header">
        <h5>로그인</h5>
      </div>
      <div class="card-body">
        <form name="myform" method="post" action="${ctp}/MemberLoginOk.mem">
          <div class="form-group">
            <label for="mid">아이디</label>
            <input type="text" name="mid" value="${mid}" id="mid" class="form-control" placeholder="아이디를 입력하세요" autofocus required />
          </div>
          <div class="form-group">
            <label for="pwd">비밀번호</label>
            <input type="password" name="pwd" id="pwd" class="form-control" placeholder="비밀번호를 입력하세요" required />
          </div>
          <button type="submit" class="btn btn-success">로그인</button>
          <button type="reset" class="btn btn-warning">다시입력</button>
          <button type="button" class="btn btn-primary" onclick="location.href='${ctp}/MemberJoin.mem';">회원가입</button>
          <button type="button" class="btn btn-primary" onclick="location.href='${ctp}/MemberIdFind.mem';">아이디찾기</button>
          <div class="form-check">
            <input type="checkbox" name="idSave" id="idSave" class="form-check-input" checked />
            <label class="form-check-label" for="idSave">아이디 저장</label>
          </div>
        </form>
      </div>
    </div>
  </div>
  <jsp:include page="/include/footer.jsp" />
</body>
</html>