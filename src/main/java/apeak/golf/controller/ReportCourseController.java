package apeak.golf.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import apeak.golf.model.dto.HoleInfoDTO;
import apeak.golf.model.dto.SensorInfoDTO;
import apeak.golf.service.CourseService;
import apeak.golf.service.ReportCourseService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/report")
public class ReportCourseController {

	@Autowired
	private ReportCourseService reportCourseService;

	@Autowired
	private CourseService courseService;
	
//	@RequestMapping("/course_report1")
//	private String courseReport(Model model,String holeNo) {
//		
//		List<HoleInfoDTO> list = reportCourseService.test();
//		
//		model.addAttribute("list",list);
//		
//		return "/report/course_report";
//	}//courseReport() end
	
//	@ResponseBody
//	@RequestMapping("/course_report_ajax1")
//	private Map<String,Object> courseReportAjax1() {
//		List<HoleInfoDTO> list = reportCourseService.test();
//		
//		Map<String,Object> resultMap = new HashMap<String, Object>();
//		resultMap.put("list", list);
//		
//		return resultMap;
//	}

//	@ResponseBody
//	@RequestMapping("/course_report2")
//	private List<HoleInfoDTO> courseReportAjax2() {
//		return reportCourseService.test();
//	}
	
//	@RequestMapping("/course_report")
//	private String courseReportAjax(@RequestParam(value="hole",required=false) String hole, @RequestParam(value="category",required=false) String category, Model model) {
//	    List<HoleInfoDTO> list = reportCourseService.getdata(hole, category);
//		model.addAttribute("data",list);
//		return "/report/course_report";
//	}
	
	//hole 모든정보 가져오기
	@RequestMapping("/course_report")
	private String courseReport(Model model) {
		List<EgovMap> list = courseService.holedata();
		model.addAttribute("list", list);

		return "/report/course_report";
	}


	
	@ResponseBody
	@RequestMapping(value = "/course_report_ajax", method = RequestMethod.GET)
	public EgovMap courseReportAjax(@RequestParam(value="hole",required=false) String hole, 
									@RequestParam(value="category",required=false) String category, 
									@RequestParam(value="selectDate",required=false) String selectDate, 
									@RequestParam(value="beforeDate",required=false) String beforeDate) {
		return reportCourseService.getData(hole, category, selectDate, beforeDate);
	}
	
	
	//@ResponseBody
	//@RequestMapping(value = "/course_report_ajax", method = RequestMethod.GET)
	//public Map<String, Object> courseReportAjax(@RequestParam(value="hole",required=false) String hole, 
	//		@RequestParam(value="category",required=false) String category) {
	//	return reportCourseService.getdata(hole, category);
	//}
	
	
	//데이터 검색
	@ResponseBody
	@RequestMapping(value = "/course_report_search_ajax", method = RequestMethod.GET)
	public EgovMap courseReportSearchAjax(@RequestParam(value="holeNo",required=false) String holeNo, 
										@RequestParam(value="workStart",required=false) String workStart,
										@RequestParam(value="workEnd",required=false) String workEnd) {
		System.out.println(holeNo);
	return reportCourseService.getSearchData(holeNo, workStart, workEnd);
	}
	
	//모든 홀 데이터 검색
	@ResponseBody
	@RequestMapping(value = "/course_report_allsearch_ajax", method = RequestMethod.GET)
	public EgovMap courseReportAllSearchAjax(@RequestParam(value="workStart",required=false) String workStart,
											@RequestParam(value="workEnd",required=false) String workEnd) {
		return reportCourseService.getSearchAllData(workStart, workEnd);
	}
	
	
	
	
	
	
}