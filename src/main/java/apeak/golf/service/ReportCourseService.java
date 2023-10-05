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
import apeak.golf.model.dao.SensorInfoDAO;
import apeak.golf.model.dao.SoilDataDAO;
import apeak.golf.model.dao.WeatherDataDAO;
import apeak.golf.model.dto.HoleInfoDTO;

@Service
@Transactional
public class ReportCourseService {
	
	
	@Autowired
	private SensorInfoDAO sensorinfodao;
	
	@Autowired
	private WeatherDataDAO weatherDataDAO;
	
	@Autowired
	private SoilDataDAO soilDataDAO;
	
	@Autowired
	private NdviDataDAO ndviDataDAO;
	
	@Autowired
	private HoleInfoDAO holeInfoDAO;
	
//	public List<HoleInfoDTO> test() {
//		return sensorinfodao.test();
//	}
	
	public EgovMap getdata(String hole, String category, String selectDate, String beforeDate) {
		EgovMap paramMap = new EgovMap();
		paramMap.put("hole", hole);
		paramMap.put("category", category);
		paramMap.put("selectDate", selectDate);
		paramMap.put("beforeDate", beforeDate);
		
		List<HoleInfoDTO> list1 = sensorinfodao.getweatherdata(paramMap);
		List<HoleInfoDTO> list2 = sensorinfodao.getndvidata(paramMap);
		List<HoleInfoDTO> list3 = sensorinfodao.getsoildata(paramMap);
		List<HoleInfoDTO> list4 = holeInfoDAO.getholedata(paramMap);
		

		EgovMap resultMap = new EgovMap();
		resultMap.put("list1", list1);
		resultMap.put("list2", list2);
		resultMap.put("list3", list3);
		resultMap.put("list4", list4);
		
		return resultMap;
	}
	
	//데이터 검색
	public EgovMap getsearchdata(String holeNo, String workStart, String workEnd) {
		EgovMap paramMap = new EgovMap();
		paramMap.put("holeNo", holeNo);
		paramMap.put("workStart", workStart);
		paramMap.put("workEnd", workEnd);
		
		List<HoleInfoDTO> list1 = weatherDataDAO.getSearchWeatherData(paramMap);
		List<HoleInfoDTO> list2 = soilDataDAO.getSearchSoilData(paramMap);

		EgovMap resultMap = new EgovMap();
		resultMap.put("list1", list1);
		resultMap.put("list2", list2);
		
		return resultMap;
	}
	
	//모든 홀 데이터 날짜로 검색
	public EgovMap getsearchalldata(String workStart, String workEnd) {
		EgovMap paramMap = new EgovMap();
		paramMap.put("workStart", workStart);
		paramMap.put("workEnd", workEnd);
		
		List<HoleInfoDTO> list1 = weatherDataDAO.getSearchAllWeatherData(paramMap);
		List<HoleInfoDTO> list2 = soilDataDAO.getSearchAllSoilData(paramMap);
		
		EgovMap resultMap = new EgovMap();
		resultMap.put("list1", list1);
		resultMap.put("list2", list2);
		
		return resultMap;
	}
	
}