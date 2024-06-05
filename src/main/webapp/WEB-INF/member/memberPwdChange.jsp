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
  	function pwdChange() {
			let pwd = $("#pwd").val().trim();
			let pwd2 = $("#pwd2").val().trim();
			if(pwd == ""){
				alert("새 비밀번호를 입력해주세요");
				$("#pwd").focus();
			}
			else if(pwd2 == ""){
				alert("한번 더 입력해주세요");
				$("#pwd2").focus();
			}
			else if(pwd != pwd2){
				alert("비밀번호가 일치하지 않습니다.");
				$("#pwd2").focus();
				return false;
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
  <form name="myform" method="post" action="MemberPwdChangeOk.mem">
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
  			<th>새 비밀번호</th>
  				<td class="currency-input">
  					<input type="password" name="pwd" id="pwd" class="form-control" autofocus required/>
  				</td>
  		</tr>
  		<tr>
  			<th>비밀번호 확인</th>
  				<td class="currency-input">
  					<input type="password" name="pwd2" id="pwd2" class="form-control"/>
  				</td>
  		</tr>
  		<tr>
  			<td colspan="2" class="text-center">
  				<input type="button" value="홈" onclick="location.href='${ctp}/Main';" class="btn-btn secondary mr-2"/>
  				<input type="reset" value="다시입력" class="btn-btn secondary mr-2"/>
  				<input type="button" value="다음" onclick="pwdChange()" class="btn-btn secondary mr-2"/>
  			</td>
  		</tr>
  	</table>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>