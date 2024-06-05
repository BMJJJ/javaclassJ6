<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>randomInput.jsp</title>
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
    let cnt = 1;
    
    function fCheck() {
    	let fName1 = document.getElementById("fName1").value;
    	
    	if(fName1.trim() == "") {
    		alert("업로드할 파일을 선택하세요");
    		return false;
    	}
    	
    	// 파일사이즈와 확장자 체크하기
    		if(isNaN(document.getElementById("fName1"))) {
    			let fName = document.getElementById("fName1").value;
    			if(fName != "") {
			    	let ext1 = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
	    	    if(ext1 != 'jpg' && ext1 != 'gif' && ext1 != 'png' && ext1 != 'zip' && ext1 != 'hwp' && ext1 != 'ppt' && ext1 != 'pptx' && ext1 != 'doc' && ext1 != 'pdf' && ext1 != 'xlsx' && ext1 != 'txt') {
	    		    alert("업로드 가능한 파일은 'jpg/gif/png/zip/hwp/ppt/pptx/doc/pdf/xlsx/txt'만 가능합니다.");
	    		    return false;
	    	    }
    			}
    		}
	    	myform.submit();
    	}
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="RandomInputOk.ran" class="was-validated" enctype="multipart/form-data">
    <h2 class="text-center">랜덤 장소 추가</h2>
    <br/>
		<div>
    	<input type="file" name="fName1" id="fName1" class="form-control-file border mb-2" />
    </div>
    <div id="fileBox"></div>
    <div class="mb-2">
      추천인 : ${sNickName}
    </div>
    <div class="mb-2">
      지역 : <input type="text" name="jiyok" id="jiyok" placeholder="사진의 지역을 입력하세요" class="form-control" required />
    </div>
    <div class="mb-2">
      장소 : <input type="text" name="jangso" id="jangso" placeholder="사진의 장소를 입력하세요" class="form-control" required />
    </div>
    <div class="mb-2">
      설명 : <textarea rows="4" name="story" id="story" placeholder="사진의 상세내역을 입력하세요" class="form-control"></textarea>
    </div>
    <div>
      <input type="button" value="자료올리기" onclick="fCheck()" class="btn btn-success"/>
      <input type="reset" value="다시쓰기" class="btn btn-warning"/>
      <input type="button" value="돌아가기" onclick="location.href='RandomMain.ran';" class="btn btn-info"/>
    </div>
    <input type="hidden" name="nickName" value="${sNickName}" />
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>