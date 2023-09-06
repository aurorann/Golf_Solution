package apeak.golf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import apeak.golf.service.AllCourseService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/all")
public class AllCourseController {

	@Autowired
	private AllCourseService allCourseService;

	@RequestMapping("/course_allcourse")
	private String courseAllcourse() {
		return "/all/course_allcourse";
	}
}