package apeak.golf.controller;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.golf.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/user_changepw")
	public String userChangepw() {
		return "/user/user_changepw";
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
	
	
	
	
	
	
	
}