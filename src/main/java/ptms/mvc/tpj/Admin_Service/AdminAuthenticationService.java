package ptms.mvc.tpj.Admin_Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import ptms.mvc.tpj.AdminVO.AdminVO;
import ptms.mvc.tpj.CustVO.CustomerVO;
import ptms.mvc.tpj.CustVO.UserVO;

//UserDetailsService : 스프링 프레임워크에 내장된 인터페이스

//로그인 인증을 처리
public class AdminAuthenticationService implements UserDetailsService {
	
	// security-context.xml 에서 주입
	@Autowired
	SqlSessionTemplate sqlSessions;
	
	
	public AdminAuthenticationService(SqlSessionTemplate sqlSessions) {
		this.sqlSessions = sqlSessions;
	}

	
	// 로그인 정보 확인
	@Override
	public UserDetails loadUserByUsername(String mg_id) throws UsernameNotFoundException {
		
		System.out.println("관리자 로그인 처리 진입");
		
		// 회원정보 조회
		AdminVO vo =  sqlSessions.selectOne("com.mvc.sdb.Admin_DAO.AdminMainDAO.loginAction", mg_id);
		
		// 정보가 존재하지 않을 때 예외 처리
		if(vo == null) throw new UsernameNotFoundException(mg_id);
		
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		
		// 사용자의 권한을 불러와 추가
		authority.add(new SimpleGrantedAuthority(vo.getAuthor()));
		return null;
		
		// 오라클에서는 필드명을 대문자로 취급
		
		// 1) 사용자가 입력한 값과 테이블의 USERID, PASSWORD를 비교해서
		
		// 2-1) 비밀번호가 불일치시 UserLoginFailureHandler로 자동 이동
		// 2-2) 비밀번호가 일치시 UserLoginSuccessHandler로 자동 이동
		
		// 3) 테이블의 암호화된 비밀번호와 사용자가 입력한 비밀번호를 내부적으로 비교처리
		
		
	}
	
}
