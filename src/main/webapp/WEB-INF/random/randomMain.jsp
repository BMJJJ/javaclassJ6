<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>산책로 랜덤추천</title>
  <%@ include file = "/include/bs4.jsp" %>
 <style>
 	body {
    	font-family: 'Ownglyph_ryurue-Rg';
    	font-size: 16pt;
    	background-color: beige;
    }
    
    .container {
      max-width: 900px;
      margin: 0 auto;
      padding: 20px;
      font-family: 'NEXON Lv1 Gothic OTF';
      color: #7a6856;
    }
    .member-card {
      display: flex;
      border: 1px solid #d0c2b0;
      border-radius: 8px;
      padding: 20px;
      margin: 20px;
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      transition: transform 0.2s;
    }
    .member-card:hover {
      transform: scale(1.02);
    }
    .profile-photo {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      margin-right: 20px;
      object-fit: cover;
    }
    .member-info p {
      margin: 5px 0;
    }
    .languages {
      display: flex;
      align-items: center;
    }
    .languages span {
      border: 1px solid #ddd;
      border-radius: 4px;
      padding: 5px;
    }
    .languages img {
      width: 30px;
      height: auto;
      border-radius: 4px;
      margin: 0 5px;
    }
    .member-info > p, .languages {
      margin-bottom: 10px;
    }
    .refresh-button {
      padding: 10px 20px;
      border: none;
      /* border-radius: 4px; */
      cursor: pointer;
      color: white;
    }
    .refresh-button {
      background-color: #35ae5f;
      display: block;
      margin: 20px auto;
    }
     h1 {
      text-align: center;
      /* margin-bottom: 30px; */
      font-family: 'CWDangamAsac-Bold';
      color: #35ae5f;
    }
     h5 {
      color: #6d5a46;
    }
    .message-button {
      padding: 7px 16px;
      border: none;
      background-color: #e0dac3;
      font-size: 14px; 
      color: #5e503f; /* 색상 앞에 # 추가 */
      border: 1px solid #d0c2b0;
      border-radius: 10px; 
      cursor: pointer;
      transition: background-color 0.3s, color 0.3s;
    }
     p img {
      width: 25px;
      height: auto; /* 원본 비율 유지 */
      /* border-radius: 4px; */
     /*  margin: 0 5px; */
    }
    .message-button:hover {
      background-color: #d7d1b9;
      color: #322d27;
    }
    .refresh-button:hover {
      background-color: #3ba661;
      color: #fefef4;
    }
    .highlight {
        background-color: #fdfad1;
      padding: 2px 4px;
    }
    a {
         text-decoration: none;
    }
     @font-face {
      font-family: 'Ownglyph_ryurue-Rg';
      src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-2@1.0/Ownglyph_ryurue-Rg.woff2') format('woff2');
      font-weight: normal;
      font-style: normal;
    }
  </style>
</head>
<jsp:include page="/include/nav.jsp" />
<body>
  <main class="container">
    <div class="container">
      <h1>산책로 랜덤 추천</h1>
        <div class="member-card" >
          <img src="${ctp}/images/place/${vo.img}" class="profile-photo" />
          <div class="member-info">
            <h5>추천인 : <b class="highlight">${vo.nickName}</b></h5>
            <h5>지역 : <b class="highlight">${vo.jiyok}</b></h5>
            <h5>장소 : <b class="highlight">${vo.jangso}</b></h5>
            <span>설명 : ${vo.story}</span>
          </div>
        </div>
 
      <button class="refresh-button" onclick="location.href='${ctp}/RandomMain.ran'">어디가지</button>
    </div>
  </main>
  <p><br/></p>
  <!-- Footer-->
  <jsp:include page="/include/footer.jsp" />
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 