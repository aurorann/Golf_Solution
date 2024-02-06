package apeak.golf.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import apeak.golf.model.dto.UserInfoDTO;
import apeak.golf.service.CourseService;
import apeak.golf.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mobile")
public class MobileController {
	
	private static boolean devMode = false;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CourseService courseService;
	
	@RequestMapping("/sample")
	@ResponseBody
	public Map<String,Object> sample(){
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> status = new HashMap<String, Object>();
		List<Map<String, Object>> items = null;
		Map<String, Object> mv = new HashMap<String, Object>();

		try {
			//items = apiService.airportWeather(air_code);
			status.put("msg", "OK");
			status.put("code", "200");
		} catch (Exception e) {
			e.printStackTrace();
			if (devMode) {
				status.put("LOGIC_ERROR", e);
			} else {
				status.put("msg", "LOGIC_ERROR");
			}
			status.put("code", "1002");
		}

		resultMap.put("status", status);
		resultMap.put("items", items);

		mv.put("results", resultMap);
		
		return mv;
	}
	
	/*1.작업일정관련*/
	
	
	//작업등록 하기
	/**
	 * @param fileList 파일파라미터
	 * @param param 일반파라미터
	 */
	@ResponseBody
	@RequestMapping(value="/insertWork", method = RequestMethod.POST)
	public Map<String,Object> insertWorkAjax(
			@RequestParam("files[]") List<MultipartFile> fileList,
			@RequestParam Map<String, Object> param) {
		
		UserInfoDTO userInfo = (UserInfoDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

	    
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> status = new HashMap<String, Object>();
		List<Map<String, Object>> items = null;
		Map<String, Object> mv = new HashMap<String, Object>();

		try {
	        String userId = userInfo.getUserId();
	        param.put("userId", userId);
	        
	        
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
	        }

	        courseService.insertWorkReport(param,oriImgNameList, filePathList, saveNameList);
			status.put("msg", "OK");
			status.put("code", "200");
		} catch (Exception e) {
			e.printStackTrace();
			if (devMode) {
				status.put("LOGIC_ERROR", e);
			} else {
				status.put("msg", "LOGIC_ERROR");
			}
			status.put("code", "1002");
		}

		resultMap.put("status", status);
		resultMap.put("items", items);

		mv.put("results", resultMap);
		
		return mv;
	}
	

	//작업수정 하기
	/**
	 * @param fileList 파일파라미터
	 * @param param 일반파라미터
	 */
	@ResponseBody
	@RequestMapping(value="/updateWork", method = RequestMethod.POST)
	public Map<String,Object> updateWork(
			@RequestParam("files[]") List<MultipartFile> fileList,
			@RequestParam Map<String, Object> param) {
		

		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> status = new HashMap<String, Object>();
		List<Map<String, Object>> items = null;
		Map<String, Object> mv = new HashMap<String, Object>();

		try {
			
		UserInfoDTO userInfo = (UserInfoDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userId = userInfo.getUserId();
        param.put("userId", userId);
        
        List<String> oriImgNameList = new ArrayList<String>();
        List<String> saveNameList = new ArrayList<String>();
        List<String> filePathList = new ArrayList<String>();

        //List<MultipartFile> fileList = request.getFiles("files[]");
        String path = "C:\\DATA\\";
        File fileDir = new File(path);
        if (!fileDir.exists()) {
            fileDir.mkdirs();
        }
	    
	    //추가등록할 파일
        for (MultipartFile mf : fileList) {
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
        }
		

			//items = apiService.airportWeather(air_code);
        	courseService.updateWorkReport(param,oriImgNameList, filePathList, saveNameList);
			status.put("msg", "OK");
			status.put("code", "200");
		} catch (Exception e) {
			e.printStackTrace();
			if (devMode) {
				status.put("LOGIC_ERROR", e);
			} else {
				status.put("msg", "LOGIC_ERROR");
			}
			status.put("code", "1002");
		}

		resultMap.put("status", status);
		resultMap.put("items", items);

		mv.put("results", resultMap);
		
		return mv;
	}
	
	//검색 선택작업 조회하기
	@ResponseBody
	@RequestMapping(value="/searchWorkReportListAjax", method = RequestMethod.POST)
	private Map<String, Object>/*EgovMap*/ searchWorkReportList(@RequestParam(value="searchHole[]",required=false) String searchHole,
										@RequestParam(value="searchCourseType[]",required=false) String searchCourseType,
										@RequestParam(value="searchClass[]",required=false) String searchClass,
										@RequestParam(value="searchType[]",required=false) String searchType,
										String searchDate) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> status = new HashMap<String, Object>();
		List<Map<String, Object>> items = null;
		Map<String, Object> mv = new HashMap<String, Object>();

		try {
			//items = apiService.airportWeather(air_code);
			courseService.searchWorkReportList(searchHole, searchCourseType, searchClass, searchType,searchDate);
			status.put("msg", "OK");
			status.put("code", "200");
		} catch (Exception e) {
			e.printStackTrace();
			if (devMode) {
				status.put("LOGIC_ERROR", e);
			} else {
				status.put("msg", "LOGIC_ERROR");
			}
			status.put("code", "1002");
		}

		resultMap.put("status", status);
		resultMap.put("items", items);

		mv.put("results", resultMap);
		
		return mv;
				
	}//brandAjax() end
	
	
	//수정할 작업 조회하기
	@ResponseBody
	@RequestMapping(value="/workReportUpdateList", method = RequestMethod.GET)
	private Map<String, Object> /*List<EgovMap>*/ workReportUpdateList(@RequestParam(value="workNo",required=false) String workNo) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> status = new HashMap<String, Object>();
		List<Map<String, Object>> items = null;
		Map<String, Object> mv = new HashMap<String, Object>();

		try {
			//items = apiService.airportWeather(air_code);
			courseService.workReportUpdateList(workNo);
			status.put("msg", "OK");
			status.put("code", "200");
		} catch (Exception e) {
			e.printStackTrace();
			if (devMode) {
				status.put("LOGIC_ERROR", e);
			} else {
				status.put("msg", "LOGIC_ERROR");
			}
			status.put("code", "1002");
		}

		resultMap.put("status", status);
		resultMap.put("items", items);

		mv.put("results", resultMap);
		
		return mv;
		
	}//brandAjax() end
	
	//작업 삭제
	@ResponseBody
	@RequestMapping(value="/workReportDelete", method = RequestMethod.POST)
	private Map<String, Object> workReportDelete(@RequestParam(value="workNo",required=false) String workNo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> status = new HashMap<String, Object>();
		List<Map<String, Object>> items = null;
		Map<String, Object> mv = new HashMap<String, Object>();

		try {
			//items = apiService.airportWeather(air_code);
			courseService.workReportDelete(workNo);
			status.put("msg", "OK");
			status.put("code", "200");
		} catch (Exception e) {
			e.printStackTrace();
			if (devMode) {
				status.put("LOGIC_ERROR", e);
			} else {
				status.put("msg", "LOGIC_ERROR");
			}
			status.put("code", "1002");
		}

		resultMap.put("status", status);
		resultMap.put("items", items);

		mv.put("results", resultMap);
		
		return mv;
	}//brandAjax() end

	/*2.사용자 관리*/
	//로그인(MemberAuthenticationProvider 참고해서 개발 진행)
	@ResponseBody
	@RequestMapping(value="/login", method = RequestMethod.POST)
	private Map<String, Object> login(){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> status = new HashMap<String, Object>();
		List<Map<String, Object>> items = null;
		Map<String, Object> mv = new HashMap<String, Object>();
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
			if (devMode) {
				status.put("LOGIC_ERROR", e);
			} else {
				status.put("msg", "LOGIC_ERROR");
			}
			status.put("code", "1002");
		}
		
		resultMap.put("status", status);
		resultMap.put("items", items);

		mv.put("results", resultMap);
		
		return mv;
	}
	
	
}