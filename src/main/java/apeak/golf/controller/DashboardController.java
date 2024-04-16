package apeak.golf.controller;

import java.util.Map;
import java.util.UUID;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import apeak.golf.model.dto.UserInfoDTO;
import apeak.golf.model.dto.WorkNotificationDTO;
import apeak.golf.model.dto.WorkReportDTO;
import apeak.golf.service.CourseService;
import apeak.golf.service.DashboardService;

@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/management")
public class DashboardController {

	@Autowired
	private DashboardService dashboardService;

	@Autowired
	private CourseService courseService;
	
	@RequestMapping("/dashboard")
	private String dashBoard(Model model,@RequestParam Map<String, Object> param) {
		
		List<EgovMap> list = courseService.holedata();
		List<EgovMap> getWorkerList = dashboardService.getWorkerList();
		
		model.addAttribute("list", list);
		model.addAttribute("getWorkerList", getWorkerList);
		model.addAttribute("param",param);
		
		dashboardService.holeinfo();
		
		System.out.println("getWorkerList");
		System.out.println(getWorkerList);
		
		return "/management/dashboard/management_dashboard";
	}//dashBoard() end
	

	@RequestMapping(value = "/dashboardAjax", method = RequestMethod.GET)
	@ResponseBody
	public EgovMap dashBoard(@RequestParam String category, @RequestParam String listsort) {
		
		//System.out.println("오류지점 찾기");
		
	    return dashboardService.data(category, listsort);
	}
	
	@RequestMapping("/getNotiList")
	@ResponseBody
	public Map<String,Object> getNotiList(@RequestParam Map<String, Object> pMap){
		UserInfoDTO userInfo = (UserInfoDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int userNo = userInfo.getUserNo();
		String userRole = userInfo.getUserGrade();
		pMap.put("userNo", userNo);
		pMap.put("userRole", userRole);
		System.out.println("userNo"+userNo);
		System.out.println("userRole"+userRole);
		return dashboardService.getNotiList(pMap);
	}
	
	
	//작업등록 하기
	/**
	 * @param param 일반파라미터
	 */
	@ResponseBody
	@RequestMapping(value="/dashboardInsertWork", method = RequestMethod.POST)
	public void insertWorkAjax(@RequestParam Map<String, Object> param) {
		
		UserInfoDTO userInfo = (UserInfoDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
	    try {
	        int userNo = userInfo.getUserNo();
	        param.put("userNo", userNo);

	        dashboardService.insertNotiWork(param);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }//try end
	}//insertWorkAjax end
	
	//작업수정 하기
	/**
	 * @param fileList 파일파라미터
	 * @param param 일반파라미터
	 */
	@ResponseBody
	@RequestMapping(value="/dashboardUpdateWork", method = RequestMethod.POST)
	public void updateNotiWork(@RequestParam Map<String, Object> param) {
		
		UserInfoDTO userInfo = (UserInfoDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int userNo = userInfo.getUserNo();
        param.put("userNo", userNo);

        dashboardService.updateNotiWork(param);

	}//updateWork end
	
	//선택 알림작업 조회하기
	@ResponseBody
	@RequestMapping(value="/selectNotiWorkData", method = RequestMethod.GET)
	private List<WorkNotificationDTO> selectNotiWorkData(int notiNo) {
		
		return dashboardService.selectNotiWorkData(notiNo);
	}//brandAjax() end
	
	//작업자 알림작업갯수 조회
	@ResponseBody
	@RequestMapping(value="/getHeaderNoti", method = RequestMethod.GET)
	private List<WorkNotificationDTO> getHeaderNoti() {
		
		UserInfoDTO userInfo = (UserInfoDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int userNo = userInfo.getUserNo();
        String userRole = userInfo.getUserGrade();
		Map<String, Object> params = new HashMap<>();
        params.put("userNo", userNo);
        params.put("userRole", userRole);

        return dashboardService.getHeaderNoti(params);
	}//brandAjax() end
	
	
	//noticState Update
	@ResponseBody
	@RequestMapping(value = "/updateNotiState", method = RequestMethod.POST)
	public void updateNotiState(@RequestParam String notiNo, @RequestParam String notiState) {

		Map<String, Object> param = new HashMap<>();
	    param.put("notiState", notiState);
	    param.put("notiNo", notiNo);
	    System.out.println(param);
	    System.out.println(notiState);
	    
	    dashboardService.updateNotiState(param);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/deleteNoti", method = RequestMethod.POST)
	public void deleteNoti(int notiNo) {
		
		dashboardService.deleteNoti(notiNo);
	}
	
	
	@RequestMapping("/getSearchNotiList")
	@ResponseBody
	public Map<String,Object> getSearchNotiList(@RequestParam Map<String, Object> pMap){
		UserInfoDTO userInfo = (UserInfoDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int userNo = userInfo.getUserNo();
		String userRole = userInfo.getUserGrade();
		pMap.put("userNo", userNo);
		pMap.put("userRole", userRole);
		return dashboardService.getSearchNotiList(pMap);
	}
	
	

}