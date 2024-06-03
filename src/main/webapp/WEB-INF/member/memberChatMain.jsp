<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>memberChatMain.jsp</title>
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
    'use strict';
    
    // 채팅내용을 DB에 저장하기
    function chatInput() {
    	let chat = $("#chat").val();
    	if(chat.trim() != "") {
    		$.ajax({
    			url  : "MemberChatInput.mem",
    			type : "post",
    			data : {chat : chat},
    			error: function() {
    				alert("전송오류!!");
    			}
    		});
    	}
    }
    
		// 채팅 대화입력후 엔터키를 누르면 자동으로 메세지 DB에 저장시키기....chatInput()함수 호출하기
		$(function(){
			$("#chat").on("keydown",function(e){
				if(e.keyCode == 13) chatInput();
			});
		});
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<p><br/></p>
<div class="container">
  <div class="col" style="width:420px">
	    <form name="chatForm">
	      <label for="chat"><b>실시간 대화방</b></label>
	      <iframe src="${ctp}/include/memberMessage.jsp" width="100%" height="200px" class="border"></iframe>
	      <div class="input-group mt-1">
	        <input type="text" name="chat" id="chat" class="form-control" placeholder="대화내용을 입력하세요" autofocus />
	        <div class="input-group-append">
	          <input type="button" value="글등록" onclick="chatInput()" class="btn btn-success"/>
	        </div>
	      </div>
	    </form>
	    <div>
	    	ㅎㅇ
	    </div>
	  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>