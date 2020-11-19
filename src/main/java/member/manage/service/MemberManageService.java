package member.manage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import member.manage.model.MemberVo;
import member.manage.model.PageVo;
import member.manage.repository.MemberManageDaoI;

@Service("memberService")
public class MemberManageService implements MemberManageServiceI{

	@Resource(name="memberDao")
	private MemberManageDaoI memberDao;
	
	@Override
	public MemberVo login(Map<String, String> userInfo) {
		return memberDao.login(userInfo);
	}

	@Override
	public List<MemberVo> memberList(PageVo pageVo) {
		return memberDao.memberList(pageVo);
	}

	@Override
	public List<MemberVo> memberListAll() {
		return memberDao.memberListAll();
	}
	// ----------------------검색 세션----------------------
	@Override
	public List<MemberVo> searchById(String keyword) {
		return memberDao.searchById(keyword);
	}

	@Override
	public List<MemberVo> searchByAlias(String keyword) {
		return memberDao.searchByAlias(keyword);
	}

	@Override
	public List<MemberVo> searchByName(String keyword) {
		return memberDao.searchByName(keyword);
	}
	// ----------------------검색 세션 끝 ----------------------

	@Override
	public int memberRegist(MemberVo memberVo) {
		return memberDao.memberRegist(memberVo);
	}

	@Override
	public MemberVo memberInfo(String userid) {
		return memberDao.memberInfo(userid);
	}

	@Override
	public int memberUpdate(MemberVo memberVo) {
		return memberDao.memberUpdate(memberVo);
	}

	@Override
	public int memberDelete(String userid) {
		return memberDao.memberDelete(userid);
	}
}
