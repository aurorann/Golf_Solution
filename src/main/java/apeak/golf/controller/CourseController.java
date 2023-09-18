package apeak.golf.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.golf.service.AllCourseService;
import apeak.golf.service.CourseService;
import apeak.golf.service.DashboardService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/management")
public class CourseController {

	@Autowired
	private CourseService courseService;

	@RequestMapping("/course1")
	private String courseManagement(Model model) {
		
		List<EgovMap> list = courseService.holedata();
		
		System.out.println(list);
		model.addAttribute("list", list);
		
		return "/management/course/management_course1";
	}

	
	@RequestMapping("/course2")
	private String courseManagementlist() {
		
		return "/management/course/management_course2";
	}
	
	//작업종류에 따른 제품브랜드 가져오기
	@ResponseBody
	@RequestMapping(value="/getbrand_ajax", method = RequestMethod.GET)
	private List<EgovMap> brandAjax(@RequestParam(value="worktype",required=false) String worktype) {
		return courseService.branddata(worktype);
	}//brandAjax() end
	
	//작업등록 하기
	@ResponseBody
	@RequestMapping(value="/insertwork_ajax", method = RequestMethod.POST)
	public void insertWorkAjax(@RequestParam Map<String, Object> param) {
		try {
	    String writeat = (String) param.get("writeat");
	    String workstart = (String) param.get("workstart");
	    String workend = (String) param.get("workend");
	    
	    courseService.insertWork(writeat, workstart, workend);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	}//brandAjax() end

}