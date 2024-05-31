<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>boardInput.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Roboto', sans-serif;
    }

    .container {
      background-color: #ffffff;
      padding: 30px;
      margin-top: 50px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
    }

    h2 {
      margin-bottom: 20px;
      font-weight: 700;
      color: #343a40;
    }

    .table {
      margin-bottom: 0;
      width: 100%;
    }

    th {
      background-color: #f1f1f1;
      text-align: right;
      vertical-align: middle;
      padding: 10px 15px;
      font-weight: 600;
      color: #495057;
    }

    td {
      vertical-align: middle;
      padding: 10px 15px;
    }

    .form-control {
      border-radius: 5px;
      border: 1px solid #ced4da;
      padding: 10px;
      font-size: 16px;
    }

    .btn {
      padding: 10px 20px;
      border-radius: 5px;
      font-weight: 600;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s, transform 0.3s;
    }

    .btn-success {
      background-color: #28a745;
      border: none;
      color: #fff;
    }

    .btn-success:hover {
      background-color: #218838;
      transform: translateY(-2px);
    }

    .btn-warning {
      background-color: #ffc107;
      border: none;
      color: #fff;
    }

    .btn-warning:hover {
      background-color: #e0a800;
      transform: translateY(-2px);
    }

    .btn-info {
      background-color: #17a2b8;
      border: none;
      color: #fff;
    }

    .btn-info:hover {
      background-color: #138496;
      transform: translateY(-2px);
    }

    input[type="radio"] {
      margin-right: 5px;
    }

    .table input[type="radio"] + label {
      margin-right: 15px;
      font-weight: 400;
      color: #495057;
    }

    .text-center {
      text-align: center;
    }

    .mr-2 {
      margin-right: 10px;
    }

    textarea.form-control {
      resize: vertical;
    }
  </style>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">게 시 판 글 쓰 기</h2>
  <form name="myform" method="post" action="BoardInputOk.bo">
    <table class="table table-bordered">
      <tr>
        <th>글쓴이</th>
        <td><input type="text" name="nickName" id="nickName" value="${sNickName}" readonly class="form-control" /></td>
      </tr>
      <tr>
        <th>지역</th>
        <td>
          <input type="radio" name="partArea" id="partArea1" value="서울" checked /> <label for="partArea1">서울</label> &nbsp;
          <input type="radio" name="partArea" id="partArea2" value="경기도" /> <label for="partArea2">경기도</label> &nbsp;
          <input type="radio" name="partArea" id="partArea3" value="충청도" /> <label for="partArea3">충청도</label> &nbsp;
          <input type="radio" name="partArea" id="partArea4" value="경상도" /> <label for="partArea4">경상도</label> &nbsp;
          <input type="radio" name="partArea" id="partArea4" value="강원도" /> <label for="partArea4">강원도</label> &nbsp;
          <input type="radio" name="partArea" id="partArea5" value="전라도" /> <label for="partArea5">전라도</label> &nbsp;
          <input type="radio" name="partArea" id="partArea6" value="제주도" /> <label for="partArea6">제주도</label> &nbsp;
        </td>
      </tr>
      <tr>
        <th>분류</th>
        <td>
          <input type="radio" name="part" id="part1" value="산책후기" checked /> <label for="part1">산책후기</label> &nbsp;
          <input type="radio" name="part" id="part2" value="추천" /> <label for="part2">추천</label> &nbsp;
          <input type="radio" name="part" id="part3" value="명소" /> <label for="part3">명소</label> &nbsp;
        </td>
      </tr>
      <tr>
        <th>공개여부</th>
        <td>
          <input type="radio" name="openSw" id="openSw1" value="OK" checked /> 공개 &nbsp;
          <input type="radio" name="openSw" id="openSw2" value="NO" /> 비공개
        </td>
      </tr>
      <tr>
        <th>글제목</th>
        <td><input type="text" name="title" id="title" placeholder="글제목을 입력하세요" autofocus required class="form-control" /></td>
      </tr>
      <tr>
        <th>글내용</th>
        <td><textarea name="content" id="content" rows="6" class="form-control" required></textarea></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type="submit" value="글올리기" class="btn btn-success mr-2"/>
          <input type="reset" value="다시입력" class="btn btn-warning mr-2"/>
          <input type="button" value="돌아가기" onclick="location.href='BoardList.bo';" class="btn btn-info"/>
        </td>
      </tr>
    </table>
    <input type="hidden" name="mid" value="${sMid}"/>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
