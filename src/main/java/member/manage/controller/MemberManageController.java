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
	public String memberListMethod(Model model) {
		logger.debug("회원 리스트를 불러오는 중입니다 . . .");
		
		List<MemberVo> memberList = memberService.memberList();
		
		model.addAttribute("memberList", memberList);
		
		return "application/memberListHTML";
	}
	
	
	
}
