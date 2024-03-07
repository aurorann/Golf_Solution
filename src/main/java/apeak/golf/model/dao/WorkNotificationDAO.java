package apeak.golf.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apeak.golf.model.dto.WorkNotificationDTO;
import apeak.golf.model.dto.WorkReportDTO;

@Repository
public class WorkNotificationDAO {

	@Autowired
	private SqlSession session;

	public int getNotiListCnt(Map<String, Object> paramMap) {
		return session.selectOne("dashboardMapper.getNotiListCnt",paramMap);
	}
	
	public int getSearchNotiListCnt(Map<String, Object> paramMap) {
		return session.selectOne("dashboardMapper.getSearchNotiListCnt",paramMap);
	}

	public List<WorkNotificationDTO> getSearchNotiList(Map<String, Object> paramMap) {
		return session.selectList("dashboardMapper.getSearchNotiList",paramMap);
	}
	
	public List<WorkNotificationDTO> getNotiList(Map<String, Object> paramMap) {
		return session.selectList("dashboardMapper.getNotiList",paramMap);
	}
	
	public void insertNotiWork(Map<String, Object> params) {	    
	    session.insert("dashboardMapper.insertNotiWork", params);
	}//insertWorkReport() end
	
	public void updateNotiWork(Map<String, Object> params) {	    
		session.update("dashboardMapper.updateNotiWork", params);
	}//updateWorkReport() end
	
	public List<WorkNotificationDTO> selectNotiWorkData(int notiNo){
		return session.selectList("dashboardMapper.selectNotiWorkData", notiNo);
	}
	
	public List<WorkNotificationDTO> getHeaderNoti(Map<String, Object> params) {	    
		return session.selectList("dashboardMapper.getHeaderNoti", params);
	}
	
	public void updateNotiState(Map<String, Object> params) {	    
		session.update("dashboardMapper.updateNotiState", params);
	}//updateNotiState() end
	
	public void deleteNoti(int notiNo) {
		session.delete("dashboardMapper.deleteNoti", notiNo);
	}//updateWorkReport() end
	
}