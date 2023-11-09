package apeak.golf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import apeak.golf.model.dao.UserImageDAO;
import apeak.golf.model.dao.UserInfoDAO;
import apeak.golf.model.dto.UserInfoDTO;
import apeak.golf.util.PagingUtil;

@Service
@Transactional
public class UserService {

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private UserInfoDAO userInfoDAO;
	
	@Autowired
	private UserImageDAO userImageDAO;
	
	//회원 조회
	public List<EgovMap> userList() {
		return userInfoDAO.userList();
	}//userList() end
	
	//회원등급 수정 조회
	public List<EgovMap> userGradeModifyList(int userNo) {
		return userInfoDAO.userGradeModifyList(userNo);
	}//userGradeModifyList() end
	
	//회원등급 수정
	public void userInfoModify(EgovMap paramMap) {
		userInfoDAO.userInfoModify(paramMap);
	}//userGradeModifyList() end
	
	public void example() {
		passwordEncoder.encode("패스워드 암호화");
		//DB에서 꺼내온값과 사용자 입력값 비교
		passwordEncoder.matches("", "");
	}

	public Map<String, Object> getUserList(Map<String, Object> paramMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		int curPage = Integer.parseInt((String) paramMap.get("curPage"));

		int listCnt = userInfoDAO.getUserListCnt(paramMap);

		PagingUtil pager = new PagingUtil(listCnt, curPage);
		pager.setPageSize(10);
		paramMap.put("startIndex", pager.getStartIndex());
		paramMap.put("pageSize", pager.getPageSize());
		
		List<UserInfoDTO> list = userInfoDAO.getUserList(paramMap);

		resultMap.put("listCnt", listCnt);
		resultMap.put("list", list);
		resultMap.put("pager", pager);
		
		return resultMap;
	}
	
	

	public Map<String, Object> userSearchList(Map<String, Object> paramMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int curPage = Integer.parseInt((String) paramMap.get("curPage"));
		
		int listCnt = userInfoDAO.userSearchListCnt(paramMap);
		
		PagingUtil pager = new PagingUtil(listCnt, curPage);
		pager.setPageSize(10);
		paramMap.put("startIndex", pager.getStartIndex());
		paramMap.put("pageSize", pager.getPageSize());
		
		List<UserInfoDTO> list = userInfoDAO.userSearchList(paramMap);

		resultMap.put("listCnt", listCnt);
		resultMap.put("list", list);
		resultMap.put("pager", pager);
		
		return resultMap;
	}
	

	public boolean userCheckPw(String password) {
		UserInfoDTO userInfo = (UserInfoDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		UserInfoDTO user = userInfoDAO.selectUserById(userInfo.getUserId());
		
		return passwordEncoder.matches(password,user.getUserPw());
	}

	public void updateUserPw(EgovMap paramMap) {
		paramMap.put("userPw", passwordEncoder.encode(paramMap.get("userPw").toString()));
		userInfoDAO.updateUserPw(paramMap);
	}

	public void updateUserInfo(Map<String, Object> params) {
		UserInfoDTO info = (UserInfoDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//userInfo.setUserId(info.getUserId());
		userInfoDAO.updateUserInfo(params);
		
		/*
		info.setEmail(params.getEmail());
		info.setHp(params.getHp());
		*/
		
		info.setEmail((String) params.get("email"));
		info.setHp((String) params.get("hp"));		
		
		
		if(params.get("userImgOriName") != null) {
			info.setUserImgFilePath((String) params.get("userImgFilePath"));
			info.setUserImgOriName((String) params.get("userImgOriName"));
			info.setUserImgSaveName((String) params.get("userImgSaveName"));
		}
		
	}//updateUserInfo end
	
	
	//회원 아이디 중복 확인
	public int userIdChk(String userId) {
		return userInfoDAO.userIdChk(userId);
	}//userGradeModifyList() end	
	
	
	//회원추가
	/*
	public void userInsert(Map<String, Object> params, List<String> userImgOriImgNameList, List<String> userImgFilePathList, List<String> userImgSaveNameList) {
		params.put("userPw", passwordEncoder.encode(params.get("userPw").toString()));
		userInfoDAO.userInsert(params);

	    for (int i = 0; i < userImgOriImgNameList.size(); i++) {
	        Map<String, Object> param = new HashMap<>();
	        String userImgOriImgName = userImgOriImgNameList.get(i);
	        String userImgFilePath = userImgFilePathList.get(i);
	        String userImgSaveName = userImgSaveNameList.get(i);

	        param.put("userId", params.get("userId"));
	        param.put("userImgFilePath", userImgFilePath);
	        param.put("userImgOriImgName", userImgOriImgName);
	        param.put("userImgSaveName", userImgSaveName);
	        userImageDAO.insertUserImage(param);
	    }
		
	}//userInsert() end
	*/
	
	public void userInsert(Map<String, Object> params, String userImgOriName, String userImgFilePath, String userImgSaveName) {
	    params.put("userPw", passwordEncoder.encode(params.get("userPw").toString()));
        params.put("userImgFilePath", userImgFilePath);
        params.put("userImgOriName", userImgOriName);
        params.put("userImgSaveName", userImgSaveName);

        userInfoDAO.userInsert(params);
	    
        /*
	    if(userImgOriImgName != null && userImgFilePath != null && userImgSaveName != null) {
	    
		    Map<String, Object> param = new HashMap<>();
		    param.put("userId", params.get("userId"));
	        param.put("userImgFilePath", userImgFilePath);
	        param.put("userImgOriImgName", userImgOriImgName);
	        param.put("userImgSaveName", userImgSaveName);
		    
		    userImageDAO.insertUserImage(param);
		    
	    }else{
		    userInfoDAO.userInsert(params);
	    }//if end
	    */
	    
	}//userInsert() end
	
	

	
	
	
	
}