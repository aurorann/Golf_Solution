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
	public void userInfoModify(EgovMap paramMap){
		session.update("userMapper.userInfoModify", paramMap);
	}

	public UserInfoDTO selectUserById(String userId) {
		return session.selectOne("userMapper.selectUserById",userId);
	}

	public int getUserListCnt(Map<String, Object> paramMap) {
		return session.selectOne("userMapper.getUserListCnt",paramMap);
	}

	public List<UserInfoDTO> getUserList(Map<String, Object> paramMap) {
		return session.selectList("userMapper.getUserList",paramMap);
	}

	public void updateUserPw(EgovMap paramMap) {
		session.update("userMapper.updateUserPw",paramMap);
	}

	public void updateUserInfo(Map<String, Object> params){
		//session.update("userMapper.userGradeModify) {
		session.update("userMapper.updateUserInfo",params);
	}
	
	//회원아이디 중복 확인
	public int userIdChk(String userId){
		return session.selectOne("userMapper.userIdChk", userId);
	}
		
	//회원추가
	public void userInsert(Map<String, Object> params){
		//session.update("userMapper.userGradeModify", paramMap);
		session.insert("userMapper.userInsert", params);
		session.insert("userMapper.userRoleInsert", params);
		//session.selectOne("userMapper.userExist", paramMap);
	}
	

	public int userSearchListCnt(Map<String, Object> paramMap) {
		return session.selectOne("userMapper.userSearchListCnt",paramMap);
	}

	public List<UserInfoDTO> userSearchList(Map<String, Object> paramMap) {
		return session.selectList("userMapper.userSearchList",paramMap);
	}

	
	//작업자 정보 조회
	public List<EgovMap> getWorkerList(){
		return session.selectList("userMapper.workerList");
	}
	
	
	
}