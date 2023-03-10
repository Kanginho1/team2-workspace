package com.kh.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.community.model.vo.Instagram;
import com.kh.member.model.vo.Member;
import com.kh.myPage.model.service.MyPageService;
import com.kh.payment.model.vo.OrderDtlA;

/**
 * Servlet implementation class OrderHistoryPageController
 */
@WebServlet("/orderHistory.mp")
public class OrderHistoryPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderHistoryPageController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int memNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMemNo(); 

		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;

		int maxPage;
		int startPage;
		int endPage;

		listCount = new MyPageService().selectOrderHistoryCount(memNo);
		if(request.getParameter("cpage")!=null) {
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		}else {
			currentPage = 1;
		}
		pageLimit = 10;
		boardLimit = 3;
		
		maxPage = (int) Math.ceil((double) listCount / boardLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		ArrayList<OrderDtlA> orderHistoryList = new MyPageService().selectOrderHistoryList(pi, memNo);

		request.setAttribute("memNo", memNo);
		request.setAttribute("pi", pi);
		request.setAttribute("orderHistoryList", orderHistoryList);
		
		
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/myPage/orderHistory.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
