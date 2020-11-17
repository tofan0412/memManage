package member.manage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import member.manage.model.MemberVo;
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
	public List<MemberVo> memberList() {
		return memberDao.memberList();
	}

}