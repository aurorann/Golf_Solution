package apeak.golf.controller;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.golf.service.EachCourseService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/each")
public class EachCourseController {

	@Autowired
	private EachCourseService eachCourseService;
	
	@RequestMapping("/course_separatecourse")
	private String eachCourse() {
		return "/each/course_separatecourse";
	}//eachCourse end
	
	@ResponseBody
	@RequestMapping(value = "/course_separatecourse_ajax", method = RequestMethod.GET)
	private EgovMap courseSeparatecourse(@RequestParam String category) {
		//System.out.println(category);
		return eachCourseService.ndviData(category);
	}
}