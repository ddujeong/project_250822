<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시판 상세보기</title>
</head>
<body>
  <%@ include file="include/header.jsp" %>

  <main class="container">
    <!-- 게시판 상세 내용 -->
    <div class="board-detail">
      <h2>게시글 제목</h2>
      <div class="info">
        <span>작성자: 홍길동</span>
        <span>작성일: 2025-08-22</span>
        <span>조회수: 150</span>
      </div>

      <!-- 게시글 본문 내용 -->
      <div class="content">
        <p>안녕하세요! 이번 주 금요일에 예정된 특별 이벤트에 대한 안내입니다...</p>
        <p>이벤트 시간과 장소는 아래와 같습니다. 많은 참여 부탁드립니다!</p>
      </div>

      <!-- 수정, 삭제 버튼 -->
      <div class="action-buttons">
        <button class="cta-button edit-button">수정</button>
        <button class="cta-button delete-button">삭제</button>
      </div>
    </div>

    <!-- 댓글 섹션 -->
    <div class="comments-section">
      <h3>댓글</h3>
      
      <!-- 댓글 1 -->
      <div class="comment">
        <div class="author">사용자1</div>
        <div class="date">2025-08-22</div>
        <div class="text">이번 이벤트 정말 기대돼요!</div>
      </div>

      <!-- 댓글 2 -->
      <div class="comment">
        <div class="author">사용자2</div>
        <div class="date">2025-08-22</div>
        <div class="text">참여할 수 있어서 기뻐요, 감사합니다!</div>
      </div>

      <!-- 댓글 작성 폼 -->
      <div class="comment-form">
        <textarea placeholder="댓글을 작성해주세요..."></textarea>
        <button class="cta-button">댓글 작성</button>
      </div>
    </div>
  </main>

  <%@ include file="include/footer.jsp" %>
</body>
</html>
