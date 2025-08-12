package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GreetingServlet extends HttpServlet{
	
	private static final long serialVersionUID =1L;
	
	public void init() throws ServletException{
		System.out.println("Greeting init");
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		//	서블릿이 최초 생성될 때 실행되는 초기화 메소드
		System.out.println("GreetingServlet get 요청 ");
		
		// HTML 출력
				resp.setContentType("text/html;charset=UTF-8");
				
				PrintWriter writer = resp.getWriter();
				writer.println("<html>");
				writer.println("<head>");
				writer.println("<meta charset='UTF-8'/>");
				writer.println("<title>HelloServlet</title>");		
				writer.println("/<head>");
				writer.println("<body>");		
				writer.println("<h3>HelloServlet</h3>");
				writer.println("<a herf='/ch08/Servlet.jsp'>서블릿 메인</a>");
				writer.println("<a herf='/ch08/hello.do'>Hello Servlet</a>");
				writer.println("<a herf='/ch08/welcome.do'>Welcome Servlet</a>");
				writer.println("<a herf='/ch08/greeting.do'>greeting Servlet</a>");
				writer.println("</body>");		
				writer.println("</html>");
				writer.close();
	}
	protected void dopost(HttpServletResponse req, HttpServletResponse resp) throws ServletException, IOException{
		//	클라이언트 Get 요청 실행
		System.out.println("GreetingServlet post 요청 ");
		
		
		
	}
}

