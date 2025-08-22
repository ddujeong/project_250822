<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>새 글 작성</title>
</head>
<body>
<%@ include file="include/header.jsp" %>
  
  <main class="container">
    <h2>새 글 작성</h2>

    <!-- 게시글 작성 폼 -->
    <form action="write_action.jsp" method="post">
      <label for="title">제목</label>
      <input type="text" id="title" name="title" required>
     
	  <label for="title">작성자</label>
      <input type="text" id="title" name="title" required>

      <label for="content">내용</label>
      <textarea id="content" name="content" rows="10" required></textarea>

      <button type="submit" class="cta-button">작성 완료</button>
    </form>
  </main>

<%@ include file="include/footer.jsp" %>
</body>
</html>
