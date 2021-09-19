package ptms.mvc.tpj.Customer_Main_Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;


public class UserLoginFailureHandler implements AuthenticationFailureHandler{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	public UserLoginFailureHandler(SqlSessionTemplate sqlSession, BCryptPasswordEncoder passwordEncoder ) {
		this.sqlSession = sqlSession;
		this.passwordEncoder = passwordEncoder;
	}
	
	// 로그인이 실패할 경우 자동으로 실행되는 코드 
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
	
		System.out.println("실패 ");
		String strId =  request.getParameter("id");
		String strPwd = request.getParameter("pwd");
		
		// 아이디 확인
		int cnt = sqlSession.selectOne("ptms.mvc.tpj.Customer_Main_DAO.MainDAO.idCheck",strId);
		
		// 아이디가 존재 할 때
		if(cnt!=0) {
			
			// 비번 확인
			String pwd = sqlSession.selectOne("ptms.mvc.tpj.Customer_Main_DAO.MainDAO.pwdCheck",strId);
			System.out.println(strPwd);
			System.out.println(pwd);
			System.out.println("strpwd : " + strPwd);
			System.out.println(passwordEncoder.matches(strPwd, pwd));
			
			// 입력받은 비번과 저장된 비번이 일치 할 때
			if(passwordEncoder.matches(strPwd, pwd)) {
				
				// 이메일 확인 경고
				request.setAttribute("errMsg", "이메일 인증하세요.");
			
			// 비번이 일치하지 않을 때
			}else {
				
				// 비번 확인 경고
				request.setAttribute("errMsg", "비밀번호가 일치하지 않습니다.");
			}
			
		// 아이디가 존재하지 않을 때
		}else {
			
			// 아이디 확인 경고
			request.setAttribute("errMsg", "아이디가 일치하지 않습니다.");
		}
		
		// 로그인 실패 처리용 클래스 이므로 무조건 로그인 화면으로 되돌아간다.
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/main/login/login.jsp");
		rd.forward(request, response);
	}

}
