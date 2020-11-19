package member.manage.repository;

import java.util.List;
import java.util.Map;

import member.manage.model.MemberVo;
import member.manage.model.PageVo;

public interface MemberManageDaoI {
	/**
	 * 사용자의 아이디, 비번을 확인해 로그인하는 메서드.
	 */
	MemberVo login(Map<String, String> userInfo);
	
	/**
	 * 사용자 정보를 불러온다. 
	 */
	MemberVo memberInfo(String userid);
	
	/**
	 * 회원 리스트를 불러온다.
	 */
	List<MemberVo> memberList(PageVo pageVo);
	
	/**
	 * 전체 페이지 개수 계산용 메서드. 
	 */
	List<MemberVo> memberListAll();
	
	/**
	 * 사용자 아이디로 검색하기
	 */
	List<MemberVo> searchById(String keyword);
	
	/**
	 * 사용자 별명으로 검색하기
	 */
	List<MemberVo> searchByAlias(String keyword);
	
	/**
	 * 사용자 이름로 검색하기
	 */
	List<MemberVo> searchByName(String keyword);
	
	/**
	 * 회원 가입
	 */
	int memberRegist(MemberVo memberVo);
	
	/**
	 * 회원 정보 수정
	 */
	int memberUpdate(MemberVo memberVo);
	
	/**
	 * 회원 삭제
	 */
	int memberDelete(String userid);

	
}
