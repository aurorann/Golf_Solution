package apeak.golf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sign")
public class SignController {
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		
		return "sign/loginForm";
	}
}
