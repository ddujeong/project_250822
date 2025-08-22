<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="include/header.jsp" %>
<main class="container">
  <h2>📢 공지사항</h2>
  
  <!-- 검색 기능 -->
  <div class="search-bar">
    <input type="text" id="search" placeholder="공지사항 검색..." />
    <button class="search-btn" onclick="searchNotices()">검색</button>
  </div>

  <!-- 공지사항 목록 -->
  <table class="notice-table">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td><a href="noticeview.jsp">2025년 여름 프로모션 안내</a></td>
        <td>관리자</td>
        <td>2025-08-20</td>
      </tr>
      <tr>
        <td>2</td>
        <td><a href="noticeview.jsp">새로운 PC방 할인 이벤트!</a></td>
        <td>관리자</td>
        <td>2025-08-18</td>
      </tr>
      <!-- 추가 공지사항 항목 -->
    </tbody>
  </table>

  <!-- 페이지네이션 -->
  <div class="pagination">
    <button>◀ 이전</button>
    <span>1 | 2 | 3 | 4</span>
    <button>다음 ▶</button>
  </div>
</main>
<%@ include file="include/footer.jsp" %>

</body>
</html>