package ptms.mvc.tpj.Customer_Main_Service;

import java.util.ArrayList;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import ptms.mvc.tpj.CustVO.CustomerVO;
import ptms.mvc.tpj.CustVO.UserVO;

//UserDetailsService : 스프링 프레임워크에 내장된 인터페이스

//로그인 인증을 처리
public class UserAuthenticationService implements UserDetailsService {
	
	// security-context.xml 에서 주입
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder passordEncoder;
	
	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public UserAuthenticationService(BCryptPasswordEncoder passordEncoder) {
		this.passordEncoder = passordEncoder;
	}
	
	// 로그인 정보 확인
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		// 회원정보 조회
		CustomerVO vo =  sqlSession.selectOne("ptms.mvc.tpj.Customer_Main_DAO.MainDAO.custInfo", id);
		
		System.out.println("id : " + id);
		
		// 정보가 존재하지 않을 때 예외 처리
		if(vo == null) throw new UsernameNotFoundException(id);
		
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		
		// 사용자의 권한을 불러와 추가
		authority.add(new SimpleGrantedAuthority(vo.getAUTHOR()));
		
		// 오라클에서는 필드명을 대문자로 취급
		
		// 1) 사용자가 입력한 값과 테이블의 USERID, PASSWORD를 비교해서
		
		// 2-1) 비밀번호가 불일치시 UserLoginFailureHandler로 자동 이동
		// 2-2) 비밀번호가 일치시 UserLoginSuccessHandler로 자동 이동
		
		// 3) 테이블의 암호화된 비밀번호와 사용자가 입력한 비밀번호를 내부적으로 비교처리
		
		return new UserVO(vo.getCUST_ID(),"{bcrypt}"+vo.getCUST_PWD(),vo.getENABLE_NO() == 1, true, true, true, authority, vo.getCUST_NM());
		
	}
	
}
