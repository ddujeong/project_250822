<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시판</title>
</head>
<body>
  <%@ include file="include/header.jsp" %>
  
  <main class="container">
    <h2>게시글 목록</h2>

    <!-- 게시글 작성 버튼 (로그인한 경우만 보여줌) -->
    <c:if test="${not empty user}">
      <a href="write.jsp" class="cta-button">새 글 작성</a>
    </c:if>

    <!-- 게시글 목록 -->
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
          <td><a href="contentview.jsp?id=1">첫 번째 게시글</a></td>
          <td>김철수</td>
          <td>2025-08-20</td>
        </tr>
        <tr>
          <td>2</td>
          <td><a href="contentview.jsp?id=2">두 번째 게시글</a></td>
          <td>이영희</td>
          <td>2025-08-19</td>
        </tr>
        <!-- 추가 게시글 항목 -->
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
