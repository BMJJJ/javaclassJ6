<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />

<div id="header" class="jumbotron text-center" style="margin-bottom:0; background: url('${pageContext.request.contextPath}/images/126.jpg') no-repeat center center / cover")>
  <!-- <h1><font color="#5B7D87">민재네 집에 오신것을 환영합니다.</font></h1>-->
  <!--  <p>(본 사이트는 반응형으로 제작되었습니다.)</p>-->
</div>
<script>
	$(function () {
		$("#header").on("click",function() {
			location.href = "http://192.168.50.69:9090/javaclassJ100/Main";
		});
	});
</script>