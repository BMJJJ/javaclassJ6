<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%	String mid= (String) request.getAttribute("mid"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Insert</title>
  <%@ include file = "/include/bs4.jsp" %>
  <style>
  	body {
     font-family: 'Ownglyph_ryurue-Rg';
     font-size: 16pt;
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
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="MemberIdFindOk.mem">
  	<table class="table table-borderd text-center">
  		<tr>
  			<td colspan="2">
  				<h3>아이디 찾기</h3>
  			</td>
  		</tr>
  		<tr>
  			<th>아이디는 ${param.mid}</th>
  			</tr>
  			<tr>
  				<td colspan="2" class="text-center">
  					<input type="button" value="로그인하기" onclick="location.href='MemberLogin.mem'" class="btn-btn-secondary mr-2"/>
  					<input type="button" value="홈" onclick="location.href='${ctp}/Main'" class="btn-btn-secondary mr-2"/>
  				</td>
  		</tr>
  	</table>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>