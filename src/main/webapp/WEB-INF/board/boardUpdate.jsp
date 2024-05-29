<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>boardUpdate.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <style>
    body {
      background-color: #f8f9fa;
      font-family: Arial, sans-serif;
    }
    .container {
      background-color: #ffffff;
      padding: 20px;
      margin-top: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }
    .table th, .table td {
      vertical-align: middle;
    }
    h2 {
      margin-bottom: 20px;
      font-weight: 600;
    }
    .form-control:read-only {
      background-color: #e9ecef;
      opacity: 1;
    }
    .btn {
      padding: 10px 20px;
      font-size: 14px;
      border-radius: 4px;
    }
    .btn-success {
      background-color: #28a745;
      border-color: #28a745;
    }
    .btn-warning {
      background-color: #ffc107;
      border-color: #ffc107;
    }
    .btn-info {
      background-color: #17a2b8;
      border-color: #17a2b8;
    }
    .btn:focus, .btn:active {
      box-shadow: none;
    }
    @media (max-width: 576px) {
      .container {
        padding: 10px;
      }
      h2 {
        font-size: 18px;
      }
      .btn {
        font-size: 12px;
        padding: 8px 16px;
      }
    }
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">게 시 판 글 수 정 하 기</h2>
  <form name="myform" method="post" action="BoardUpdateOk.bo">
    <table class="table table-bordered">
      <tr>
        <th>글쓴이</th>
        <td><input type="text" name="nickName" id="nickName" value="${sNickName}" readonly class="form-control" /></td>
      </tr>
      <tr>
        <th>글제목</th>
        <td><input type="text" name="title" id="title" value="${vo.title}" autofocus required class="form-control" /></td>
      </tr>
      <tr>
        <th>글내용</th>
        <td><textarea name="content" id="content" rows="6" class="form-control" required>${vo.content}</textarea></td>
      </tr>
      <tr>
        <th>공개여부</th>
        <td>
          <input type="radio" name="openSw" id="openSw1" value="OK" ${vo.openSw == 'OK' ? 'checked' : ''} /> 공개 &nbsp;
          <input type="radio" name="openSw" id="openSw2" value="NO" ${vo.openSw == 'NO' ? 'checked' : ''}/> 비공개
        </td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type="submit" value="수정하기" class="btn btn-success mr-2"/>
          <input type="reset" value="다시입력" class="btn btn-warning mr-2"/>
          <input type="button" value="돌아가기" onclick="location.href='BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-info"/>
        </td>
      </tr>
    </table>
    <input type="hidden" name="idx" value="${vo.idx}"/>
    <input type="hidden" name="pag" value="${pag}"/>
    <input type="hidden" name="pageSize" value="${pageSize}"/>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
