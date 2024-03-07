package apeak.golf.model.dao;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;


import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apeak.golf.model.dto.WorkReportDTO;
import lombok.extern.slf4j.Slf4j;


@Repository
public class WorkReportDAO {

	@Autowired
	private SqlSession session;
	
	public void insertWorkReport(Map<String, Object> params) {	    
	    session.insert("managementCourseMapper.insertWorkReport", params);
	}//insertwork() end
	
	public void updateWorkReport(Map<String, Object> params) {
		session.update("managementCourseMapper.updateWorkReport", params);
	}
	
	
	public List<EgovMap> workReportAllList(){
		return session.selectList("managementCourseMapper.workReportAllList");
	}//workReportAllList() end
	
	public List<EgovMap> myWorkReportList(String userId){
		return session.selectList("managementCourseMapper.myWorkReportList", userId);
	}//workReportAllList() end
	
	
	public List<WorkReportDTO> searchWorkReportList(EgovMap paramMap){
		return session.selectList("managementCourseMapper.workReportAllList", paramMap);
	}//workReportAllList() end
	
	public List<WorkReportDTO> workReportUpdateList(String workNo){
		return session.selectList("managementCourseMapper.workReportUpdateList", workNo);
	}
	
	
	public void workReportDelete(String workNo) {
		session.delete("managementCourseMapper.deleteWorkReport", workNo);
	}
	
}