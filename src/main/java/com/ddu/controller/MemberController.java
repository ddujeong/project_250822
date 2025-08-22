package com.ddu.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.ddu.dao.BoardDao;
import com.ddu.dao.MemberDao;
import com.ddu.dao.ReservationDao;
import com.ddu.dto.MemberDto;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		String viewPage = "";
		
		MemberDao mdao = new MemberDao();
		BoardDao bDao = new BoardDao();
		ReservationDao rDao = new ReservationDao();
		
		List< MemberDto> mDtos = new ArrayList<MemberDto>();
		HttpSession session = null;
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
			
			System.out.println(mid);
			if (mdao.confirmId(mid) == 1) {
				request.setAttribute("error", "이미 사용 중인 아이디입니다.");
				viewPage="signup.jsp";
				return;
			} else {
				mdao.joinMember(mDto);
				request.setAttribute("mDto", mDto);
				request.setAttribute("success", "회원가입 성공! 로그인 해주세요");
				viewPage ="login.jsp";
			}
			
			
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
