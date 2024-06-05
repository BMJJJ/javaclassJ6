<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- <%@ include file = "/include/certification.jsp" %> --%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>memberMain.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <style>
    body {
    font-family: 'intelone-mono-font-family-regular';
     font-size: 12pt; 
     background-color: beige;
    }
    
    .container {
      margin-top: 30px;
      background-color: #ffffff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h2, h5 {
      color: #037367;
    }

    p {
      font-size: 18px;
      line-height: 1.5;
    }

    hr {
      border: 1px solid #007bff;
      margin: 20px 0;
    }

    .row {
      display: flex;
      align-items: center;
      justify-content: space-between;
      flex-wrap: wrap;
    }

    .col {
      flex: 1;
      padding: 10px;
    }

    .col img {
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      max-width: 100%;
      height: auto;
    }

    .col:first-child {
      padding-right: 20px;
    }

    .col:last-child {
      text-align: center;
    }

    .highlight {
      color: #007bff;
      font-weight: bold;
    }

    .level {
      color: #dc3545;
      font-weight: bold;
    }

    @media (max-width: 768px) {
      .row {
        flex-direction: column;
        text-align: center;
      }
      
      .col {
        padding: 10px 0;
      }
      
      .col:first-child {
        padding-right: 0;
      }
    }
    @font-face {
    	font-family: 'intelone-mono-font-family-regular';
    	src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/intelone-mono-font-family-regular.woff2') format('woff2');
    	font-weight: 400;
    	font-style: normal;
		} 
  </style>
</head>
<body>
  <jsp:include page="/include/nav.jsp" />
  <p><br/></p>
  <div class="container">
    <h2>회원 전용방</h2>
    <hr/>
    <div class="row">
      <div class="col">
        <p>현재 <b><span class="highlight">${sNickName}</span>(<span class="level">${strLevel}</span>)</b> 님이 로그인 중이십니다.</p>
        <p>총 방문횟수 : <b>${mVo.visitCnt}</b> 회</p>
        <p>오늘 방문횟수 : <b>${mVo.todayCnt}</b> 회</p>
      </div>
      <div class="col">
        <p><img src="${ctp}/images/member/${mVo.photo}" width="200px"/></p>
      </div>
    </div>
      <div class="col text-center">
	    <b>신규 메세지(<font color='red'><b>${wmCnt}</b></font>건)</b>
	    <span style="font-size:11px">...<a href="WebMessage.wm">more</a></span>
      <c:if test="${wmCnt != 0}">
		    <table class="table table-bordered table-hover text-center">
		      <tr class="table-dark text-dark">
		        <th>번호</th>
		        <th>아이디</th>
		        <th>보낸날짜</th>
		      </tr>
			    <c:forEach var="vo" items="${wmVos}" varStatus="st">
			      <c:if test="${st.count <= 3}">
				      <tr>
				        <td>${st.count}</td>
				        <td>${vo.sendId}</td>
				        <td>${fn:substring(vo.sendDate,0,16)}</td>
				      </tr>
			      </c:if>
			    </c:forEach>
			    <tr><td colspan="3" class="m-0 p-0"></td></tr>
		    </table>
      </c:if>
      <hr/>
      <div>
        오늘의 일정이 <font color='blue'><b><a href="ScheduleMenu.sc?ymd=${ymd}">${scheduleCnt}</a></b></font>건 있습니다.
      </div>
	  </div>
  <hr/>
  <div>
  	<h5>활동내역</h5>
    <p>방명록에 올린글수 : <b>${guestCnt}</b> 건</p>  <!-- 방명록에 올린이가 '성명/아이디/닉네임'과 같은면 모두 같은 사람이 올린글로 간주한다. -->
    <p>게사판에 올린글수 : <b>${boardCnt}</b> 건</p>
    <p>자료실에 올린글수 : <b>${pdsCnt}</b> 건</p>
  </div>
 </div>
  <p><br/></p>
  <jsp:include page="/include/footer.jsp" />
</body>
</html>
