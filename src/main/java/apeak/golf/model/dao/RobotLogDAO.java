package apeak.golf.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apeak.golf.model.dto.RobotInfoDTO;
import apeak.golf.model.dto.RobotLogDTO;

@Repository
public class RobotLogDAO {

	@Autowired
	private SqlSession session;
	

	public int getLogListCnt(Map<String, Object> paramMap) {
		return session.selectOne("robotMapper.getLogListCnt",paramMap);
	}
	
	public int logSearchListCnt(Map<String, Object> paramMap) {
		return session.selectOne("robotMapper.logSearchListCnt",paramMap);
	}
	
	public List<RobotInfoDTO> getLogList(Map<String, Object> paramMap) {
		return session.selectList("robotMapper.getLogList",paramMap);
	}
	
	public List<RobotLogDTO> logSearchList(Map<String, Object> paramMap) {
		return session.selectList("robotMapper.logSearchList",paramMap);
	}
	
	public List<EgovMap> getLogList() {
		return session.selectList("robotMapper.getLogList2");
	}
	
}