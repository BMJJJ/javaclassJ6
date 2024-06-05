<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>adminContent.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      padding: 20px;
    }
    .container {
      background-color: #ffffff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h3 {
      color: #007bff;
      margin-bottom: 20px;
    }
    p {
      font-size: 18px;
    }
    a {
      color: #007bff;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
    b {
      font-weight: bold;
    }
    hr {
      border: 1px solid #dee2e6;
    }
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h3>관리자 메인화면</h3>
  <hr/>
  <p>게시판 새글 : <b>${blCount}</b>건</p>
  <p>신고글 : <a href="ComplaintList.ad"><b>${cList}</b></a>건</p>
  <p>신규등록회원 : <a href="MemberList.ad?level=1"><b>${mCount}</b></a>건</p>
  <p>탈퇴신청회원 : <a href="MemberList.ad?level=99"><b>${mdCount}</b></a>건</p>
</div>
<p><br/></p>
</body>
</html>
