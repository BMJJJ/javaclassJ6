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
    th {
      background-color: #eee;
      text-align: center;
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
    	location.href = "${ctp}/GuestList?pag=${pag}&pageSize="+pageSize;
    }
    
    
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">자 유 게 시 판</h2>
  <table class="table table-borderless m-0 p-0">
    <tr>
      <td><a href="GuestInput.gu" class="btn btn-success">글쓰기</a></td>
      <td class="text-right">
        <c:if test="${pag > 1}">
          <a href="${ctp}/GuestList?pag=1&pageSize=${pageSize}" title="첫페이지">◁◁</a>
          <a href="${ctp}/GuestList?pag=${pag-1}&pageSize=${pageSize}" title="이전페이지">◀</a>
        </c:if>
        ${pag}/${totPage}
        <c:if test="${pag < totPage}">
          <a href="${ctp}/GuestList?pag=${pag+1}&pageSize=${pageSize}" title="다음페이지">▶</a>
          <a href="${ctp}/GuestList?pag=${totPage}&pageSize=${pageSize}" title="마지막페이지">▷▷</a>
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
	  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList?pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
	  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}">이전블록</a></li></c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
	    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/GuestList?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
	    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
	  </c:forEach>
	  <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
	  <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList?pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
  </ul>
</div>
<!-- 블록페이지 끝 -->

</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>