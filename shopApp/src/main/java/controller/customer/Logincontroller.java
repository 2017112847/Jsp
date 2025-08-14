package controller.customer;

import java.io.IOException;

import dto.CustomerDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import survice.CustomerService;

@WebServlet("/customer/login.do")
public class Logincontroller extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private CustomerService service = CustomerService.INSTANCE;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/customer/login.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String custid = req.getParameter("custid");
		
		CustomerDTO customerdto =  service.findById(custid);
		
		if(customerdto != null) {
			//회원일 맞을 경우DB에서 조회한 회원개게를 세션저장
			HttpSession session= req.getSession();
			session.setAttribute("sessUser", customerdto);
			
			// 상품목록 이동
			resp.sendRedirect("/shopApp/product/list.do?login=success");
						
		}else {
			
			//회원이 아니면 상품목록으로 이동
			resp.sendRedirect("/shopApp/product/list.do?login=fail");
			
		}
	}

}
