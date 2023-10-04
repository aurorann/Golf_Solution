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
public class ManagementCourseController {

	@Autowired
	private CourseService courseService;

	//hole 이름 가져오기
	@RequestMapping("/course1")
	private String courseManagement(Model model) {
		
		List<EgovMap> list = courseService.holedata();
		
		//System.out.println(list);
		model.addAttribute("list", list);
		
		return "/management/course/management_course1";
	}

	//hole 이름 가져오기
	@RequestMapping("/course2")
	private String courseManagementlist(Model model) {
		
		List<EgovMap> list = courseService.holedata();
		model.addAttribute("list", list);
		
		return "/management/course/management_course2";
	}
	
	//작업등록 하기
	@ResponseBody
	@RequestMapping(value="/insertwork_ajax", method = RequestMethod.POST)
	public void insertWorkAjax(@RequestParam Map<String, Object> param) {
		try {
	    String workstart = (String) param.get("workstart");
	    String workend = (String) param.get("workend");
	    String hole = (String) param.get("hole");
	    String course = (String) param.get("course");
	    String workclass = (String) param.get("workclass");
	    String worktype = (String) param.get("worktype");
	    String workbrand = (String) param.get("workbrand");
	    String oriImgName = (String) param.get("oriImgName");
	    String comment = (String) param.get("comment");
	    
	    courseService.insertWork(workstart, workend, hole, course, workclass, worktype, workbrand, oriImgName, comment);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	}//brandAjax() end
	
	
	//전체 작업 리포트 가져오기
	@ResponseBody
	@RequestMapping(value="/workReportAllList", method = RequestMethod.GET)
	private List<EgovMap> workReportAllList() {
		return courseService.workReportAllList();
	}//brandAjax() end
	
	
	//검색 선택작업 조회하기
	@ResponseBody
	@RequestMapping(value="/searchWorkReportListAjax", method = RequestMethod.GET)
	private EgovMap searchWorkReportList(@RequestParam(value="searchHole",required=false) String searchHole,
										@RequestParam(value="searchCourseType",required=false) String searchCourseType,
										@RequestParam(value="searchClass",required=false) String searchClass,
										@RequestParam(value="searchType",required=false) String searchType) {
		
		System.out.println(searchHole);
		System.out.println(searchCourseType);
		System.out.println(searchClass);
		System.out.println(searchType);
		
		return courseService.searchWorkReportList(searchHole, searchCourseType, searchClass, searchType);
	}//brandAjax() end
	
	
	//수정할 작업 조회하기
	@ResponseBody
	@RequestMapping(value="/workReportUpdateList", method = RequestMethod.GET)
	private List<EgovMap> workReportUpdateList(@RequestParam(value="workNo",required=false) String workNo) {
		
		return courseService.workReportUpdateList(workNo);
	}//brandAjax() end
	
	
	//작업종류에 따른 제품브랜드 가져오기
	@ResponseBody
	@RequestMapping(value="/getbrand_ajax", method = RequestMethod.GET)
	private List<EgovMap> brandAjax(@RequestParam(value="worktype",required=false) String worktype) {
		return courseService.branddata(worktype);
	}//brandAjax() end
	
	
	
	
	
	
	
	
	
	
	
}