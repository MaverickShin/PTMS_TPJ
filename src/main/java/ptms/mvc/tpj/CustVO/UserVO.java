package ptms.mvc.tpj.CustVO;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

// User 클래스는 스프링 시큐리티에 내장된 추상클래스로서, 사용자 상세정보를 담는 클래스이다.
// User 클래스는 추상 클래스이므로 상속받아 추상메서드를 오버라이드해서 구현한다.
public class UserVO extends User{
	
	private static final long serialVersionUID = 1L;
	private String userId;

	// super는 부모클래스
	public UserVO(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getUserId() {
		return userId;
	}
	
	@Override
	public String toString() {
		
		return "";
	}
}
