package apeak.golf.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import apeak.golf.service.HomeService;

@Controller
@RequestMapping("/")
@CrossOrigin
public class HomeController {
	static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	HomeService homeService;
	
	@Autowired
	PasswordEncoder encode;
	
	@RequestMapping("/")
	public String loginForm() {
		System.out.println(encode.encode("1111"));
		return "/loginForm";
	}
}