package ptms.mvc.tpj.Admin_Service;

import java.util.ArrayList;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import ptms.mvc.tpj.AdminVO.AdminVO;
import ptms.mvc.tpj.AdminVO.UserVO;

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
		AdminVO vo =  sqlSessions.selectOne("ptms.mvc.tpj.Admin_DAO.AdminDAO.adminInfo", mg_id);
		
		// 정보가 존재하지 않을 때 예외 처리
		if(vo == null) throw new UsernameNotFoundException(mg_id);
		
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		
		// 사용자의 권한을 불러와 추가
		authority.add(new SimpleGrantedAuthority(vo.getAuthor()));
		return new UserVO(vo.getMg_id(),"{bcrypt}"+vo.getMg_pwd(), true, true, true, true, authority, vo.getMg_kind()) ;
		
	}
	
}
