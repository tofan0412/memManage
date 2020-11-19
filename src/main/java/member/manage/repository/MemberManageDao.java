package member.manage.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import member.manage.model.MemberVo;
import member.manage.model.PageVo;

@Repository("memberDao")
public class MemberManageDao implements MemberManageDaoI {

	@Resource(name="SqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberVo login(Map<String, String> userInfo) {
		return sqlSession.selectOne("member.login", userInfo);
	}

	@Override
	public List<MemberVo> memberList(PageVo pageVo) {
		return sqlSession.selectList("member.memberList", pageVo);
	}

	@Override
	public List<MemberVo> memberListAll() {
		return sqlSession.selectList("member.memberListAll");
	}
	// ----------------------검색 세션---------------------------
	@Override
	public List<MemberVo> searchById(String keyword) {
		return sqlSession.selectList("member.searchById", keyword);
	}

	@Override
	public List<MemberVo> searchByAlias(String keyword) {
		return sqlSession.selectList("member.searchByNickname", keyword);
	}

	@Override
	public List<MemberVo> searchByName(String keyword) {
		return sqlSession.selectList("member.searchByName", keyword);
	}
	// ----------------------검색 세션 끝---------------------------

	@Override
	public int memberRegist(MemberVo memberVo) {
		return sqlSession.insert("member.memberRegist", memberVo);
	}

	@Override
	public MemberVo memberInfo(String userid) {
		return sqlSession.selectOne("member.memberInfo", userid);
	}

	@Override
	public int memberUpdate(MemberVo memberVo) {
		return sqlSession.update("member.memberUpdate", memberVo);
	}

	@Override
	public int memberDelete(String userid) {
		return sqlSession.delete("member.memberDelete", userid);
	}
}
