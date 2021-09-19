package ptms.mvc.tpj.CustVO;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

// User 클래스는 스프링 시큐리티에 내장된 추상클래스로서, 사용자 상세정보를 담는 클래스이다.
// User 클래스는 추상 클래스이므로 상속받아 추상메서드를 오버라이드해서 구현한다.
public class UserVO extends User{
	
	private String username;
	private String password;
	private String name;
	
	// super는 부모클래스
	public UserVO(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities, String name) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		
		this.username = username;
		this.password = password;
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
