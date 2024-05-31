<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberJoin.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <style>
  	body {
     font-family: 'Ownglyph_ryurue-Rg';
     font-size: 16pt;
    }
    .container {
      max-width: 600px;
      margin: auto;
      padding: 20px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
      border-radius: 15px;
      background-color: #ffffff;
    }
    .form-group {
      margin-bottom: 20px;
    }
    .form-control {
      border-radius: 10px;
      border: 1px solid #ced4da;
      padding: 10px;
    }
    .form-control-file {
      border-radius: 10px;
      border: 1px solid #ced4da;
      padding: 10px;
    }
    .btn {
      border-radius: 10px;
      padding: 10px 20px;
      font-size: 16px;
    }
    .btn-secondary {
      background-color: #6c757d;
      border-color: #6c757d;
    }
    .btn-secondary:hover {
      background-color: #5a6268;
      border-color: #545b62;
    }
    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
    }
    .btn-primary:hover {
      background-color: #0056b3;
      border-color: #004085;
    }
    .input-group-text {
      border-radius: 10px 0 0 10px;
      border: 1px solid #ced4da;
    }
    .custom-select {
      border-radius: 0 10px 10px 0;
      border: 1px solid #ced4da;
    }
    .input-group-append .btn {
      border-radius: 0 10px 10px 0;
    }
    .form-check-input {
      margin-top: 0.3rem;
    }
    #photoDemo {
      margin-top: 10px;
      border-radius: 10px;
      border: 1px solid #ced4da;
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
    
    let idCheckSw = 0;
    let nickCheckSw = 0;
    
    function fCheck() {
    	// 유효성 검사
    	
    	// 정규식을 이용한 유효성검사처리.....
    	let regMid = /^[a-zA-Z0-9_]{4,20}$/;	// 아이디는 4~20의 영문 대/소문자와 숫자와 밑줄 가능
    	let regPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;	// 비밀번호 8~16의 영문 대/소문자와 특수문자 숫자와 밑줄 가능
      let regNickName = /^[가-힣0-9]+$/;					// 닉네임은 한글, 숫자 만 가능
      let regName = /^[가-힣a-zA-Z]+$/;				// 이름은 한글/영문 가능
      let regEmail = /^[a-zA-Z0-9_]{4,20}$/; // 4~20의 영문 대/소문자와 숫자와 밑줄 가능
    	
    	
    	// 검사를 끝내고 필요한 내역들을 변수에 담아 회원가입처리한다.
    	let mid = myform.mid.value.trim();
    	let pwd = myform.pwd.value.trim();
    	let nickName = myform.nickName.value;
    	let name = myform.name.value;
    	
    	let email1 = myform.email1.value.trim();
    	let email2 = myform.email2.value;
    	let email = email1 + "@" + email2;
    	
    	let tel1 = myform.tel1.value;
    	let tel2 = myform.tel2.value.trim();
    	let tel3 = myform.tel3.value.trim();
    	let tel = tel1 + "-" + tel2 + "-" + tel3;
    	
    	let postcode = myform.postcode.value + " ";
    	let roadAddress = myform.roadAddress.value + " ";
    	let detailAddress = myform.detailAddress.value + " ";
    	let extraAddress = myform.extraAddress.value + " ";
    	let address = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress;
    	
     	if(!regMid.test(mid)) {
    		alert("아이디는 4~20자리의 영문 소/대문자와 숫자, 언더바(_)만 사용가능합니다.");
    		myform.mid.focus();
    		return false;
    	}
    	else if(!regPwd.test(pwd)) {
        alert("비밀번호는 8~16자리의 영문 대/소문자와 특수문자 하나를 꼭 포함해 주세요.");
        myform.pwd.focus();
        return false;
      }
      else if(!regNickName.test(nickName)) {
        alert("닉네임은 한글과 숫자만 사용가능합니다.");
        myform.nickName.focus();
        return false;
      }
      else if(!regName.test(name)) {
        alert("성명은 한글과 영문대소문자만 사용가능합니다.");
        myform.name.focus();
        return false;
      }
      else if(!regEmail.test(email1)) {
        alert("이메일은 4~20의 영문 대/소문자와 숫자와 밑줄 가능");
        myform.email1.focus();
        return false;
      }
			 
			
			// 전화번호 형식 체크
			if(tel2 != "" && tel3 != "") {
				// 전화번호 정규화 체크
			}
			else {
				tel2 = " ";
				tel3 = " ";
				tel = tel1 + "-" + tel2 + "-" + tel3;
			}
			
			let fName = document.getElementById("file").value;
			if(fName.trim() != "") {
				let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
				let maxSize = 1024 * 1024 * 5;
				let fileSize = document.getElementById("file").files[0].size;
				
				if(ext != 'jpg' && ext != 'gif' && ext != 'png') {
					alert("그림파일만 업로드 가능합니다.");
					return false;
				}
				else if(fileSize > maxSize) {
					alert("업로드할 파일의 최대용량은 5MByte입니다.");
					return false;
				}
			}
			else return false;			
    	
			
			
    	if(idCheckSw == 0) {
    		alert("아이디 중복체크버튼을 눌러주세요");
    		document.getElementById("midBtn").focus();
    	}
    	else if(nickCheckSw == 0) {
    		alert("닉네임 중복체크버튼을 눌러주세요");
    		document.getElementById("nickNameBtn").focus();
    	}
    	else {
    		myform.email.value = email;
    		myform.tel.value = tel;
    		myform.address.value = address;
    		
    		myform.submit();
    	}
    }
    
    // 아이디 중복체크
    function idCheck() {
    	let mid = myform.mid.value;
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요!");
    		myform.mid.focus();
    	}
    	else {
    		idCheckSw = 1;
    		
    		$.ajax({
    			url  : "${ctp}/MemberIdCheck.mem",
    			type : "get",
    			data : {mid : mid},
    			success:function(res) {
    				if(res != '0') {
    					alert("이미 사용중인 아이디 입니다. 다시 입력하세요.");
    					myform.mid.focus();
    				}
    				else alert("사용 가능한 아이디 입니다.");
    			},
    			error : function() {
    				alert("전송 오류!");
    			}
    		});
    	}
    }
    
    //비밀번호 일치체크
    function pwdCheck(){
    if($('#pwd').val() == $('#pwd2').val()){
        $('#pwdConfirm').text('비밀번호 일치').css('color', 'green')
    }else{
        $('#pwdConfirm').text('비밀번호 불일치').css('color', 'red')
    }
}
    
    
    // 닉네임 중복체크
    function nickCheck() {
    	let nickName = myform.nickName.value;
    	
    	if(nickName.trim() == "") {
    		alert("닉네임을 입력하세요!");
    		myform.nickName.focus();
    	}
    	else {
    		nickCheckSw = 1;
    		
    		$.ajax({
    			url  : "${ctp}/MemberNickCheck.mem",
    			type : "get",
    			data : {nickName : nickName},
    			success:function(res) {
    				if(res != '0') {
    					alert("이미 사용중인 닉네임 입니다. 다시 입력하세요.");
    					myform.nickName.focus();
    				}
    				else alert("사용 가능한 닉네임 입니다.");
    			},
    			error : function() {
    				alert("전송 오류!");
    			}
    		});
    	}
    }
    
    
    // 주소 선택시 주소API 호출
    function addressCheck() {
    	new daum.Postcode({
    		oncomplete: function(data) {
    			let addr = ''; // 주소 변수
    			let extraAddr = ''; // 참고항목 변수
    			
    			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
    			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
    				addr = data.roadAddress;
    			} 
    			else { // 사용자가 지번 주소를 선택했을 경우(J)
    				addr = data.jibunAddress;
    			}

    			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
    			if(data.userSelectedType === 'R'){
    				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
    				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
    				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
    					extraAddr += data.bname;
    				}
    				// 건물명이 있고, 공동주택일 경우 추가한다.
    				if(data.buildingName !== '' && data.apartment === 'Y'){
    					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
    				}
    				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
    				if(extraAddr !== ''){
    					extraAddr = ' (' + extraAddr + ')';
    				}
    				// 조합된 참고항목을 해당 필드에 넣는다.
    				document.getElementById("extraAddress").value = extraAddr;
    			
    			} else {
    				document.getElementById("extraAddress").value = '';
    			}

    			// 우편번호와 주소 정보를 해당 필드에 넣는다.
    			document.getElementById('postcode').value = data.zonecode;
    			document.getElementById("roadAddress").value = addr;
    			document.getElementById("jibunAddress").value = data.jibunAddress;
    			
    			// 커서를 상세주소 필드로 이동한다.
    			document.getElementById("detailAddress").focus();
    		}
    	}).open();
    }
    
    // 선택된 사진 미리보기
    function imgCheck(e) {
    	if(e.files && e.files[0]) {
    		let reader = new FileReader();
    		reader.onload = function(e) {
    			document.getElementById("photoDemo").src = e.target.result;
    		}
    		reader.readAsDataURL(e.files[0]);
    	}
    } 
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<jsp:include page="/include/header.jsp" />
<p><br/></p>
  <div class="container mt-5">
    <h1 class="mb-4 text-center">회원가입</h1>
    <form name="myform" action="${ctp}/MemberJoinOk.mem" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label for="mid">아이디</label>
        <div class="input-group">
          <input type="text" class="form-control" name="mid" id="mid" required>
          <div class="input-group-append">
            <button class="btn btn-secondary" type="button" id="midBtn" onclick="idCheck()">중복체크</button>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label for="pwd">비밀번호</label>
        <input type="password" class="form-control" name="pwd" id="pwd" required>
      </div>
      <div class="form-group">
        <label for="pwd2">비밀번호 확인</label>
        <input type="password" class="form-control" id="pwd2" required onkeyup="pwdCheck()">
        <small id="pwdConfirm" class="form-text"></small>
      </div>
      <div class="form-group">
        <label for="nickName">닉네임</label>
        <div class="input-group">
          <input type="text" class="form-control" name="nickName" id="nickName" required>
          <div class="input-group-append">
            <button class="btn btn-secondary" type="button" id="nickNameBtn" onclick="nickCheck()">중복체크</button>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label for="name">성명</label>
        <input type="text" class="form-control" name="name" id="name" required>
      </div>
      <div class="form-group">
        <label for="gender">성별</label>
        <div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" id="male" value="남자">
            <label class="form-check-label" for="male">남자</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" id="female" value="여자">
            <label class="form-check-label" for="female">여자</label>
          </div>
        </div>
      </div>
      <div class="form-group">
      	<label for="birthday">생일</label>
      	<input type="date" name="birthday" value="<%=java.time.LocalDate.now() %>" class="form-control"/>
    </div>
      <div class="form-group">
        <label for="email1">이메일</label>
        <div class="input-group">
          <input type="text" id="email1" name="email1" class="form-control" required>
          <div class="input-group-append">
            <span class="input-group-text">@</span>
          </div>
          <select id="email2" name="email2" class="form-control">
            <option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
            <option value="gmail.com">gmail.com</option>
            <option value="nate.com">nate.com</option>
            <option value="hotmail.com">hotmail.com</option>
            <option value="hanmail.net">hanmail.net</option>
          </select>
        </div>
      </div>
      <div class="form-group">
        <label for="tel1">전화번호</label>
        <div class="input-group">
          <select class="custom-select" name="tel1" id="tel1">
            <option value="010">010</option>
            <option value="011">011</option>
            <option value="02">02</option>
            <option value="031">031</option>
          </select>
          <input type="text" class="form-control" name="tel2" id="tel2" required>
          <input type="text" class="form-control" name="tel3" id="tel3" required>
        </div>
      </div>
      <div class="form-group">
        <label for="address">주소</label>
        <div class="input-group">
          <input type="text" class="form-control" name="postcode" id="postcode" readonly required>
          <div class="input-group-append">
            <button class="btn btn-secondary" type="button" onclick="addressCheck()">주소검색</button>
          </div>
        </div>
        <input type="text" class="form-control mt-2" name="roadAddress" id="roadAddress" readonly required>
        <input type="text" class="form-control mt-2" name="jibunAddress" id="jibunAddress" readonly required>
        <input type="text" class="form-control mt-2" name="detailAddress" id="detailAddress" placeholder="상세주소" required>
        <input type="text" class="form-control mt-2" name="extraAddress" id="extraAddress" readonly>
      </div>
      <div class="form-group">
      	<div class="form-check-inline">
        	<span class="input-group-text">정보공개</span>  &nbsp; &nbsp;
        	<label class="form-check-label">
          <input type="radio" class="form-check-input" name="userInfor" value="공개" checked/>공개
        	</label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="userInfor" value="비공개"/>비공개
        </label>
      </div>
    </div>
       <div  class="form-group">
      	회원 사진(파일용량:2MByte이내) :
      	<input type="file" name="fName" id="file" onchange="imgCheck(this)" class="form-control-file border"/>
       	<div><img id="photoDemo" width="100px"/></div>
    </div>
      <div class="text-center">
      	<button type="button" class="btn btn-secondary" onclick="fCheck()">회원가입</button> &nbsp;
    		<button type="reset" class="btn btn-secondary">다시작성</button> &nbsp;
    		<button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/MemberLogin.mem';">돌아가기</button>
      </div>
      <input type="hidden" name="email" />
    	<input type="hidden" name="tel" />
    	<input type="hidden" name="address" />
    </form>
  </div>
  <p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
