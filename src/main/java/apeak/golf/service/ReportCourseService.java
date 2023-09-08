package apeak.golf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import apeak.golf.model.dao.SensorInfoDAO;
import apeak.golf.model.dto.HoleInfoDTO;
import apeak.golf.model.dto.RobotInfoDTO;

@Service
@Transactional
public class ReportCourseService {
	
	
	@Autowired
	private SensorInfoDAO dao;
	
	public List<HoleInfoDTO> test() {
		return dao.test();
	}
	
	public List<HoleInfoDTO> getdata(String value) {
		return dao.getdata(value);
	}
}