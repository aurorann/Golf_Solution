package apeak.golf.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import apeak.golf.model.dto.UserInfoDTO;
import apeak.golf.service.CourseService;
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
	public void insertWorkAjax(@RequestParam("files[]") List<MultipartFile> fileList,@RequestParam Map<String, Object> param) {
		
		UserInfoDTO userInfo = (UserInfoDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
	    try {
	        String workStart = (String) param.get("workStart");
	        String workEnd = (String)param.get("workEnd");
	        String hole = (String)param.get("hole");
	        String course = (String) param.get("course");
	        String workClass = (String) param.get("workClass");
	        String workType = (String) param.get("workType");
	        String workBrand = (String) param.get("workBrand");
	        String comment = (String) param.get("comment");
	        String userId = userInfo.getUserId();
	        
	        
	        List<String> oriImgNameList = new ArrayList<String>();
	        List<String> saveNameList = new ArrayList<String>();
	        List<String> filePathList = new ArrayList<String>();

	        //List<MultipartFile> fileList = request.getFiles("files[]");
	        String path = "C:\\DATA\\";
	        File fileDir = new File(path);
	        if (!fileDir.exists()) {
	            fileDir.mkdirs();
	        }
		    
		    
	        for (MultipartFile mf : fileList) {
	            try {
	            	
	            	String oriImgName = mf.getOriginalFilename();
	            	//이미지 확장자 자르기
	            	String ext = oriImgName.substring(oriImgName.lastIndexOf("."));
	    		    //이미지 랜덤명 생성
	    	        String imgName = UUID.randomUUID().toString().replace("-", "");
	    		    //이미지 저장 이름
	    		    String saveName = imgName+ext;
	            	
	    		    saveNameList.add(saveName);
	    		    oriImgNameList.add(oriImgName);
	    		    filePathList.add(path+"\\"+saveName);
	    		    
	    		    
	                mf.transferTo(new File(path, saveName));    		
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }

	        courseService.insertWorkReport(workStart, workEnd, hole, course, workClass, workType, workBrand, oriImgNameList, comment, filePathList, saveNameList,userId);

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
	@RequestMapping(value="/searchWorkReportListAjax", method = RequestMethod.POST)
	private EgovMap searchWorkReportList(@RequestParam(value="searchHole[]",required=false) String searchHole,
										@RequestParam(value="searchCourseType[]",required=false) String searchCourseType,
										@RequestParam(value="searchClass[]",required=false) String searchClass,
										@RequestParam(value="searchType[]",required=false) String searchType) {
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
	private List<EgovMap> brandAjax(@RequestParam(value="workType",required=false) String workType) {
		return courseService.getBrandData(workType);
	}//brandAjax() end
	
	
	//작업 삭제
	@ResponseBody
	@RequestMapping(value="/workReportDelete", method = RequestMethod.POST)
	private void workReportDelete(@RequestParam(value="workNo",required=false) String workNo) {
		System.out.println("삭제번호"+workNo);
		courseService.workReportDelete(workNo);
	}//brandAjax() end
	
	
	
	
	
	
	
	
	
	
	
}