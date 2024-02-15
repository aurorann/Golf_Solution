package apeak.golf.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
import apeak.golf.model.dao.WorkNotificationDAO;
import apeak.golf.model.dto.HoleInfoDTO;
import apeak.golf.model.dto.NdviDataDTO;
import apeak.golf.model.dto.RobotInfoDTO;
import apeak.golf.model.dto.SensorInfoDTO;
import apeak.golf.model.dto.SoilDataDTO;
import apeak.golf.model.dto.UserInfoDTO;
import apeak.golf.model.dto.WeatherDataDTO;
import apeak.golf.model.dto.WorkNotificationDTO;
import apeak.golf.util.PagingUtil;

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
	
	@Autowired
	private WorkNotificationDAO workNotificationDAO;
	
	
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
	
	
	public List<Map<String, Object>> mobileData(String category, String listsort) {
		
		try {
			if(category != null) {

				EgovMap paramMap = new EgovMap();
				paramMap.put("category", category);
				
				if(listsort == "" || listsort == null) {
					listsort = "ASC";
				}

				paramMap.put("listsort", listsort);
				
				List<HoleInfoDTO> list2 = weatherDataDAO.getWeatherData(paramMap);
				List<HoleInfoDTO> list3 = soilDataDAO.getSoilData(paramMap);
				List<HoleInfoDTO> list4 = ndviDataDAO.getNdviData(paramMap);
				
				//System.out.println("list2");
				//System.out.println(list2);
				
				Map<String, Map<String, Object>> dataMap = new LinkedHashMap<>();
				
				for(HoleInfoDTO dto : list2) {
					Map<String, Object> map = new LinkedHashMap<>();
					map.put("HoleNo", dto.getHoleNo());
					for(SensorInfoDTO sensorInfo : dto.getSensorInfoList()) {
						for(WeatherDataDTO weatherData : sensorInfo.getWeatherDataList()) {
							map.put("TEMP", weatherData.getTemp());
							map.put("WD", weatherData.getWs());
							map.put("SOLAR", weatherData.getSolar());
						}//for end
					}//for end
					dataMap.put(dto.getHoleNo(), map);
				}//for end
				
				for(HoleInfoDTO dto : list3) {
					Map<String, Object> map = dataMap.get(dto.getHoleNo());
					if(map == null) {
						map = new HashMap<>();
						map.put("HoleNo", dto.getHoleNo());
						dataMap.put(dto.getHoleNo(), map);
					}//if end
					for(SensorInfoDTO sensorInfo : dto.getSensorInfoList()) {
						for(NdviDataDTO ndviData : sensorInfo.getNdviDataList()) {
							map.put("NDVI", ndviData.getNdvi());
						}//for end
					}//for end
				}//for end
				
				for(HoleInfoDTO dto : list4) {
					Map<String, Object> map = dataMap.get(dto.getHoleNo());
					if(map == null) {
						map = new HashMap<>();
						map.put("HoleNo", dto.getHoleNo());
						dataMap.put(dto.getHoleNo(), map);
					}//if end
					for(RobotInfoDTO robotInfo : dto.getRobotInfoList()) {
						for(SoilDataDTO soilData : robotInfo.getSoilDataList()) {
							map.put("SMO", soilData.getSmo());
							map.put("STP", soilData.getStp());
						}//for end
					}//for end
				}//for end
				
				List<Map<String, Object>> list = new ArrayList<>(dataMap.values());
				
				//System.out.println("list에 넣기");
				//System.out.println(list);
				
				return list;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}//data() end


	public Map<String, Object> getNotiList(Map<String, Object> paramMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		int curPage = Integer.parseInt((String) paramMap.get("curPage"));

		int listCnt = workNotificationDAO.getNotiListCnt(paramMap);

		PagingUtil pager = new PagingUtil(listCnt, curPage);
		pager.setPageSize(10);
		paramMap.put("startIndex", pager.getStartIndex());
		paramMap.put("pageSize", pager.getPageSize());
		
		List<WorkNotificationDTO> list = workNotificationDAO.getNotiList(paramMap);

		resultMap.put("listCnt", listCnt);
		resultMap.put("list", list);
		resultMap.put("pager", pager);
		
		return resultMap;
	}
	

}
