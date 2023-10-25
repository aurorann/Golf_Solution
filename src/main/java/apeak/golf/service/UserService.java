package apeak.golf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//회원 조회
	public List<EgovMap> userList() {
		return userInfoDAO.userList();
	}//userList() end
	
	//회원등급 수정 조회
	public List<EgovMap> userGradeModifyList(int userNo) {
		return userInfoDAO.userGradeModifyList(userNo);
	}//userGradeModifyList() end
	
	//회원등급 수정
	public int userGradeModify(String grade, int userNo) {
		return userInfoDAO.userGradeModify(grade, userNo);
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

	public boolean userCheckPw(String password) {
		UserInfoDTO userInfo = (UserInfoDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		UserInfoDTO user = userInfoDAO.selectUserById(userInfo.getUserId());
		
		return passwordEncoder.matches(password,user.getUserPw());
	}

	public void updateUserPw(EgovMap paramMap) {
		paramMap.put("userPw", passwordEncoder.encode(paramMap.get("userPw").toString()));
		userInfoDAO.updateUserPw(paramMap);
	}

	public void updateUserInfo(UserInfoDTO userInfo) {
		UserInfoDTO info = (UserInfoDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		userInfo.setUserId(info.getUserId());
		userInfoDAO.updateUserInfo(userInfo);
		
		info.setEmail(userInfo.getEmail());
		info.setHp(userInfo.getHp());
	}
}