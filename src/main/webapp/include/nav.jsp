<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
  int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
  pageContext.setAttribute("level", level);
%>
<script>
	'use strict';
	
	function notLogin() {
		alert("로그인이 필요합니다.");
		location.href = "${ctp}/MemberLogin.mem";
	}
</script>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="http://192.168.50.69:9090/javaclassJ6/Main">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${empty sMid ? 'javascript:notLogin()' : '${ctp}/GuestList.gu'}">지도</a>
      </li>
			<c:if test="${level <= 4}">
	      <li class="nav-item">
	        <a class="nav-link" href="BoardList.bo">산책로게시판</a>
	      </li>
	    </c:if>
      <c:if test="${level <= 4 && (level > 2 || level == 0)}">
	      <li class="nav-item">
	        <a class="nav-link" href="PdsList.pds">사진 공유방</a>
	      </li>    
	      <li class="nav-item mr-2">
				  <div class="dropdown">
				    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">게시판</button>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="BoardList.bo">게시판</a>
				    </div>
				  </div>
	      </li>
	      <li class="nav-item mr-2">
				  <div class="dropdown">
				    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">Study2</button>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="${ctp}/study/password/passCheck.jsp">비밀번호암호화</a>
				    </div>
				  </div>
	      </li>
      </c:if>
      <c:if test="${level <= 4}">
	      <li class="nav-item mr-2">
				  <div class="dropdown">
				    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">MyPage</button>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="MemberMain.mem">회원메인방</a>
				      <c:if test="${level <= 4 && (level > 1 || level == 0)}">
					      <a class="dropdown-item" href="Schedule.sc">일정관리</a>
					      <a class="dropdown-item" href="#">메세지관리</a>
				      	<a class="dropdown-item" href="MemberList.mem">회원리스트</a>
				      </c:if>
				      <a class="dropdown-item" href="MemberPwdCheck.mem">회원정보수정</a>
				      <a class="dropdown-item" href="MemberDelete.mem">회원탈퇴</a>
				      <c:if test="${sLevel == 0}"><a class="dropdown-item" href="AdminMain.ad">관리자메뉴</a></c:if>
				    </div>
				  </div>
	      </li>
	    </c:if>
      <li class="nav-item">
				<c:if test="${level <= 4}"><a class="nav-link" href="${ctp}/MemberLogout.mem">Logout</a></c:if>
        <c:if test="${level > 4}"><a class="nav-link" href="${ctp}/MemberLogin.mem">Login</a></c:if>
      </li>    
      <li class="nav-item">
        <c:if test="${level > 4}"><a class="nav-link" href="${ctp}/MemberJoin.mem">회원가입</a></c:if>
      </li>
    </ul>
  </div>  
</nav>