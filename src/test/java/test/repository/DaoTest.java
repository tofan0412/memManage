package test.repository;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;

import member.manage.model.MemberVo;
import member.manage.model.PageVo;
import member.manage.repository.MemberManageDaoI;
import test.config.ModelTestConfig;

public class DaoTest extends ModelTestConfig{
	@Resource(name="memberDao")
	private MemberManageDaoI memberDao;
	
	@Before
	public void setup() {
		super.setup();
	}
	
	@Test
	public void loginTest() {
		/***Given***/
		String userid = "brown"; 
		String pass = "java";
		
		Map<String, String> userInfo = new HashMap<String, String>();
		userInfo.put("userid", userid);
		userInfo.put("pass", pass);
		/***When***/
		MemberVo result = memberDao.login(userInfo);
		
		/***Then***/
		assertEquals(userid, result.getUserid());
	}
	
	@Test
	public void memberListTest() {
		/***Given***/
		PageVo pageVo = new PageVo(1, 5);

		/***When***/
		List<MemberVo> result = memberDao.memberList(pageVo);
		/***Then***/
		assertEquals(5, result.size());
	}
	
	@Test
	public void memberListAllTest() {
		/***Given***/
		

		/***When***/
		List<MemberVo> result = memberDao.memberListAll();
		/***Then***/
		assertEquals(21, result.size());
	}
	
	@Test
	public void searchByIdTest() {
		/***Given***/
		String keyword = "tofan123";

		/***When***/
		List<MemberVo> result = memberDao.searchById(keyword);
		
		/***Then***/
		assertEquals(1, result.size());
	}
	
	@Test
	public void searchByAliasTest() {
		/***Given***/
		String keyword = "뽀똥이";

		/***When***/
		List<MemberVo> result = memberDao.searchByAlias(keyword);
		/***Then***/
		assertEquals(1, result.size());
	}
	
	@Test
	public void searchByNameTest() {
		/***Given***/
		String keyword = "조웅현";

		/***When***/
		List<MemberVo> result = memberDao.searchByName(keyword);
		/***Then***/
		assertEquals(1, result.size());
	}
	
	@Test
	public void memberRegistTest() {
		/***Given***/
		MemberVo memberVo = new MemberVo("test", "test", "test", "test", "test", "test", "test", "", "");

		/***When***/
		int result = memberDao.memberRegist(memberVo);
		/***Then***/
		MemberVo app = memberDao.memberInfo("test");
		assertEquals("test", app.getUserid());
	}
	
	@Test
	public void memberInfoTest() {
		/***Given***/
		String userid = "brown";

		/***When***/
		MemberVo memberVo = memberDao.memberInfo(userid);
		/***Then***/
		assertEquals("brown", memberVo.getUserid());
	}
	
	@Test
	public void memberUpdateTest() {
		/***Given***/
		MemberVo memberVo = new MemberVo("brown", "changeTest", "changeTest", "changeTest", "changeTest", "changeTest", "1111", "", "");
		

		/***When***/
		int result = memberDao.memberUpdate(memberVo);
		/***Then***/
		MemberVo app = memberDao.memberInfo("brown");
		assertEquals("changeTest", app.getPass());
	}
	
	@Test
	public void memberDeleteTest() {
		/***Given***/
		String userid = "cony";

		/***When***/
		int result = memberDao.memberDelete(userid);
		
		/***Then***/
		assertEquals(1, result);
	}

}
