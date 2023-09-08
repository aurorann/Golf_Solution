package apeak.golf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import apeak.golf.model.dao.SensorInfoDAO;
import apeak.golf.model.dto.HoleInfoDTO;

@Service
@Transactional
public class ReportCourseService {
	
	
	@Autowired
	private SensorInfoDAO sensorinfodao;
	
//	public List<HoleInfoDTO> test() {
//		return sensorinfodao.test();
//	}
	
	public Map<String, Object> getdata(String hole, String category) {
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		List<HoleInfoDTO> list1 = sensorinfodao.getweatherdata(hole, category);
		List<HoleInfoDTO> list2 = sensorinfodao.getndvidata(hole, category);
		List<HoleInfoDTO> list3 = sensorinfodao.getsoildata(hole, category);
		List<HoleInfoDTO> list4 = sensorinfodao.getndvirobotdata(hole, category);
		
		resultMap.put("list1", list1);
		resultMap.put("list2", list2);
		resultMap.put("list3", list3);
		resultMap.put("list4", list4);
				
		return resultMap;
	}
}