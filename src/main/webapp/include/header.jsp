<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />

<div id="header" class="jumbotron text-center" style="margin-bottom:0; background: url('${pageContext.request.contextPath}/images/116.jpg') no-repeat center center / cover;">
  <h1 class="header-title"></h1>
  <h2 class="header-title"></h2>
  <!--  <p>(본 사이트는 반응형으로 제작되었습니다.)</p>-->
</div>
<style>
  .header-title {
    color: white;
    font-family: 'Arial', sans-serif;
    font-size: 3rem;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    margin-top: 0;
    padding-top: 20px;
    padding-bottom: 20px;
  }
</style>
<script>
	$(function () {
		$("#header").on("click",function() {
			location.href = "http://192.168.50.69:9090/javaclassJ6/Main";
		});
	});
</script>