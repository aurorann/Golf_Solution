package apeak.golf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
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
	
	public EgovMap getdata(String hole, String category) {
		EgovMap paramMap = new EgovMap();
		paramMap.put("hole", hole);
		paramMap.put("category", category);
		
		List<HoleInfoDTO> list1 = sensorinfodao.getweatherdata(paramMap);
		List<HoleInfoDTO> list2 = sensorinfodao.getndvidata(paramMap);
		List<HoleInfoDTO> list3 = sensorinfodao.getsoildata(paramMap);

		EgovMap resultMap = new EgovMap();
		resultMap.put("list1", list1);
		resultMap.put("list2", list2);
		resultMap.put("list3", list3);
		
		return resultMap;
	}
	
	
	
}