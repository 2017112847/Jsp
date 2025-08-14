package controller.order;

import java.io.IOException;

import dto.CustomerDTO;
import dto.OrderDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import survice.OrderService;

@WebServlet("/order/register.do")
public class registercontroller extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private OrderService service = OrderService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String prodNo = req.getParameter("prodNo");
		String prodCount = req.getParameter("prodCount");
		
		HttpSession session = req.getSession();
		CustomerDTO sessUser  = (CustomerDTO) session.getAttribute("sessUser");
		
		//dto 생성
		OrderDTO dto = new OrderDTO();
		dto.setOrderProduct(prodNo);
		dto.setOrderCount(prodCount);
		dto.setOrderId(sessUser.getCustid());
		
		service.register(dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/order/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
