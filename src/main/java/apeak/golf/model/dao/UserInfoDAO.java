package apeak.golf.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apeak.golf.model.dto.UserInfoDTO;

@Repository
public class UserInfoDAO {

	@Autowired
	private SqlSession session;
	
	
	//user 모든 정보 조회
	public List<EgovMap> userList(){
		return session.selectList("userMapper.userList");
	}
	
	//회원등급 수정 조회
	public List<EgovMap> userGradeModifyList(int userNo){
		return session.selectList("userMapper.userGradeModifyList", userNo);
	}
	
	//회원등급 수정
	public int userGradeModify(String grade, int userNo){
		EgovMap paramMap = new EgovMap();
		paramMap.put("grade", grade);
		paramMap.put("userNo", userNo);
		return session.update("userMapper.userGradeModify", paramMap);
	}
	
	
}