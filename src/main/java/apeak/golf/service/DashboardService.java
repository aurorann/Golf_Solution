package apeak.golf.service;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import apeak.golf.model.dao.HoleInfoDAO;
import apeak.golf.model.dao.NdviDataDAO;
import apeak.golf.model.dao.SoilDataDAO;
import apeak.golf.model.dao.WeatherDataDAO;
import apeak.golf.model.dto.HoleInfoDTO;
import apeak.golf.model.dto.SensorInfoDTO;
import apeak.golf.model.dto.WeatherDataDTO;

@Service
@Transactional
public class DashboardService {

	@Autowired
	private HoleInfoDAO holeInfoDAO;
	
	@Autowired
	private WeatherDataDAO weatherDataDAO;
	
	@Autowired
	private SoilDataDAO soilDataDAO;
	
	@Autowired
	private NdviDataDAO ndviDataDAO;
	
	
	public void holeinfo() {
		holeInfoDAO.holeinfo();
	}//holeinfo() end
	
	
	public EgovMap data(String category, String listsort) {
		
		System.out.println("오류지점 찾기2"+category);
		
		EgovMap paramMap = new EgovMap();
		paramMap.put("category", category);
		paramMap.put("listsort", listsort);
		
		List<HoleInfoDTO> list1 = holeInfoDAO.getHoleInfo(paramMap);
		List<HoleInfoDTO> list2 = weatherDataDAO.getWeatherData(paramMap);
		List<HoleInfoDTO> list3 = soilDataDAO.getSoilData(paramMap);
		List<HoleInfoDTO> list4 = ndviDataDAO.getNdviData(paramMap);
		
		EgovMap resultMap = new EgovMap();
		resultMap.put("list1", list1);
		resultMap.put("list2", list2);
		resultMap.put("list3", list3);
		resultMap.put("list4", list4);
		
		return resultMap;
	}//data() end
	
}
