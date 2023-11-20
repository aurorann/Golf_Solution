package apeak.golf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import apeak.golf.model.dao.HoleInfoDAO;
import apeak.golf.model.dao.NdviDataDAO;
import apeak.golf.model.dao.SoilDataDAO;
import apeak.golf.model.dao.WeatherDataDAO;
import apeak.golf.model.dto.HoleInfoDTO;

@Service
@Transactional
public class EachCourseService {
	
	@Autowired
	private NdviDataDAO ndviDataDAO;
	
	@Autowired
	private HoleInfoDAO holeInfoDAO;
	
	@Autowired
	private SoilDataDAO soilDataDAO;
	
	@Autowired
	private WeatherDataDAO weatherDataDAO;
	
	public EgovMap courseSeparatecourseAjax(String category, String listsort) {
		EgovMap paramMap = new EgovMap();
		paramMap.put("category", category);
		paramMap.put("listsort", listsort);

		List<HoleInfoDTO> list1 = ndviDataDAO.getNdviData(paramMap);
		List<HoleInfoDTO> list2 = holeInfoDAO.getHoleInfo(paramMap);
		List<HoleInfoDTO> list3 = soilDataDAO.getSoilData(paramMap);
		
		EgovMap resultMap = new EgovMap();
		resultMap.put("list1", list1);
		resultMap.put("list2", list2);
		resultMap.put("list3", list3);
		
		return resultMap;
	}//ndviData() end
	
	public EgovMap getChartDataList(String category, String listsort) {
		Map<String,Object> param = new HashMap<>();
		param.put("category", category);
		param.put("listsort", listsort);
		EgovMap resultMap = new EgovMap();
		List<HoleInfoDTO> ndviDataList = ndviDataDAO.getNdviDataAllList(param);
		List<HoleInfoDTO> soilDataList =soilDataDAO.getSoilDataAllList(param);
		List<HoleInfoDTO> weatherDataList =weatherDataDAO.getWeatherDataAllList(param);
		
		resultMap.put("ndviDataList",ndviDataList);
		resultMap.put("soilDataList",soilDataList);
		resultMap.put("weatherDataList",weatherDataList);
		
		return resultMap;
	}
}
