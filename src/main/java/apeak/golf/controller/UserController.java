package apeak.golf.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.golf.model.dto.UserInfoDTO;
import apeak.golf.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/user_changePwForm")
	public String userChangePwForm(String password) {
		boolean match = userService.userCheckPw(password);
		
		if(match) {
			return "/user/user_changePwForm";
		}else {
			throw new RuntimeException("기존 비밀번호가 일치하지 않습니다.");
		}
	}
	
	@RequestMapping("/updateUserPw")
	public String userChangePw(HttpServletRequest request, HttpServletResponse response,String password) {
		
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    
	    UserInfoDTO userInfo = (UserInfoDTO)authentication.getPrincipal();
	    
	    String userId = userInfo.getUserId();
	    
	    EgovMap paramMap = new EgovMap();
	    
	    paramMap.put("userId", userId);
	    paramMap.put("userPw", password);
	    
	    userService.updateUserPw(paramMap);
	    
	    if (authentication != null) {
	        new SecurityContextLogoutHandler().logout(request, response, authentication);
	    }
	    return "redirect:/";
	}
	
	@RequestMapping("/updateUserInfo")
	public String updateUserInfo(UserInfoDTO userInfo) {
		
		userService.updateUserInfo(userInfo);
		
		return "redirect:/user/user_info";
	}
	
	@RequestMapping("/user_info")
	public String userInfo() {
		return "/user/user_info";
	}
	
	@RequestMapping("/user_management")
	public String userManagement(Model model) {
		
		List<EgovMap> list = userService.userList();
		model.addAttribute("list", list);
				
		return "/user/user_management";
	}
	
	@RequestMapping("/getUserList")
	@ResponseBody
	public Map<String,Object> getUserList(@RequestParam Map<String, Object> pMap){
		return userService.getUserList(pMap);
	}
	
	//회원등급 수정 조회
	@ResponseBody
	@RequestMapping("/userGradeModifyList")
	public List<EgovMap> userGradeModifyList(@RequestParam(value="userNo",required=false) int userNo) {
		
		return userService.userGradeModifyList(userNo);
	}
	
	//회원등급 수정
	@ResponseBody
	@RequestMapping("/userGradeModify")
	public int userGradeModify(@RequestParam(value="grade",required=false) String grade,
								@RequestParam(value="userNo",required=false) int userNo) {
		
		return userService.userGradeModify(grade, userNo);
	}
	
	//회원아이디 중복 확인
	@ResponseBody
	@RequestMapping("/userIdChk")
	public int userIdChk(@RequestParam(value="userId") String userId) {
		
		return userService.userIdChk(userId);
	}
	
	//회원추가
	@ResponseBody
	@RequestMapping("/userInsert")
	public String userInsert(@RequestParam(value="userId") String userId,
									@RequestParam(value="userPw") String userPw,
									@RequestParam(value="userName") String userName,
									@RequestParam(value="userGrade") String userGrade,
									@RequestParam(value="userDepartment") String userDepartment,
									@RequestParam(value="userEmail") String userEmail,
									@RequestParam(value="userPhone") String userPhone) {
		
		
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    
	    UserInfoDTO userInfo = (UserInfoDTO)authentication.getPrincipal();
		
		EgovMap paramMap = new EgovMap();
		paramMap.put("userId", userId);
		paramMap.put("userPw", userPw);
		paramMap.put("userName", userName);
		paramMap.put("userGrade", userGrade);
		paramMap.put("userDepartment", userDepartment);
		paramMap.put("userEmail", userEmail);
		paramMap.put("userPhone", userPhone);
		
		userService.userInsert(paramMap);
		
	    return "redirect:/";

	}
	
	
	
	
	
	
	
}