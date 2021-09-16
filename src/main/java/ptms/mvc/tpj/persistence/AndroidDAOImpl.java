package ptms.mvc.tpj.persistence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ptms.mvc.tpj.vo.Member;

@Repository
public class AndroidDAOImpl implements AndroidDAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public String confirmIdPwd(Map<String, String> in) {
		AndroidDAO dao = sqlSession.getMapper(AndroidDAO.class);
		return dao.confirmIdPwd(in);
	}

	@Override
	public Member getMemberInfo(String id) {
		AndroidDAO dao = sqlSession.getMapper(AndroidDAO.class);
		Member m = dao.getMemberInfo(id);
		
		System.out.println("dao m : " + m);
		
		return m;
	}

}
