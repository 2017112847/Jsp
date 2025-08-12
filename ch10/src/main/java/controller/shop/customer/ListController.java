package controller.shop.customer;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.shop.CustomerDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.shop.CustomerService;

@WebServlet("/shop/customer/list.do")
public class ListController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private CustomerService service = CustomerService.INSTANCE;
	
	// 로거 생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		///////////////
		//배포할땐 sysoutprint 말고 logger 써야됨
		logger.debug("debug here1");
		logger.info("info here1");
		logger.warn("warn here1");
		logger.error("error here1");
		////////////////////////////		
		List<CustomerDTO> dtoList = service.findAll();
		
		req.setAttribute("dtoList", dtoList);
		logger.debug("debug here2 "+ dtoList);
		logger.info("info here2 " + dtoList);
		logger.warn("warn here2 " + dtoList);
		logger.error("error here2 " + dtoList);
		
		req.setAttribute("dtoList", dtoList);
				
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/shop/customer/list.jsp");
		dispatcher.forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
		
	}
	
}
