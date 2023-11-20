package apeak.golf.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apeak.golf.model.dto.WorkNotificationDTO;

@Repository
public class WorkNotificationDAO {

	@Autowired
	private SqlSession session;

	public int getNotiListCnt(Map<String, Object> paramMap) {
		return session.selectOne("dashboardMapper.getNotiListCnt",paramMap);
	}

	public List<WorkNotificationDTO> getNotiList(Map<String, Object> paramMap) {
		return session.selectList("dashboardMapper.getNotiList",paramMap);
	}
	
}