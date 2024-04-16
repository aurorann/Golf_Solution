package apeak.golf.controller;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.golf.service.EachCourseService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/each")
@CrossOrigin(origins = "*")
public class EachCourseController {

	@Autowired
	private EachCourseService eachCourseService;
	
	@RequestMapping("/course_separatecourse")
	private String eachCourse(Model model) {
		model.addAttribute("mainData", eachCourseService.courseSeparatecourseAjax("FAIRWAY", "ASC"));
		return "/each/course_separatecourse";
	}//eachCourse end
	
	@ResponseBody
	@RequestMapping(value = "/course_separatecourse_ajax", method = RequestMethod.GET)
	private EgovMap courseSeparatecourseAjax(@RequestParam String category, @RequestParam String listsort) {
		//System.out.println(category);
		return eachCourseService.courseSeparatecourseAjax(category, listsort);
	}
	
	@ResponseBody
	@RequestMapping("/getChartDataList")
	private EgovMap getChartDataList(String category,String listsort) {
		return eachCourseService.getChartDataList(category,listsort);
	}
}