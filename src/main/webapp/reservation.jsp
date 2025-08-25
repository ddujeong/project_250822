<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 String msg = request.getParameter("msg");
 if(msg != null){
	 if("5".equals(msg)){
 		out.println("<script>alert('지난 날짜는 예약 할 수 없습니다')</script>");
	 }
 }
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>EZPC - 좌석 예약</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<%@ include file="include/header.jsp" %>

  <main class="container">
    <h2>🎮 좌석 예약</h2>

    <!-- 날짜 및 시간 선택 -->
    <form id="reservation-form" action="reservationOk.do" method="GET" class="reserve-form">
 	
  <label for="rdate">날짜 선택</label>
  <input type="date" id="rdate" name="rdate" required />

  <label for="rtime">시간 선택</label>
  <input type="time" id="rtime" name="rtime" required />

  <!-- 좌석 선택 (라디오 버튼으로 처리) -->
  <h3>좌석 선택</h3>
<div class="seat-map">
  <div class="row">
    <input type="radio" name="seat" value="A1" id="A1" required />
    <label for="A1" class="seat">A1</label>

    <input type="radio" name="seat" value="A2" id="A2" />
    <label for="A2" class="seat">A2</label>

    <input type="radio" name="seat" value="A3" id="A3" />
    <label for="A3" class="seat">A3</label>

    <input type="radio" name="seat" value="A4" id="A4" />
    <label for="A4" class="seat">A4</label>
  </div>

  <div class="row">
    <input type="radio" name="seat" value="B1" id="B1" />
    <label for="B1" class="seat">B1</label>

    <input type="radio" name="seat" value="B2" id="B2" />
    <label for="B2" class="seat">B2</label>

    <input type="radio" name="seat" value="B3" id="B3" />
    <label for="B3" class="seat">B3</label>

    <input type="radio" name="seat" value="B4" id="B4" />
    <label for="B4" class="seat">B4</label>
  </div>
</div>
  <button type="submit" class="cta-button">예약하기</button>
</form>
</main>
<%@ include file="include/footer.jsp" %>
</body>
</html>
