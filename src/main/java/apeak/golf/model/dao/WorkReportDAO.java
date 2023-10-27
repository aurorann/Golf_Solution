package apeak.golf.model.dao;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;


import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import lombok.extern.slf4j.Slf4j;


@Repository
public class WorkReportDAO {

	@Autowired
	private SqlSession session;
	
	public void insertWorkReport(Map<String, Object> params) {	    
	    session.insert("managementCourseMapper.insertWorkReport", params);
	}//insertwork() end
	
	
	public List<EgovMap> workReportAllList(){
		return session.selectList("managementCourseMapper.workReportAllList");
	}//workReportAllList() end
	
	
	public List<EgovMap> searchWorkReportList(EgovMap paramMap){
		return session.selectList("managementCourseMapper.workReportAllList", paramMap);
	}//workReportAllList() end
	
	public List<EgovMap> workReportUpdateList(String workNo){
		return session.selectList("managementCourseMapper.workReportUpdateList", workNo);
	}
	
	
	public void workReportDelete(String workNo) {
		System.out.println("DAO 삭제번호"+workNo);
		session.delete("managementCourseMapper.deleteWorkReportImage", workNo);
		//session.delete("managementCourseMapper.deleteWorkReportTarget", workNo);
		session.delete("managementCourseMapper.deleteWorkReport", workNo);
	}
	
}














