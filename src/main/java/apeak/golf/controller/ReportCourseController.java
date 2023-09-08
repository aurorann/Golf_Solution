package apeak.golf.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import apeak.golf.model.dto.HoleInfoDTO;
import apeak.golf.service.ReportCourseService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/report")
public class ReportCourseController {

	@Autowired
	private ReportCourseService reportCourseService;
	
	@RequestMapping("/course_report")
	private String courseReport(Model model,String holeNo) {
		
		List<HoleInfoDTO> list = reportCourseService.test();
		
		model.addAttribute("list",list);
		
		return "/report/course_report";
	}//courseReport() end
	
	@ResponseBody
	@RequestMapping("/course_report_ajax1")
	private Map<String,Object> courseReportAjax1() {
		List<HoleInfoDTO> list = reportCourseService.test();
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		
		return resultMap;
	}

	@ResponseBody
	@RequestMapping("/course_report_ajax2")
	private List<HoleInfoDTO> courseReportAjax2() {
		return reportCourseService.test();
	}
	
	@ResponseBody
	@RequestMapping("/course_report_ajax")
	public List<HoleInfoDTO> courseReportAjax(@RequestParam String value) {
		return reportCourseService.getdata(value);
	}
}