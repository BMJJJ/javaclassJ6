<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>memberPwdFind.jsp</title>
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
  <script>
  	function pwdFind() {
			let mid = $("#mid").val().trim();
			let name = $("#name").val().trim();
			let email = $("#email").val().trim();
			if(mid == ""){
				alert("가입한 아이디를 입력하세요");
				$("#mid").focus();
			}
			else if(name == ""){
				alert("가입한 이름을 입력하세요");
				$("#name").focus();
			}
			else if(email == ""){
				alert("가입한 이메일를 입력하세요");
				$("#email").focus();
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
  <form name="myform" method="post" action="MemberPwdFindOk.mem">
  	<table class="table table-borderd text-center">
  		<tr>
  			<td colspan="2">
  				<h3>비밀번호 찾기</h3>
  				<p>이름과 이메일주소, 전화번호 동일시 아이디를 찾을수 있습니다.</p>
  			</td>
  		</tr>
  		<tr>
  			<th>아이디</th>
  				<td class="currency-input">
  					<input type="text" name="mid" id="mid" class="form-control" autofocus required/>
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
  					<input type="text" name="email" id="email" class="form-control"/>
  				</td>
  		</tr>
  		<tr>
  			<td colspan="2" class="text-center">
  				<input type="button" value="홈" onclick="location.href='${ctp}/Main';" class="btn-btn secondary mr-2"/>
  				<input type="reset" value="다시입력" class="btn-btn secondary mr-2"/>
  				<input type="button" value="다음" onclick="pwdFind()" class="btn-btn secondary mr-2"/>
  			</td>
  		</tr>
  	</table>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>