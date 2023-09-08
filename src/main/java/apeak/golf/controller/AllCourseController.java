package apeak.golf.controller;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/test")
	@ResponseBody
	private List<EgovMap> test(){
		return allCourseService.test();
	}
}