package member.manage.repository;

import java.util.List;
import java.util.Map;

import member.manage.model.MemberVo;

public interface MemberManageDaoI {
	/**
	 * 사용자의 아이디, 비번을 확인해 로그인하는 메서드.
	 */
	MemberVo login(Map<String, String> userInfo);
	
	/**
	 * 회원 리스트를 불러온다.
	 */
	List<MemberVo> memberList();
}
