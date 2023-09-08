package apeak.golf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import apeak.golf.model.dao.SensorInfoDAO;
import apeak.golf.model.dto.HoleInfoDTO;
import apeak.golf.model.dto.RobotInfoDTO;
import apeak.golf.model.dto.SensorInfoDTO;

@Service
@Transactional
public class ReportCourseService {
	
	
	@Autowired
	private SensorInfoDAO sensorinfodao;
	
	public List<HoleInfoDTO> test() {
		return sensorinfodao.test();
	}
	
	public List<HoleInfoDTO> getdata(String hole, String category) {
		return sensorinfodao.getdata(hole, category);
	}
}