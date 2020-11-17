package member.manage.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import member.manage.model.MemberVo;

@Repository("memberDao")
public class MemberManageDao implements MemberManageDaoI {

	@Resource(name="SqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberVo login(Map<String, String> userInfo) {
		return sqlSession.selectOne("member.login", userInfo);
	}

	@Override
	public List<MemberVo> memberList() {
		return sqlSession.selectList("member.memberList");
	}

}
