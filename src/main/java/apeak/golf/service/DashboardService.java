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
import apeak.golf.model.dao.WorkNotificationDAO;
import apeak.golf.model.dto.HoleInfoDTO;
import apeak.golf.model.dto.SensorInfoDTO;
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
