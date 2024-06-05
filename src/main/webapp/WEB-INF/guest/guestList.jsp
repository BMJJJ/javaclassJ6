<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>guestList.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <style>
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
    
    function delCheck(idx) {
    	let ans = confirm("현재 방문글을 삭제하시겠습니까?");
    	if(ans) {
    		location.href = '${ctp}/GuestDelete?idx=' + idx;
    		return false;
    	}
    }
    
    function pageSizeCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "GuestList.gu?pag=${pag}&pageSize="+pageSize;
    }
    
    
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">방명록</h2>
  <table class="table table-borderless m-0 p-0">
    <tr>
      <td><a href="GuestInput.gu" class="btn btn-success">글쓰기</a></td>
      <td class="text-right">
        <c:if test="${pag > 1}">
          <a href="GuestList.gu?pag=1&pageSize=${pageSize}" title="첫페이지">◁◁</a>
          <a href="GuestList.gu?pag=${pag-1}&pageSize=${pageSize}" title="이전페이지">◀</a>
        </c:if>
        ${pag}/${totPage}
        <c:if test="${pag < totPage}">
          <a href="GuestList.gu?pag=${pag+1}&pageSize=${pageSize}" title="다음페이지">▶</a>
          <a href="GuestList.gu?pag=${totPage}&pageSize=${pageSize}" title="마지막페이지">▷▷</a>
        </c:if>
      </td>
    </tr>
    <tr>
      <td colspan="2" class="text-right">
        <select name="pageSize" id="pageSize" onchange="pageSizeCheck()">
        	<option <c:if test="${pageSize == 2}">selected</c:if>>2</option>
        	<option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
        	<option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
        	<option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
        </select>
      </td>
    </tr>
  </table>
  <c:set var="curScrStartNo" value="${curScrStartNo}"/>
  <c:forEach var="vo" items="${vos}" varStatus="st">
	  <table class="table table-borderless m-0 p-0">
	    <tr>
	      <td>
	        번호 : ${curScrStartNo}
	        <c:if test="${sAdmin == 'OK' || sMid == vo.mid}"><a href="javascript:delCheck(${vo.idx})" class="btn btn-danger btn-sm">삭제</a></c:if>
	      </td>
	    </tr>
	  </table>
	  <table class="table table-bordered">
	    <tr>
	      <th>닉네임</th>
	      <td>${vo.nickName}</td>
	      <th>방문일자</th>
	      <td>${fn:substring(vo.visitDate,0,19)}</td>
	    </tr>
	    <tr>
	      <th>글제목</th>
	      <td colspan="3">
	      	${vo.title}
	      </td>
	    </tr>
	    <tr>
	      <th>방문소감</th>
	      <td colspan="3">${fn:replace(vo.content, newLine, "<br/>")}</td>
	    </tr>
	  </table>
	  <br/>
	  <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
  </c:forEach>
  
<!-- 블록페이지 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
	  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="GuestList.gu?pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
	  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="GuestList.gu?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}">이전블록</a></li></c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
	    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="GuestList.gu?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
	    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="GuestList.gu?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
	  </c:forEach>
	  <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="GuestList.gu?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
	  <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="GuestList.gu?pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
  </ul>
</div>
<!-- 블록페이지 끝 -->

</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>