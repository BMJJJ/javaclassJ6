<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
     font-family: 'intelone-mono-font-family-regular';
     font-size: 14pt; 
    }
    @font-face {
    	font-family: 'intelone-mono-font-family-regular';
    	src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/intelone-mono-font-family-regular.woff2') format('woff2');
    	font-weight: 400;
    	font-style: normal;
		} 
  </style>
  <script>
  	function midFind() {
			let name = $("#name").val().trim();
			let email = $("#email").val().trim();
			let tel = $("#tel").val().trim();
			if(name == ""){
				alert("가입한 이름을 입력하세요");
				$("#name").focus();
			}
			else if(email == ""){
				alert("가입한 이메일을 입력하세요");
				$("#email").focus();
			}
			else if(tel == ""){
				alert("가입한 전화번호를 입력하세요");
				$("#tel").focus();
			}
			else {
				myform.submit();
			}
	}
  </script>
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
  				<p>이름과 이메일주소, 전화번호 동일시 아이디를 찾을수 있습니다.</p>
  			</td>
  		</tr>
  		<tr>
  			<th>이름</th>
  				<td class="currency-input">
  					<input type="text" name="name" id="name" class="form-control" autofocus required/>
  				</td>
  		</tr>
  		<tr>
  			<th>이메일</th>
  				<td class="currency-input">
  					<input type="text" name="email" id="email" class="form-control" autofocus required/>
  				</td>
  		</tr>
  		<tr>
  			<th>전화번호</th>
  				<td class="currency-input">
  					<input type="text" name="tel" id="tel" class="form-control"/>
  				</td>
  		</tr>
  		<tr>
  			<td colspan="2" class="text-center">
  				<input type="button" value="홈" onclick="location.href='${ctp}/Main';" class="btn-btn secondary mr-2"/>
  				<input type="reset" value="다시입력" class="btn-btn secondary mr-2"/>
  				<input type="button" value="다음" onclick="midFind()" class="btn-btn secondary mr-2"/>
  			</td>
  		</tr>
  	</table>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>