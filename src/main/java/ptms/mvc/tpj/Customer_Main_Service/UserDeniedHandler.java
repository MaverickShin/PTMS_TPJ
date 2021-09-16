package ptms.mvc.tpj.Customer_Main_Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class UserDeniedHandler implements AccessDeniedHandler{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {

		request.setAttribute("errMsg", "접근 권한이 없습니다.");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/denied.jsp");
		dispatcher.forward(request, response);
		
	}

}
