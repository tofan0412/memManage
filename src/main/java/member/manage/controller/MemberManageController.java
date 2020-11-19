package member.manage.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import member.manage.model.MemberVo;
import member.manage.model.PageVo;
import member.manage.service.MemberManageServiceI;

@RequestMapping("/memManage")
@Controller
public class MemberManageController {
	private static final Logger logger = LoggerFactory.getLogger(MemberManageController.class);

	@Resource(name = "memberService")
	MemberManageServiceI memberService;

	@Resource(name = "MemberVo")
	private MemberVo memberVo;

	@RequestMapping("loginView")
	public String loginView() {
		logger.debug("로그인뷰 메서드 진입");
		return "application/loginView";
	}
	
	@RequestMapping("home")
	public String home() {
		return "application/memberList";
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
		} else
			return "application/loginView";
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
	public String memberRegist(@Valid MemberVo memberVo, BindingResult br, 
			@RequestPart("file") MultipartFile file, Model model) {
		logger.debug("사용자 등록 메서드 진입 ...");
		logger.debug("회원 정보 : {}", memberVo);

		// Search duclication of userid. . .
		MemberVo duplicate = memberService.memberInfo(memberVo.getUserid());
		if (duplicate != null) {
//			ObjectError error = new ObjectError("memberVo", "DUPLICATE_ERR", "userid", "DUPLICATE_ERR");
//			br.addError(error);
			return "application/duplicate";
		}
		
		if (br.hasErrors()) {
			return "application/memberRegistView";
		}

		int result;
		// When user uploaded the img File ... UPLOAD!
		if (file.getSize() > 0) {
			String filename = "d:/upload/" + file.getOriginalFilename();
			String realfilename = file.getOriginalFilename();
			memberVo.setRealFilename(realfilename);
			memberVo.setFilename(filename);

			logger.debug("경로 : {}, 파일 이름 : {}", filename, realfilename);

			// UPLOAD TO SERVER
			File uploadFile = new File(filename);
			try {
				file.transferTo(uploadFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			result = memberService.memberRegist(memberVo);
		}

		// regist without file upload !
		else {
			String filename = "";
			String realfilename = "";
			memberVo.setRealFilename(realfilename);
			memberVo.setFilename(filename);
			result = memberService.memberRegist(memberVo);
		}

		if (result > 0) {
			return memberInfoView(memberVo.getUserid(), model);
		} else
			return "application/memberRegistView";

	}

	@RequestMapping("search")
	public String search(String searchType, String keyword, PageVo pageVo, Model model) {
		List<MemberVo> memberList = new ArrayList<MemberVo>();

		keyword = "%".concat(keyword).concat("%");
		logger.debug("검색어 : {}", keyword);

		switch (searchType) {
		case "i":
			memberList = memberService.searchById(keyword);
			break;
		case "n":
			memberList = memberService.searchByName(keyword);
			break;
		case "a":
			memberList = memberService.searchByAlias(keyword);
			break;
		default:
		}
		logger.debug("검색 결과 : {}개의 데이터를 찾았습니다.", memberList.size());
		logger.debug("현재 페이징 상태 : {}페이지, 페이지당 {}개", pageVo.getPage(), pageVo.getPageSize());

		model.addAttribute("memberList", memberList);

		// 검색 결과에 대한 페이징 처리도 해야 한다 ...
		int tot_cnt = memberList.size();
		int pageSize = pageVo.getPageSize();

		int page_cnt = (int) Math.ceil(((double) tot_cnt / pageSize));
		model.addAttribute("page_cnt", page_cnt);
		model.addAttribute("page", pageVo.getPage());
		model.addAttribute("pageSize", pageVo.getPageSize());

		return "application/memberListHTML";
	}

	@RequestMapping("ProfileImgView")
	public String userImg(@RequestParam("userid") String userid, Model model) {
		logger.debug("image upload method . . . . . ");
		logger.debug("이미지를 불러올 사용자의 id : {}", userid);

		MemberVo memberVo = memberService.memberInfo(userid);

		model.addAttribute("filepath", memberVo.getFilename());

		return "ProfileImgView";
	}
	
	@RequestMapping("memberInfoView")
	public String memberInfoView(String userid, Model model) {
		MemberVo memberVo = memberService.memberInfo(userid);
		
		model.addAttribute("memberVo", memberVo);
		return "application/memberInfoView";
	}
	
	@RequestMapping("memberModView")
	public String memberModView(String userid, Model model) {
		MemberVo memberVo = memberService.memberInfo(userid);
		
		model.addAttribute("memberVo", memberVo);
		return "application/memberModView";
	}
	
	@RequestMapping("memberMod")
	public String memberMod(@Valid MemberVo memberVo, BindingResult br, 
			@RequestPart("file") MultipartFile file, Model model) {
		logger.debug("사용자 정보 수정 메서드 진입 ...");
		logger.debug("회원 정보 : {}", memberVo);

		if (br.hasErrors()) {
			return "application/memberModView";
		}

		int result;
		// When user uploaded the img File ... UPLOAD!
		if (file.getSize() > 0) {
			
			// 기존에 존재하는 파일을 지워야 한다.
			
			
			
			String filename = "d:/upload/" + file.getOriginalFilename();
			String realfilename = file.getOriginalFilename();
			memberVo.setRealFilename(realfilename);
			memberVo.setFilename(filename);

			logger.debug(" 새로운 파일 경로 : {}, 새 파일 이름 : {}", filename, realfilename);

			// UPLOAD TO SERVER
			File uploadFile = new File(filename);
			try {
				file.transferTo(uploadFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			result = memberService.memberUpdate(memberVo);
		}

		// update without file upload !
		else {
			MemberVo refer = memberService.memberInfo(memberVo.getUserid());
			
			memberVo.setRealFilename(refer.getRealFilename());
			memberVo.setFilename(refer.getFilename());
			result = memberService.memberUpdate(memberVo);
		}

		if (result > 0) {
			return memberInfoView(memberVo.getUserid(), model);
		} else
			return "redirect:application/memberModView";
	}
	
	@RequestMapping("memberDelete")
	public String memberDelete(String userid, Model model) {
		int result = memberService.memberDelete(userid);
		if (result > 0) return home();
		else return memberInfoView(userid, model);
	}
}
