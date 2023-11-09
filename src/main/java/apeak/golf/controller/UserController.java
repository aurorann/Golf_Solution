package apeak.golf.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import apeak.golf.model.dto.UserInfoDTO;
import apeak.golf.service.UserService;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/user_changePwForm")
	public String userChangePwForm(String password) {
		boolean match = userService.userCheckPw(password);
		
		if(match) {
			return "/user/user_changePwForm";
		}else {
			throw new RuntimeException("기존 비밀번호가 일치하지 않습니다.");
		}
	}
	
	@RequestMapping("/updateUserPw")
	public String userChangePw(HttpServletRequest request, HttpServletResponse response,String password) {
		
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    
	    UserInfoDTO userInfo = (UserInfoDTO)authentication.getPrincipal();
	    
	    String userId = userInfo.getUserId();
	    
	    EgovMap paramMap = new EgovMap();
	    
	    paramMap.put("userId", userId);
	    paramMap.put("userPw", password);
	    
	    userService.updateUserPw(paramMap);
	    
	    if (authentication != null) {
	        new SecurityContextLogoutHandler().logout(request, response, authentication);
	    }
	    return "redirect:/";
	}
	
	@RequestMapping("/updateUserInfo")
	public String updateUserInfo(UserInfoDTO userInfo, 
			@RequestPart(value="userImgOriName",required=false) MultipartFile file) {
		
	    try {
	        if (file != null && !file.isEmpty()) {
	            String path = "C:\\DATA\\USER_IMAGE";
	            File fileDir = new File(path);
	            if (!fileDir.exists()) {
	                fileDir.mkdirs();
	            }
	            
	            String oriImgName = file.getOriginalFilename();
	            String ext = oriImgName.substring(oriImgName.lastIndexOf("."));
	            String imgName = UUID.randomUUID().toString().replace("-", "");
	            String saveName = imgName+ext;
	            
	            file.transferTo(new File(path, saveName)); 
	            
	            String userImgOriName = oriImgName;
	            String userImgSaveName = saveName;
	            String userImgFilePath = path + "\\" + saveName;
	            
	            System.out.println(userImgOriName);
	            System.out.println(userImgSaveName);
	            System.out.println(userImgFilePath);
            	
	            userInfo.setUserImgOriName(userImgOriName);
	            userInfo.setUserImgSaveName(userImgSaveName);
	            userInfo.setUserImgFilePath(userImgFilePath);
	        }
	        
	        userService.updateUserInfo(userInfo);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return "redirect:/user/user_info";
	}

	
	@RequestMapping("/user_info")
	public String userInfo() {
		return "/user/user_info";
	}
	
	@RequestMapping("/user_management")
	public String userManagement(Model model) {
		
		List<EgovMap> list = userService.userList();
		model.addAttribute("list", list);
				
		return "/user/user_management";
	}
	
	@RequestMapping("/getUserList")
	@ResponseBody
	public Map<String,Object> getUserList(@RequestParam Map<String, Object> pMap){
		return userService.getUserList(pMap);
	}
	
	//회원등급 수정 조회
	@ResponseBody
	@RequestMapping("/userGradeModifyList")
	public List<EgovMap> userGradeModifyList(@RequestParam(value="userNo",required=false) int userNo) {
		
		return userService.userGradeModifyList(userNo);
	}
	
	//회원정보 수정
	@ResponseBody
	@RequestMapping("/userInfoModify")
	public String userInfoModify(@RequestParam(value="userGrade") String userGrade,
							@RequestParam(value="userNo") int userNo,
							@RequestParam(value="userName") String userName,
							@RequestParam(value="userDepartment") String userDepartment,
							@RequestParam(value="userPhone") String userPhone,
							@RequestParam(value="userEmail") String userEmail) {
		
		
		EgovMap paramMap = new EgovMap();
		paramMap.put("userNo", userNo);
		paramMap.put("userName", userName);
		paramMap.put("userGrade", userGrade);
		paramMap.put("userDepartment", userDepartment);
		paramMap.put("userEmail", userEmail);
		paramMap.put("userPhone", userPhone);
		
		userService.userInfoModify(paramMap);
		
	    return "redirect:/";
	}
	
	//회원아이디 중복 확인
	@ResponseBody
	@RequestMapping("/userIdChk")
	public int userIdChk(@RequestParam(value="userId") String userId) {
		
		return userService.userIdChk(userId);
	}
	
	//회원추가
	@ResponseBody
	@RequestMapping(value="/userInsert", method = RequestMethod.POST)
	public void userInsert(@RequestParam(value="file",required=false) MultipartFile file,
							@RequestParam Map<String, Object> param) {
	
		UserInfoDTO userInfo = (UserInfoDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	
		try {
			if (file != null && !file.isEmpty()) {
				String path = "C:\\DATA\\USER_IMAGE";
				File fileDir = new File(path);
				if (!fileDir.exists()) {
				    fileDir.mkdirs();
				}
				
				String oriImgName = file.getOriginalFilename();
				String ext = oriImgName.substring(oriImgName.lastIndexOf("."));
				String imgName = UUID.randomUUID().toString().replace("-", "");
				String saveName = imgName+ext;
				
				file.transferTo(new File(path, saveName)); 				
				
	            String userImgOriName = oriImgName;
	            String userImgSaveName = saveName;
	            String userImgFilePath = path + "\\" + saveName;
				
				userService.userInsert(param, userImgOriName, userImgFilePath, userImgSaveName);
			} else {
				userService.userInsert(param, null, null, null);
			}
	
		} catch (Exception e) {
	    	e.printStackTrace();
		}
	}//userInsert() end


	
	//회원검색
	@ResponseBody
	@RequestMapping("/userSearchList")
	public Map<String,Object> userSearch(@RequestParam Map<String, Object> pMap) {
		
		//EgovMap paramMap = new EgovMap();
		//paramMap.put("searchType", searchType);
		//paramMap.put("searchText", searchText);
		//paramMap.put("curPage", curPage);
		
		return userService.userSearchList(pMap);
	}
	
	
	
	
	
	
	
	
	
	
}