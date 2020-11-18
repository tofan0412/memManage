package member.manage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.manage.model.MemberVo;
import member.manage.model.PageVo;
import member.manage.service.MemberManageServiceI;

@RequestMapping("/memManage")
@Controller
public class MemberManageController {
	private static final Logger logger = LoggerFactory.getLogger(MemberManageController.class);
	
	@Resource(name="memberService")
	MemberManageServiceI memberService;
	
	@Resource(name="MemberVo")
	private MemberVo memberVo;
	
	@RequestMapping("loginView")
	public String loginView() {
		logger.debug("로그인뷰 메서드 진입");
		return "application/loginView";
	}
	
	
	@RequestMapping("loginMethod")
	public String loginMethod(String userid, String pass, HttpSession session) {
		logger.debug("로그인 아이디 : {}, 비밀번호 : {}", userid, pass);
		
		Map<String, String> userInfo = new HashMap<String, String>();
		userInfo.put("userid", userid);
		userInfo.put("pass", pass);
		
		MemberVo result = memberService.login(userInfo);
		if (result != null) {
			session.setAttribute("s_member", result);
			return "application/memberList";
		}
		else return "application/loginView";
	}
	
	@RequestMapping("memberList")
	public String memberListMethod(PageVo pageVo, Model model) {
		logger.debug("회원 리스트를 불러오는 중입니다 . . .");
		logger.debug("페이지 번호 : {}, 페이지크기 : {}", pageVo.getPage(), pageVo.getPageSize());
		
		List<MemberVo> memberList = memberService.memberList(pageVo);
		
		model.addAttribute("memberList", memberList);
		
		// 필요한 전체 페이지 개수를 계산한다. 
		
		List<MemberVo> memberListAll = memberService.memberListAll();
		int tot_cnt = memberListAll.size();
		int pageSize = pageVo.getPageSize();
		
		int page_cnt = (int) Math.ceil(((double) tot_cnt / pageSize));
		model.addAttribute("page_cnt", page_cnt);
		model.addAttribute("page", pageVo.getPage());
		model.addAttribute("pageSize", pageVo.getPageSize());
		
		return "application/memberListHTML";
	}
	
	@RequestMapping("memberRegistView")
	public String memberRegistView() {
		return "application/memberRegistView";
	}
	
	
	@RequestMapping("memberRegist")
	public String memberRegist(MemberVo memberVo) {
		logger.debug("사용자 등록 메서드 진입 ...");
		return "";
	}
	
	
}
