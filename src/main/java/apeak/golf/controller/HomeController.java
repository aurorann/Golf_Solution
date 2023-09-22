package apeak.golf.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import apeak.golf.service.HomeService;

@Controller
@RequestMapping("/")
public class HomeController {
	static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	HomeService homeService;
	
	@RequestMapping("/home")
	public String home() {
		
		homeService.test();
		
		return "/all/course_allcourse";
	}
}