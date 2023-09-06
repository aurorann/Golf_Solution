package apeak.golf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import apeak.golf.service.ReportCourseService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/report")
public class ReportCourseController {

	@Autowired
	private ReportCourseService reportCourseService;
	
	@RequestMapping("/course_report")
	private String courseReport() {
		return "/report/course_report";
	}
}