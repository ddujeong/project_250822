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

      <div class="content">
        <p>${bDto.bcontent }</p>
      </div>

      <c:forEach var="cDto" items="${cDtos}">
 	 <div class="comment">
    <div class="author">${cDto.member_id}</div>
    <div class="date">${cDto.cdate}</div>

    <c:choose>
      <c:when test="${not empty cnum and cDto.cnum == cnum}">
        <form action="commentmodifyOk.do" method="POST" class="inline-form">
          <input type="hidden" name="cnum" value="${cDto.cnum}" />
          <input type="hidden" name="bnum" value="${bDto.bnum}" />
          <input type="text" name="comment" value="${cDto.comment}" required="required">
          <br>
          <button type="submit">수정 완료</button>
          <button type="button" onclick="javascript:window.location.href='contentview.do?bnum=${bDto.bnum}'">취소</button>
          
        </form>
      </c:when>
      <c:otherwise>
        <div class="text">${cDto.comment}</div>
        <div class="comment-actions">
          <form action="commentmodify.do" method="GET" class="inline-form">
            <input type="hidden" name="cnum" value="${cDto.cnum}" />
            <input type="hidden" name="bnum" value="${bDto.bnum}" />
            <button type="submit">수정</button>
          </form>
          <form action="commentDelete.do" method="POST"  class="inline-form" style="display:inline;" onsubmit="return confirm('삭제하시겠습니까?');">
            <input type="hidden" name="cnum" value="${cDto.cnum}" />
            <button type="submit">삭제</button>
          </form>
        </div>
      </c:otherwise>
    </c:choose>
  </div>
</c:forEach>
    </div>
  </main>

  <%@ include file="include/footer.jsp" %>
</body>
</html>
