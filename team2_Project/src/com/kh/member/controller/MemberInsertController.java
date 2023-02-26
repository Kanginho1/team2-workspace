package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberInsertController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8"); //���ڵ�
	
	//���ް� ���� ��ü ���
	String memId = request.getParameter("memId");
	String memPwd =request.getParameter("memPwd");
	String memName = request.getParameter("memName");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String[] adcheckArr = request.getParameterValues("adCheck");
	
	String adCheck ="";
	if(adcheckArr !=null) {
		adCheck = String.join(",",adcheckArr);
	}
	
	Member m = new Member(memId,memPwd,memName,email,phone,adCheck);
	int result = new MemberService().insertMember(m);
	
	System.out.println(result + "!!!@!@!@!@!@!");
	
	if(result>0) {
		HttpSession session = request.getSession();
		session.setAttribute("alertMsg", "���Ϲ�����? ȸ���� �ǽŰ� ȯ���մϴ�.");
		RequestDispatcher view = request.getRequestDispatcher("index.jsp");
		view.forward(request, response);
	}else {
		request.setAttribute("errorMsg", "ȸ�����Կ� �����߽��ϴ�.");
		RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
		view.forward(request, response);	
	}
	
	
	
	
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
