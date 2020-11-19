package test.controller;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import org.junit.Before;
import org.junit.Test;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import member.manage.model.PageVo;
import test.config.WebTestConfig;

public class controllerTest extends WebTestConfig{
	
	@Before
	public void setup() {
		super.setup();
	}
	
	@Test
	public void loginViewTest() throws Exception {
		/***Given***/

		/***When***/
		MvcResult result = mockMvc.perform(get("/memManage/loginView")).andReturn();
		/***Then***/
		ModelAndView mav = result.getModelAndView();
		assertEquals("application/loginView", mav.getViewName());
		
	}
	
	@Test
	public void homeTest() throws Exception{
		/***Given***/

		/***When***/
		MvcResult result = mockMvc.perform(get("/memManage/home")).andReturn();
		/***Then***/
		ModelAndView mav = result.getModelAndView();
		assertEquals("application/memberList", mav.getViewName());
	}
	
	@Test
	public void loginMethodTest() throws Exception{
		/***Given***/

		/***When***/
		MvcResult result = mockMvc.perform(get("/memManage/loginMethod")
					.param("userid", "brown").param("pass", "java")
					).andReturn();
		/***Then***/
		ModelAndView mav = result.getModelAndView();
		assertEquals("application/memberList", mav.getViewName());
	}
	
	@Test
	public void memberListTest() throws Exception {
		/***Given***/
		

		/***When***/
		MvcResult result = mockMvc.perform(get("/memManage/memberList")
				.param("page", "1").param("pageSize", "5")
				).andReturn();
		/***Then***/
		ModelAndView mav = result.getModelAndView();
		assertEquals("application/memberListHTML", mav.getViewName());
	}
	
	@Test
	public void memberRegistViewTest() throws Exception{
		/***Given***/
		

		/***When***/
		MvcResult result = mockMvc.perform(get("/memManage/memberRegistView")).andReturn();
		
		/***Then***/
		ModelAndView mav = result.getModelAndView();
		assertEquals("application/memberRegistView", mav.getViewName());
	}
	
	@Test
	public void searchTest() throws Exception{
		/***Given***/
		String searchType = "n";
		String keyword = "bro";
		String page = "1";
		String pageSize = "5";
		
		/***When***/
		MvcResult result = mockMvc.perform(get("/memManage/search")
				.param("searchType", searchType)
				.param("keyword", keyword)
				.param("page", page)
				.param("pageSize", pageSize)
				).andReturn();
		/***Then***/
		ModelAndView mav = result.getModelAndView();
		assertEquals("application/memberListHTML", mav.getViewName());
	}
	
	@Test
	public void ProfileImgViewTest() throws Exception {
		/***Given***/
		String userid = "brown";

		/***When***/
		MvcResult result = mockMvc.perform(get("/memManage/ProfileImgView")
						.param("userid", userid)).andReturn();
		/***Then***/
		ModelAndView mav = result.getModelAndView();
		assertEquals("ProfileImgView", mav.getViewName());
	}
	
	@Test
	public void memberInfoViewTest() throws Exception{
		/***Given***/
		String userid = "brown";
		
		/***When***/
		MvcResult result = mockMvc.perform(get("/memManage/memberInfoView")
						.param("userid", userid)).andReturn();
		/***Then***/
		ModelAndView mav = result.getModelAndView();
		assertEquals("application/memberInfoView", mav.getViewName());
	}
	
	@Test
	public void memberModViewTest() throws Exception{
		/***Given***/
		String userid = "brown";

		/***When***/
		MvcResult result = mockMvc.perform(get("/memManage/memberModView")
							.param("userid", userid)).andReturn();
		/***Then***/
		ModelAndView mav = result.getModelAndView();
		assertEquals("application/memberModView", mav.getViewName());
	}
		
	@Test
	public void memberDeleteTest() throws Exception{
		/***Given***/
		String userid = "cony";

		/***When***/
		MvcResult result = mockMvc.perform(get("/memManage/memberDelete")
						.param("userid", userid)).andReturn();
		/***Then***/
		ModelAndView mav = result.getModelAndView();
		assertEquals("application/memberInfoView", mav.getViewName());
	}
	
	
	@Test
	public void memberModTest() throws Exception{
		/***Given***/
		

		/***When***/

		/***Then***/
	}
	
//	@Test
//	public void memberRegistTest() throws Exception{
//		/***Given***/
//
//		/***When***/
//		MvcResult result = mockMvc.perform(get("/memManage/memberRegist")).andReturn();
//		/***Then***/
//		ModelAndView mav = result.getModelAndView();
//		assertEquals("application/memberRegistView", mav.getViewName());
//	}

	
	
	
	

}
