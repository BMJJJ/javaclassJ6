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
  <title>wmContent.jsp</title>
  <%-- <%@ include file = "/include/bs4.jsp" %> --%>
  <style>
  	 body {
     font-family: 'intelone-mono-font-family-regular';
     font-size: 12pt; 
    }
    th {
      text-align: center;
      background-color: #eee;
    }
     
  	
    th {
      background-color: #dee;
    }
    td {
      text-align: left;
    }
    @font-face {
    	font-family: 'intelone-mono-font-family-regular';
    	src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/intelone-mono-font-family-regular.woff2') format('woff2');
    	font-weight: normal;
    	font-style: normal;
		}
  </style>
</head>
<body>
<div class="container">
  <table class="table table-bordered">
    <tr>
      <th>보내는 사람</th>
      <td>${vo.sendId}</td>
    </tr>
    <tr>
      <th>받는 사람</th>
      <td>${vo.receiveId}</td>
    </tr>
    <tr>
      <th>메세지 제목</th>
      <td>${vo.title}</td>
    </tr>
    <tr>
      <th>메세지 내용</th>
      <td style="height: 160px;">${fn:replace(vo.content, newLine, "<br/>")}</td>
    </tr>
    <tr>
      <td colspan="2" class="text-center">
        <c:if test="${param.mFlag==11 || param.mFlag==12}">
        	<input type="button" value="답장쓰기" onclick="location.href='WebMessage.wm?mSw=0&receiveId=${vo.sendId}';" class="btn btn-success"/>
        </c:if>
        <c:if test="${param.mFlag == 15}">
        	<input type="button" value="복원하기" onclick="location.href='WmRestore.wm?idx=${vo.idx}';" class="btn btn-success"/>
        </c:if>
        <c:if test="${param.mFlag != 15}">
          <input type="button" value="휴지통으로" onclick="location.href='WmDeleteCheck.wm?idx=${vo.idx}&mFlag=${param.mFlag}';" class="btn btn-danger"/>
        </c:if>
        <input type="button" value="돌아가기" onclick="location.href='WebMessage.wm?mFlag=${param.mFlag}';" class="btn btn-warning"/>
      </td>
    </tr>
  </table>
</div>
<p><br/></p>
</body>
</html>