<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시글 수정</title>
</head>
<body>
  <%@ include file="include/header.jsp" %>

  <main class="container">
    <div class="board-edit">
      <h2>게시글 수정</h2>

      <!-- 수정 폼 -->
      <form action="contentmodifyOk.do?bnum=${bDto.bnum }" method="post">
        <!-- 게시글 번호는 hidden 처리 -->
        <input type="hidden" name="bno" value="${bDto.bnum }">
        
        <div class="form-group">
          <label for="member_name">작성자</label>
          <input type="text" id="member_name" name="member_name" value="${bDto.memberDto.member_name }" required readonly="readonly">
        </div>
        <!-- 제목 입력 -->
        <div class="form-group">
          <label for="btitle">제목</label>
          <input type="text" id="btitle" name="btitle" value="${bDto.btitle }" required>
        </div>

        <!-- 내용 입력 -->
        <div class="form-group">
          <label for="bcontent">내용</label>
          <textarea id="bcontent" name="bcontent" rows="10" style="font-size: 15px;" required>${bDto.bcontent }</textarea>
        </div>

        <!-- 버튼 영역 -->
        <div class="action-buttons">
          <button type="submit" class="cta-button edit-button">저장</button>
          <a href="boardlist.do"><button type="button" class="cta-button">취소</button></a>
        </div>
      </form>
    </div>
  </main>

  <%@ include file="include/footer.jsp" %>
</body>
</html>
