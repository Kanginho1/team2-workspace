package com.kh.payment.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.payment.model.service.PaymentService;
import com.kh.payment.model.vo.Order;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/order.pa")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String[] pNo = request.getParameterValues("pno"); // 주문한 상품 번호
		String[] pSize = request.getParameterValues("psize"); // 상품 사이즈
		String[] pQnt = request.getParameterValues("pqnt"); // 상품 수량
		String cno = request.getParameter("cno");
		int mNo = ((Member)(request.getSession().getAttribute("loginUser"))).getMemNo(); 
		int useMileage = 0;
		if(request.getParameter("amount") != "") {
		useMileage = Integer.parseInt(request.getParameter("amount")); // 사용마일리지
		}
		int result2 = 0;
		int result3 = 0;
		int result4 = 1;
		int result6 = 0;
		Order o = new Order(); 
		o.setOrderQnt(Integer.parseInt(request.getParameter("totalqnt")));
		o.setRcpName(request.getParameter("order-name"));
		o.setRcpPhone(request.getParameter("order-phone"));
		o.setRcpAddress(request.getParameter("Laddress"));
		o.setRcpAddressDtl(request.getParameter("Daddress"));
		o.setRcpPostCode(request.getParameter("Lcode"));
		o.setRcpMsg(request.getParameter("rqrmn"));
		o.setMemNo(mNo);
		o.setSaveMileage(Integer.parseInt(request.getParameter("saveMileage")));
		o.setUseMileage(useMileage);
		
		HttpSession session = request.getSession();
		
		int result1 = new PaymentService().insertOrder(o); // TB_ORDER 테이블에 INSERT
		if(result1>0) {
			//int result5 = new PaymentService().updateMileage(mNo,useMileage); // 회원의 사용 마일리지 차감
			if(useMileage>0) {
			 result6 = new PaymentService().insertMileageHistory(mNo,useMileage); // TB_MILEAGE_HISTORY 테이블에 INSERT
			}else if(useMileage == 0) {
				result6=1;
			}
			for(int i =0;i<pNo.length;i++) {
				result2 = new PaymentService().insertOrderDtl(Integer.parseInt(pNo[i]),pSize[i],Integer.parseInt(pQnt[i]));  // TB_DTL_ORDER 테이블에 INSERT
				result3 = new PaymentService().updateOptionQnt(Integer.parseInt(pNo[i]),pSize[i],Integer.parseInt(pQnt[i])); // 상품 수량 차감
				
				if(cno != null) { // 장바구니를 통해서 주문했다면 결제된 상품의 장바구니 삭제
					String[] carts = cno.split(",");
					result4 = new PaymentService().deleteCart(Integer.parseInt(carts[i]));
				}
					
				
			}
			if(result2*result3*result4*result6>0) { 
				Member updateMember = (Member) request.getSession().getAttribute("loginUser");
				updateMember.setMileage(updateMember.getMileage()-useMileage);
				session.setAttribute("loginUser", updateMember);
				response.sendRedirect(request.getContextPath()+"/orderHistory.mp");
			}
		}else {
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}