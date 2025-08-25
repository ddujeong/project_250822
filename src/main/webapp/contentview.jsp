<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
      <c:forEach var="cDto" items="${cDtos }">
      <div class="comment">
        <div class="author">${cDto.member_id }</div>
        <div class="date">${cDto.cdate }</div>
        <div class="text">${cDto.comment }</div>
        <div class="comment-actions">
         <form action="commentmodify.do" method="GET" class="inline-form">
    		 <input type="hidden" name="cnum" value="${cDto.cnum}" />
    		 <input type="hidden" name="bnum" value="${bDto.bnum}" />
     		 <button type="submit">수정</button>
 		 </form>
 		 <form action="commentdelete.do?cnum=${cDto.cnum}" method="POST" class="inline-form" onsubmit="return confirm('댓글을 삭제하시겠습니까?');">
     		 <input type="hidden" name="cnum" value="${cDto.cnum}" />
     		 <input type="hidden" name="bnum" value="${bDto.bnum}" />
    		 <button type="submit">삭제</button>
   		 </form>
    </div>
      </div>
      </c:forEach>
      <!-- 댓글 작성 폼 -->
      <form class="comment-form" action="commentOk.do?bnum=${bDto.bnum}" method="POST">
     	 <input type="hidden" name="bnum" value="${bDto.bnum}" />
     	 <c:choose>
     	 <c:when test="${not empty user_id|| sessionScope.user_id != null }">
        <textarea name="comment" placeholder="댓글을 작성해주세요..." required="required"></textarea>
        <button type="submit" class="cta-button">댓글 작성</button>
        </c:when>
        <c:otherwise>
         <textarea name="comment" placeholder="로그인 후 댓글 작성 가능합니다" required="required" readonly="readonly"></textarea>
        </c:otherwise>
        </c:choose>
        </form>
    </div>
  </main>

  <%@ include file="include/footer.jsp" %>
</body>
</html>
