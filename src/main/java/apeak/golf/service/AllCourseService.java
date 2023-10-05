package apeak.golf.service;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import apeak.golf.model.dao.HoleInfoDAO;
import apeak.golf.model.dao.LayerDataDAO;
import apeak.golf.model.dao.NdviDataDAO;
import apeak.golf.model.dao.SoilDataDAO;
import apeak.golf.model.dao.WeatherDataDAO;
import apeak.golf.model.dto.HoleInfoDTO;
import apeak.golf.model.dto.NdviDataDTO;
import apeak.golf.model.dto.SoilDataDTO;
import apeak.golf.model.dto.WeatherDataDTO;

@Service
@Transactional
public class AllCourseService {
	
	@Autowired
	private WeatherDataDAO weatherDataDAO;
	
	@Autowired
	private NdviDataDAO ndviDataDAO;
	
	@Autowired
	private SoilDataDAO soilDataDAO;
	
	@Autowired
	private HoleInfoDAO holeInfoDAO;
	
	@Autowired
	private LayerDataDAO layerDataDAO;

	public EgovMap getCurrentData(Map<String, Object> param) {

		EgovMap resultMap = new EgovMap();
		
		NdviDataDTO ndvi = ndviDataDAO.getCurrentNdviData(param);

		WeatherDataDTO weather = weatherDataDAO.getCurrentWeatherData(param);

		SoilDataDTO soil = soilDataDAO.getCurrentSoilData(param);
		
		resultMap.put("ndvi", ndvi);
		resultMap.put("weather", weather);
		resultMap.put("soil", soil);

		return resultMap;
	}

	public List<EgovMap> getChartData(Map<String, Object> param) {
		String type = String.valueOf(param.get("type"));
		
		if(type.equals("ndvi")) {
			return ndviDataDAO.getNdviDataList(param);
		}else if(type.equals("weather")) {
			return weatherDataDAO.getWeatherDataList(param);
		}else if(type.equals("soil")) {
			return soilDataDAO.getSoilDataList(param);
		}else {
			return soilDataDAO.getSoilDataList(param);
		}
		
	}

	public HoleInfoDTO getHoleInfoOne(Map<String, Object> param) {
		return holeInfoDAO.getHoleInfoOne(param);
	}

	public List<EgovMap> getLayerData(Map<String, Object> param) {
		return layerDataDAO.getLayerData(param);
	}

	public EgovMap getAllData(Map<String, Object> param) {
		
		EgovMap resultMap = new EgovMap();
		
		List<HoleInfoDTO> layerDataList = layerDataDAO.getLayerDataAllList(param);
		List<HoleInfoDTO> soilDataList = soilDataDAO.getSoilDataAllList(param);
		List<HoleInfoDTO> weatherDataList = weatherDataDAO.getWeatherDataAllList(param);
		List<HoleInfoDTO> ndviDataList = ndviDataDAO.getNdviDataAllList(param);
		
		resultMap.put("layerDataList", layerDataList);
		resultMap.put("soilDataList", soilDataList);
		resultMap.put("weatherDataList", weatherDataList);
		resultMap.put("ndviDataList", ndviDataList);
		
		return resultMap;
	}
}
