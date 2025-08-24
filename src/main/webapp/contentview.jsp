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
      <h2>${bDto.btitle }</h2>
      <div class="info">
        <span>작성자: ${bDto.memberDto.member_name }</span>
        <span>작성일: ${bDto.bdate }</span>
        <span>조회수: ${bDto.bhit }</span>
      </div>

      <!-- 게시글 본문 내용 -->
      <div class="content">
        <p>${bDto.bcontent }</p>
      </div>

      <!-- 수정, 삭제 버튼 -->
      <div class="action-buttons">
      <a href="boardlist.do">
        <button class="cta-button" onclick="goBack()">목록으로 돌아가기</button></a>
        <c:if test="${sessionScope.user_id == bDto.member_id || sessionScope.user_id == 'admin'}">
       <a href="contentmodify.do?bnum=${bDto.bnum }">
        <button class="cta-button edit-button">수정</button></a>
       <a href="delete.do?bnum=${bDto.bnum }">
        <button class="cta-button delete-button" onclick="alert('삭제하시겠습니까?')" >삭제</button></a>
        </c:if>
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
