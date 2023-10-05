package apeak.golf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import apeak.golf.model.dao.HoleInfoDAO;
import apeak.golf.model.dao.SensorInfoDAO;
import apeak.golf.model.dao.WorkReportBrandDefDAO;
import apeak.golf.model.dao.WorkReportDAO;
import apeak.golf.model.dto.HoleInfoDTO;

@Service
@Transactional
public class CourseService {
	
	@Autowired
	private HoleInfoDAO holeInfoDAO;
	
	@Autowired
	private WorkReportBrandDefDAO workReportBrandDefDAO;
	
	@Autowired
	private WorkReportDAO workReportDAO;
	
	//hole 이름 조회
	public List<EgovMap> holedata() {
		return holeInfoDAO.holedata();
	}
	
	//hole 모든정보 조회
	public List<EgovMap> holedata2() {
		return holeInfoDAO.holeinfo();
	}
	
	public List<EgovMap> workReportAllList() {
		
		return workReportDAO.workReportAllList();
	}
	
	public List<EgovMap> branddata(String worktype) {
		
		return workReportBrandDefDAO.branddata(worktype);
	}
	
	public void insertWork(String workstart, String workend, String hole, String course, String workclass, String worktype, String workbrand, String oriImgName, String comment, String filePath, String saveName) {
		System.out.println("service 성공");
		workReportDAO.insertWork(workstart, workend, hole, course, workclass, worktype, workbrand, oriImgName, comment, filePath, saveName);
	}//insertWork() end
	
	//검색 선택작업 조회하기
	public EgovMap searchWorkReportList(String searchHole, String searchCourseType, String searchClass, String searchType) {
		EgovMap paramMap = new EgovMap();
		paramMap.put("searchHole", searchHole);
		paramMap.put("searchCourseType", searchCourseType);
		paramMap.put("searchClass", searchClass);
		paramMap.put("searchType", searchType);
		
		List<EgovMap> list = workReportDAO.searchWorkReportList(paramMap);
		
		EgovMap resultMap = new EgovMap();
		resultMap.put("list", list);
		
		return resultMap;
	}
	
	//수정 할 작업 조회
	public List<EgovMap> workReportUpdateList(String workNo) {
		
		return workReportDAO.workReportUpdateList(workNo);
	}
	
	//작업 삭제
	public void workReportDelete(String workNo) {
		System.out.println("삭제번호"+workNo);
		workReportDAO.workReportDelete(workNo);
	}//insertWork() end
	
	
	
	
	
	
	
	
	
}