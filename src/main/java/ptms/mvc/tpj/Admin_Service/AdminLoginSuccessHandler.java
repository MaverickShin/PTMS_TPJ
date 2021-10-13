package ptms.mvc.tpj.Admin_Service;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import ptms.mvc.tpj.AdminVO.UserVO;

// 로그인 성공한 경우 자동으로 실행
public class AdminLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	SqlSessionTemplate sqlSessions;
	
	public AdminLoginSuccessHandler(SqlSessionTemplate sqlSessions) {
		this.sqlSessions = sqlSessions;
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		UserVO vo = (UserVO)authentication.getPrincipal();
		
		String msg = authentication.getName() + "님 환영합니다";
		System.out.println("아이디 ==> " + authentication.getName());
		
		request.setAttribute("msg", msg);
		request.getSession().setAttribute("adminid", authentication.getName());
		
		// 메인화면으로 이동
		RequestDispatcher rd = request.getRequestDispatcher("/admin/loginsuccess");
		rd.forward(request, response);
		
	}
	
	
	
}
