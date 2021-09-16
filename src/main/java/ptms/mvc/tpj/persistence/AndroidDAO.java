package ptms.mvc.tpj.persistence;

import java.util.Map;

import ptms.mvc.tpj.vo.Member;

public interface AndroidDAO {
	
	public String confirmIdPwd(Map<String, String> in);
	
	public Member getMemberInfo(String id);

}
