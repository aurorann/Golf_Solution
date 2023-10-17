package apeak.golf.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String userManagement() {
		return "/user/user_management";
	}
}