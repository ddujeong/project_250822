package com.ddu.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import com.ddu.dao.BoardDao;
import com.ddu.dao.CommentDao;
import com.ddu.dao.MemberDao;
import com.ddu.dao.ReservationDao;
import com.ddu.dto.BoardDto;
import com.ddu.dto.CommentDto;
import com.ddu.dto.MemberDto;
import com.ddu.dto.ReservationDto;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final int PAGE_GROUP_SIZE = 5;
       
    public MemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uri =request.getRequestURI();
		System.out.println("URI : " + uri);
		String conPath =request.getContextPath();
		System.out.println("CONPATH : " + conPath );
		
		String comm =(uri.substring(conPath.length())); // 최종 요청 값
		HttpSession session =null;
		String viewPage = "";
		
		MemberDao mdao = new MemberDao();
		BoardDao bDao = new BoardDao();
		ReservationDao rDao = new ReservationDao();
		CommentDao cDao = new CommentDao();
		List<BoardDto> bDtos = new ArrayList<BoardDto>();
		List<CommentDto>cDtos = new ArrayList<CommentDto>();
		List<ReservationDto>rDtos = new ArrayList<ReservationDto>();
		
		if(comm.equals("/signup.do")) {
			viewPage="signup.jsp";
		}
		if(comm.equals("/signupOk.do")) {
			String mid =request.getParameter("member_id");
			String mpw =request.getParameter("member_pw");
			String mname =request.getParameter("member_name");
			String memail =request.getParameter("member_email");
			
			MemberDto mDto = new MemberDto();
			mDto.setMember_id(mid);
			mDto.setMember_pw(mpw);
			mDto.setMember_name(mname);
			mDto.setMember_email(memail);
			
//			System.out.println(mid);
			int idCheck = mdao.confirmId(mDto.getMember_id());
			System.out.println(idCheck);
			
			if (idCheck == MemberDao.MEMBER_ID_EXISTENT) {
				request.setAttribute("msg", "1");
				viewPage ="signup.jsp";
			}else {
				int joinResult = mdao.joinMember(mDto);
				if (joinResult == MemberDao.MEMBER_JOIN_SUCCESS) {
					request.setAttribute("msg", "2");
					request.setAttribute("mDto", mDto);
					viewPage = "login.jsp";
				} else {
					request.setAttribute("msg", "3");
				}
			}
		} else if(comm.equals("/login.do")) {
			viewPage = "login.jsp";
		} else if(comm.equals("/loginOk.do")) {
			request.setCharacterEncoding("utf-8");
			String login_id = request.getParameter("user_id");
			String login_pw = request.getParameter("user_pw");
			
			int loginFlag = mdao.loginCheck(login_id, login_pw); 
			//로그인 성공이면 1, 실패면 0이 반환
			if(loginFlag == 1) {
				session = request.getSession();
				session.setAttribute("user_id", login_id);
			} else {
				response.sendRedirect("login.do?msg=1");
				return;
			}
			viewPage = "index.do";
		} else if (comm.equals("/logout.do")) { 
			session =request.getSession();
			session.invalidate();
			viewPage = "index.jsp";
		} else if (comm.equals("/mypage.do")) { // 글 내용 확인 요청
			request.setCharacterEncoding("utf-8");
			session = request.getSession();
			String user_id = null;
			
			if (session == null ) {
				response.sendRedirect("login.jsp?msg=4");
				return;
			}
			user_id = (String) session.getAttribute("user_id");
			if (user_id == null) {
				response.sendRedirect("login.jsp?msg=4");
				return;
			}
			MemberDto mDto = mdao.memberInfo(user_id);
			rDtos = rDao.reserveCheck(user_id);
			
			request.setAttribute("mDto", mDto);
			request.setAttribute("rDtos", rDtos);
			System.out.println(rDtos.size());
			viewPage = "mypage.jsp";
		} else if (comm.equals("/modifymember.do")) { // 글 수정 후 글내용 보기로 이동 요청
			request.setCharacterEncoding("utf-8");
			
			MemberDto mDto = new MemberDto();
			
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			String user_name = request.getParameter("user_name");
			String user_email = request.getParameter("user_email");
			
			mdao.memberModify(user_pw, user_name, user_email, user_id);
			
			mDto = mdao.memberInfo(user_id);
			request.setAttribute("mDto", mDto);
			
			response.sendRedirect("mypage.do");
			return;
		} else if (comm.equals("/deletemember.do")) { // 글 삭제 확인
			session = request.getSession();
			if (session == null || session.getAttribute("user_id") == null) {
		        response.sendRedirect("login.jsp?msg=4");
		        return;
		    }
			String user_id =(String)session.getAttribute("user_id");
			mdao.memberDelete(user_id);
			System.out.println(user_id);
			session.invalidate();
			response.sendRedirect("index.do");
			return;
		} else if (comm.equals("/boardlist.do")) { // 게시판 모든 글 목록 보기 요청
			request.setCharacterEncoding("utf-8"); 
			String searchType = request.getParameter("searchType");
			String searchKeyword = request.getParameter("searchKeyword");
			String category = request.getParameter("category");
			int page = 1;
			int totalBoardCount = 0; // 모든 글의 갯수
			
			if (category == null || category.isEmpty()) {
			    category = "general"; // 기본 카테고리 설정
			}
			if (request.getParameter("page") == null) { // 참이면 링크타고 게시판으로 들어온 경우
				page = 1;
			} else { // 유저가 보고 싶은 페이지 번호를 누른 경우
				page = Integer.parseInt(request.getParameter("page"));
				// 유저가 클릭한 보고싶은 페이지 번호
			}
			if (searchType != null && searchKeyword != null && !searchKeyword.strip().isEmpty()) { // 유저가 검색 결과 리스트를 원하는 경우
				bDtos = bDao.contentSearch(searchKeyword, searchType, 1);
				if (!bDtos.isEmpty()) {
					totalBoardCount = bDtos.get(0).getBno();
				}
				bDtos = bDao.contentSearch(searchKeyword, searchType, page);
				request.setAttribute("searchType", searchType);
				request.setAttribute("searchKeyword", searchKeyword);
			} else { // 전체 글 리스트를 원하는 경우
				bDtos = bDao.boardList(1,category);
				System.out.println("boardList 결과 개수: " + bDtos.size());
				if (!bDtos.isEmpty()) {
					totalBoardCount = bDtos.get(0).getBno();
				}
				bDtos = bDao.boardList(page,category);
			}
						int totalPage = (int)Math.ceil((double)totalBoardCount / BoardDao.PAGE_SIZE);
			// 모든 글의 갯수 구해서 소수점을 올려주는 방정식 
			int startPage = (((page -1) /PAGE_GROUP_SIZE) * PAGE_GROUP_SIZE) + 1 ; 
			int endPage = Math.min(startPage + (PAGE_GROUP_SIZE -1), totalPage) ;
			// 마지막 페이지 그룹의 경우에는 실제 마지막 페이지로 표시 (그룹의 마지막 페이지, 총 페이지) 중 작은 수를 구함
			//int endPage = (startPage + (PAGE_GROUP_SIZE -1)) ;
			
			request.setAttribute("bDtos", bDtos);
			request.setAttribute("totalPage",totalPage); // 전체 글 갯수로 계산한 전체 페이지 수
			request.setAttribute("currentPage", page); // 현재 페이지 넘버
			request.setAttribute("startPage",startPage); // 그룹으로 나눈 페이지의 시작
			request.setAttribute("endPage",endPage); // 그룹으로 나눈 페이지의 끝
			request.setAttribute("totalBoardCount", totalBoardCount);
			viewPage = "boardlist.jsp";
		} else if (comm.equals("/notice.do")) { // 게시판 모든 글 목록 보기 요청
			request.setCharacterEncoding("utf-8"); 
			String searchType = request.getParameter("searchType");
			String searchKeyword = request.getParameter("searchKeyword");
			String category = request.getParameter("category");
			int page = 1;
			int totalBoardCount = 0; // 모든 글의 갯수
			
			if (category == null || category.isEmpty()) {
			    category = "general"; // 기본 카테고리 설정
			}
			if (request.getParameter("page") == null) { // 참이면 링크타고 게시판으로 들어온 경우
				page = 1;
			} else { // 유저가 보고 싶은 페이지 번호를 누른 경우
				page = Integer.parseInt(request.getParameter("page"));
				// 유저가 클릭한 보고싶은 페이지 번호
			}
			if (searchType != null && searchKeyword != null && !searchKeyword.strip().isEmpty()) { // 유저가 검색 결과 리스트를 원하는 경우
				bDtos = bDao.contentSearch(searchKeyword, searchType, 1);
				if (!bDtos.isEmpty()) {
					totalBoardCount = bDtos.get(0).getBno();
				}
				bDtos = bDao.contentSearch(searchKeyword, searchType, page);
				request.setAttribute("searchType", searchType);
				request.setAttribute("searchKeyword", searchKeyword);
			} else { // 전체 글 리스트를 원하는 경우
				bDtos = bDao.boardList(1,category);
				System.out.println("boardList 결과 개수: " + bDtos.size());
				if (!bDtos.isEmpty()) {
					totalBoardCount = bDtos.get(0).getBno();
				}
				bDtos = bDao.boardList(page,category);
			}
						int totalPage = (int)Math.ceil((double)totalBoardCount / BoardDao.PAGE_SIZE);
			// 모든 글의 갯수 구해서 소수점을 올려주는 방정식 
			int startPage = (((page -1) /PAGE_GROUP_SIZE) * PAGE_GROUP_SIZE) + 1 ; 
			int endPage = Math.min(startPage + (PAGE_GROUP_SIZE -1), totalPage) ;
			// 마지막 페이지 그룹의 경우에는 실제 마지막 페이지로 표시 (그룹의 마지막 페이지, 총 페이지) 중 작은 수를 구함
			//int endPage = (startPage + (PAGE_GROUP_SIZE -1)) ;
			
			request.setAttribute("bDtos", bDtos);
			request.setAttribute("totalPage",totalPage); // 전체 글 갯수로 계산한 전체 페이지 수
			request.setAttribute("currentPage", page); // 현재 페이지 넘버
			request.setAttribute("startPage",startPage); // 그룹으로 나눈 페이지의 시작
			request.setAttribute("endPage",endPage); // 그룹으로 나눈 페이지의 끝
			request.setAttribute("totalBoardCount", totalBoardCount);
			viewPage = "notice.jsp";
		}
		else if (comm.equals("/contentview.do")) { // 글 내용 확인 요청
			request.setCharacterEncoding("utf-8");
			int bnum = Integer.parseInt(request.getParameter("bnum")); // 유저가 선택한 글의 번호
			bDao.updateBhit(bnum); // 조회수 증가
			cDtos = cDao.commentList(bnum);
			
			BoardDto bDto = bDao.contentView(bnum);	
			if (bDto == null) { // 해당글이 존재 하지 않을때
					 request.setAttribute("deleteMsg", "해당글은 존재하지 않는 글 입니다.");
				// response.sendRedirect("boardList.do?msg=1"); // -> 2번째 방법 
					// return;
				} else {
					request.setAttribute("bDto", bDto);
					request.setAttribute("cDtos", cDtos);
				}
			String rnumStr = request.getParameter("rnum");
			System.out.println("rnumStr = [" + rnumStr + "]");
				System.out.println(bnum);
			
			viewPage = "contentview.jsp";
		
		} else if (comm.equals("/contentmodify.do")) {
			request.setCharacterEncoding("utf-8");
			String bnum = request.getParameter("bnum");
			BoardDto bDto = bDao.contentView(Integer.parseInt(bnum));
			
			request.setAttribute("bDto", bDto);
			viewPage = "contentmodify.jsp";
		} 
		else if (comm.equals("/contentmodifyOk.do")) { // 글 수정 후 글내용 보기로 이동 요청
			request.setCharacterEncoding("utf-8");
			
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			String member_name = request.getParameter("member_name");
			String btitle = request.getParameter("btitle");
			String bcontent = request.getParameter("bcontent");
			
			BoardDto bDto = new BoardDto();
			bDao.contentModify(btitle, bcontent, bnum);
			
			bDto = bDao.contentView(bnum);
			request.setAttribute("bDto",bDto );
			
			viewPage="contentview.do";
		}  else if (comm.equals("/delete.do")) { // 글 삭제 확인
			String bnum = request.getParameter("bnum");
			bDao.contentDelete(Integer.parseInt(bnum));
			
			response.sendRedirect("boardlist.do");
			return;
		}  else if (comm.equals("/write.do")) {
			String category = request.getParameter("category");
			request.setAttribute("category", category);
			viewPage="write.jsp";
		} 
		else if (comm.equals("/writeOk.do")) {
			String btitle =request.getParameter("btitle");
			String bcontent =request.getParameter("bcontent");
			String category = "general";
			session= request.getSession();
			String member_id = (String)session.getAttribute("user_id");
			
			if (member_id.equals("admin")) {
				category="notice";
				
			} 
			BoardDto bDto = new BoardDto();
			
			bDto.setBtitle(btitle);
			bDto.setBcontent(bcontent);
			bDto.setMember_id(member_id);
			bDto.setCategory(category);
			
			bDao.boardWrite(btitle, bcontent, member_id, category);
			
			if (category.equals("notice")) {
			    response.sendRedirect("notice.do?category=notice");
			    return;
			}
			response.sendRedirect("boardlist.do");
			return;

		}
		else if (comm.equals("/notice.do")) {
			request.setCharacterEncoding("utf-8"); 
			String searchType = request.getParameter("searchType");
			String searchKeyword = request.getParameter("searchKeyword");
			String category = request.getParameter("category");
			int page = 1;
			int totalBoardCount = 0; // 모든 글의 갯수
			
			if (category == null || category.isEmpty()) {
			    category = "notice"; // 기본 카테고리 설정
			}
			if (request.getParameter("page") == null) { // 참이면 링크타고 게시판으로 들어온 경우
				page = 1;
			} else { // 유저가 보고 싶은 페이지 번호를 누른 경우
				page = Integer.parseInt(request.getParameter("page"));
				// 유저가 클릭한 보고싶은 페이지 번호
			}
			if (searchType != null && searchKeyword != null && !searchKeyword.strip().isEmpty()) { // 유저가 검색 결과 리스트를 원하는 경우
				bDtos = bDao.contentSearch(searchKeyword, searchType, 1);
				if (!bDtos.isEmpty()) {
					totalBoardCount = bDtos.get(0).getBno();
				}
				bDtos = bDao.contentSearch(searchKeyword, searchType, page);
				
			} else { // 전체 글 리스트를 원하는 경우
				searchKeyword ="";
				searchType ="";
				bDtos = bDao.boardList(1,category);
				System.out.println("boardList 결과 개수: " + bDtos.size());
				if (!bDtos.isEmpty()) {
					totalBoardCount = bDtos.get(0).getBno();
				}
				bDtos = bDao.boardList(page,category);
			}
						int totalPage = (int)Math.ceil((double)totalBoardCount / BoardDao.PAGE_SIZE);
			// 모든 글의 갯수 구해서 소수점을 올려주는 방정식 
			int startPage = (((page -1) /PAGE_GROUP_SIZE) * PAGE_GROUP_SIZE) + 1 ; 
			int endPage = Math.min(startPage + (PAGE_GROUP_SIZE -1), totalPage) ;
			// 마지막 페이지 그룹의 경우에는 실제 마지막 페이지로 표시 (그룹의 마지막 페이지, 총 페이지) 중 작은 수를 구함
			//int endPage = (startPage + (PAGE_GROUP_SIZE -1)) ;
			
			request.setAttribute("bDtos", bDtos);
			request.setAttribute("totalPage",totalPage); // 전체 글 갯수로 계산한 전체 페이지 수
			request.setAttribute("currentPage", page); // 현재 페이지 넘버
			request.setAttribute("startPage",startPage); // 그룹으로 나눈 페이지의 시작
			request.setAttribute("endPage",endPage); // 그룹으로 나눈 페이지의 끝
			request.setAttribute("totalBoardCount", totalBoardCount);
			request.setAttribute("category", category);  // ← 이거 꼭 필요!
			request.setAttribute("searchType", searchType);
			request.setAttribute("searchKeyword", searchKeyword);

			viewPage ="notice.jsp";
		} else if (comm.equals("/noticeview.do")) { // 글 내용 확인 요청
			request.setCharacterEncoding("utf-8");
			int bnum = Integer.parseInt(request.getParameter("bnum")); // 유저가 선택한 글의 번호
			bDao.updateBhit(bnum); // 조회수 증가
			cDtos = cDao.commentList(bnum);
			
			BoardDto bDto = bDao.contentView(bnum);	
			if (bDto == null) { // 해당글이 존재 하지 않을때
					 request.setAttribute("deleteMsg", "해당글은 존재하지 않는 글 입니다.");
				// response.sendRedirect("boardList.do?msg=1"); // -> 2번째 방법 
					// return;
				} else {
					request.setAttribute("bDto", bDto);
					request.setAttribute("cDtos", cDtos);
				}
				
				System.out.println(bnum);
				System.out.println(cDtos);
			
			viewPage = "noticeview.jsp";
		
		} else if (comm.equals("/commentOk.do")) {
			int bnum =Integer.parseInt(request.getParameter("bnum"));
			String comment =request.getParameter("comment");
			
			session= request.getSession();
			String member_id = (String)session.getAttribute("user_id");
			
			CommentDto cDto = new CommentDto();
			
			cDto.setBnum(bnum);
			cDto.setMember_id(member_id);
			cDto.setComment(comment);
			
			cDao.commentWrite(bnum, member_id, comment);
			
			
			response.sendRedirect("contentview.do?bnum="+bnum);
			return;
		}
		else if (comm.equals("/commentmodify.do")) { // 글 수정 후 글내용 보기로 이동 요청
			request.setCharacterEncoding("utf-8");
			
			int cnum = Integer.parseInt(request.getParameter("cnum"));
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			String comment = request.getParameter("comment");
			BoardDto bDto = bDao.contentView(bnum);
			cDtos = cDao.commentList(bnum);
			
			request.setAttribute("cnum", cnum);
			request.setAttribute("bDto", bDto);
			request.setAttribute("cDtos", cDtos);
			
			viewPage ="commentmodify.jsp";
			
		} 
		else if (comm.equals("/commentmodifyOk.do")) { // 글 수정 후 글내용 보기로 이동 요청
			request.setCharacterEncoding("utf-8");
			
			int cnum = Integer.parseInt(request.getParameter("cnum"));
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			String comment = request.getParameter("comment");
			
			cDao.commentModify(comment, cnum);
			
			viewPage="contentview.do";
		}else if (comm.equals("/commentdelete.do")) { // 글 삭제 확인
			int cnum = Integer.parseInt(request.getParameter("cnum"));
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			cDao.commentDelete(cnum);
			
			response.sendRedirect("contentview.do?bnum="+bnum);
			return;
		}else if (comm.equals("/reservation.do")) { // 글 수정 후 글내용 보기로 이동 요청
			request.setCharacterEncoding("utf-8");
			session= request.getSession();
			session.getAttribute("user_id");
			
			if (session == null || session.getAttribute("user_id") == null) {
		        response.sendRedirect("login.jsp?msg=4");
		        return;
		    }
			
			
			viewPage="reservation.jsp";
			
		}else if (comm.equals("/reservationOk.do")) { // 글 수정 후 글내용 보기로 이동 요청
			request.setCharacterEncoding("utf-8");
			Date rdate =Date.valueOf(request.getParameter("rdate"));
			Time rtime =Time.valueOf(request.getParameter("rtime") + ":00");
			String seat =request.getParameter("seat");
			
			session= request.getSession();
			String member_id = (String)session.getAttribute("user_id");
			
			if (session == null || session.getAttribute("user_id") == null) {
		        response.sendRedirect("login.jsp?msg=4");
		        return;
		    }
			java.time.LocalDate paramDate = rdate.toLocalDate();
			java.time.LocalDate now = java.time.LocalDate.now();
			
			boolean isPast = paramDate.isBefore(now);
			request.setAttribute("isPast", isPast);
			
			if (isPast) {
				response.sendRedirect("reservation.do?msg=5");
				return;
			}
			ReservationDto rDto = new ReservationDto();
			rDto.setMember_id(member_id);
			rDto.setRdate(rdate);
			rDto.setRtime(rtime);
			rDto.setSeat(seat);
			
			rDao.reserve(member_id, rdate, rtime, seat);
			
			request.setAttribute("rDto", rDto);
			
			viewPage="reservationOk.jsp";
		} else if (comm.equals("/deleteReservation.do")) { // 글 삭제 확인
			int rnum = Integer.parseInt(request.getParameter("rnum"));
			rDao.reservationDelete(rnum);
			
			viewPage="mypage.do";
		} 
		else {
			viewPage = "index.jsp";
		} 
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
