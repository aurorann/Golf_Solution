package apeak.golf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import java.util.List;



import apeak.golf.model.dao.UserInfoDAO;

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
}