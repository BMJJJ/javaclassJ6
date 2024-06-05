<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>boardList.jsp</title>
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
    
  </style>
  <script>
    'use strict';
    
    function pageSizeCheck() {
      let pageSize = $("#pageSize").val();
      location.href = "BoardList.bo?pageSize=" + pageSize;
    }
    
    function modalCheck(idx, mid, nickName) {
      $("#myModal #modalMid").text(mid);
      $("#myModal #modalNickName").text(nickName);
      $("#myModal #modalIdx").text(idx);
    }
    
    
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <form name="searchForm" method="post" action="BoardSearch.bo">
    <select name="partArea" id="partArea">
      <option ${partArea=="전체" ? "selected" : ""}>전체</option>
      <option ${partArea=="서울" ? "selected" : ""}>서울</option>
      <option ${partArea=="경기도" ? "selected" : ""}>경기도</option>
      <option ${partArea=="충청도" ? "selected" : ""}>충청도</option>
      <option ${partArea=="경상도" ? "selected" : ""}>경상도</option>
      <option ${partArea=="강원도" ? "selected" : ""}>강원도</option>
      <option ${partArea=="전라도" ? "selected" : ""}>전라도</option>
      <option ${partArea=="제주도" ? "selected" : ""}>제주도</option>
    </select>
  
    <select name="part" id="part">
      <option ${part=="전체" ? "selected" : ""}>전체</option>
      <option ${part=="산책후기" ? "selected" : ""}>산책후기</option>
      <option ${part=="추천" ? "selected" : ""}>추천</option>
      <option ${part=="명소" ? "selected" : ""}>명소</option>
    </select>
    <input type="submit" value="검색" class="btn btn-secondary"/>
    <input type="hidden" name="flag" value="partSearch"/>
  </form>
  <table class="table table-borderless m-0 p-0">
    <tr>
      <td colspan="2"><h2 class="text-center">게 시 판 리 스 트</h2></td>
    </tr>
    <tr>
      <td><c:if test="${sLevel != 1}"><a href="BoardInput.bo" class="btn btn-success btn-sm">글쓰기</a></c:if></td>
      <td class="text-right">
        <select name="pageSize" id="pageSize" onchange="pageSizeCheck()">
          <option ${pageSize==5  ? "selected" : ""}>5</option>
          <option ${pageSize==10 ? "selected" : ""}>10</option>
          <option ${pageSize==15 ? "selected" : ""}>15</option>
          <option ${pageSize==20 ? "selected" : ""}>20</option>
          <option ${pageSize==30 ? "selected" : ""}>30</option>
        </select>
      </td>
    </tr>
  </table>
  <table class="table table-hover m-0 p-0 text-center">
    <tr class="table-dark text-dark">
      <th>글번호</th>
      <th>글제목</th>
      <th>글쓴이</th>
      <th>글쓴날짜</th>
      <th>분류</th>
      <th>조회수(좋아요)</th>
    </tr>
    <c:set var="curScrStartNo" value="${curScrStartNo}" />
    <c:forEach var="vo" items="${vos}" varStatus="st">
          <tr>
            <td>${curScrStartNo}</td>
            <td class="text-left">
              <a href="BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a>
              <c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif" /></c:if>  
              <c:if test="${vo.replyCnt != 0}">(${vo.replyCnt})</c:if>
            </td>
            <td>
              ${vo.nickName}
              <c:if test="${sLevel == 0}">
                <a href="#" onclick="modalCheck('${vo.idx}','${vo.mid}','${vo.nickName}')" data-toggle="modal" data-target="#myModal" class="badge badge-success">정보</a>
              </c:if>
            </td>
            <td>
              <!-- 1일(24시간) 이내는 시간만 표시(10:43), 이후는 날짜와 시간을 표시 : 2024-05-14 10:43 -->
              ${vo.date_diff == 0 ? fn:substring(vo.wDate,11,19) : fn:substring(vo.wDate,0,10)}
            </td>
            <td>
            	${vo.part}
            </td>
            <td>${vo.readNum}(${vo.good})</td>
          </tr>
      <c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
    </c:forEach>
    <tr><td colspan="5" class="m-0 p-0"></td></tr>
  </table>
  <br/>
  <!-- 블록페이지 시작 -->
  <div class="text-center">
    <ul class="pagination justify-content-center">
      <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
      <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}">이전블록</a></li></c:if>
      <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
        <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/BoardList.bo?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
        <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
      </c:forEach>
      <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
      <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
    </ul>
  </div>
  <!-- 블록페이지 끝 -->
  <br/>
  <!-- 검색기 시작 -->
  <div class="container text-center">
    <form name="searchForm" method="post" action="BoardSearch.bo?flag=contentSearch">
      <b>검색 : </b>
      <select name="search" id="search">
        <option value="title">글제목</option>
        <option value="nickName">글쓴이</option>
        <option value="content">글내용</option>
      </select>
      <input type="text" name="searchString" id="searchString" required />
      <input type="submit" value="검색" class="btn btn-secondary btn-sm"/>
    </form>
  </div>
  <!-- 검색기 끝 -->
</div>
<p><br/></p>

<!-- 모달에 회원정보 출력하기 -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원 정보</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        고유번호 : <span id="modalIdx"></span><br/>
        아이디 : <span id="modalMid"></span><br/>
        닉네임 : <span id="modalNickName"></span><br/>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<jsp:include page="/include/footer.jsp" />
</body>
</html>
