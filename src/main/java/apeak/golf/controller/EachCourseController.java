package apeak.golf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import apeak.golf.service.EachCourseService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/each")
public class EachCourseController {

	@Autowired
	private EachCourseService eachCourseService;
	
	@RequestMapping("/course_separatecourse")
	private String courseSeparatecourse() {
		return "/each/course_separatecourse";
	}
}