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
	
	public List<EgovMap> holedata() {
	
		return holeInfoDAO.holedata();
	}
	
	public List<EgovMap> branddata(String worktype) {
		
		return workReportBrandDefDAO.branddata(worktype);
	}
	
	public void insertWork(String workstart, String workend, String hole, String course, String workclass, String worktype, String oriImgName, String comment) {
		System.out.println("service 성공");
		workReportDAO.insertWork(workstart, workend, hole, course, workclass, worktype, oriImgName, comment);
	}//insertWork() end
	
	
	
}