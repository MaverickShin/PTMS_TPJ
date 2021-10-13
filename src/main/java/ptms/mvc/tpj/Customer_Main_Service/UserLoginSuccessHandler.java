package ptms.mvc.tpj.Customer_Main_Service;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import ptms.mvc.tpj.CustVO.UserVO;

// 로그인 성공한 경우 자동으로 실행
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public UserLoginSuccessHandler(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		UserVO vo = (UserVO)authentication.getPrincipal();
		System.out.println("UserVO==> " + vo);
		
		String msg = authentication.getName() + "님 환영합니다";
		System.out.println("아이디 ==> " + authentication.getName());
		
		// 권한 확인
		String grade = sqlSession.selectOne("ptms.mvc.tpj.Customer_Main_DAO.MainDAO.gradeCheck", authentication.getName());
		int gradeCnt = 0;
		
		if(grade.equals("ROLE_FREE") || grade.equals("ROLE_BUSINESS") || grade.equals("ROLE_PREMIUM")) {
			gradeCnt = 1;
		}else {
			gradeCnt = 0;
		}
		
		request.getSession().setAttribute("cust_id", authentication.getName());
		request.getSession().setAttribute("cust_nm", vo.getName());
		request.getSession().setAttribute("grade", gradeCnt);
		
		System.out.println("grade : " + gradeCnt);
		
		
		// 메인화면으로 이동
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/main/index.jsp");
		rd.forward(request, response);
		
	}
	
	
	
}
