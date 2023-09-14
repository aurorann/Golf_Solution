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

@Service
@Transactional
public class EachCourseService {
	
	@Autowired
	private NdviDataDAO ndviDataDAO;
	
	@Autowired
	private HoleInfoDAO holeInfoDAO;
	
	@Autowired
	private SoilDataDAO soilDataDAO;
	
	public EgovMap ndviData(String category) {
		EgovMap paramMap = new EgovMap();
		paramMap.put("category", category);

		List<HoleInfoDTO> list1 = ndviDataDAO.getNdviData(paramMap);
		List<HoleInfoDTO> list2 = holeInfoDAO.getHoleInfo(paramMap);
		List<HoleInfoDTO> list3 = soilDataDAO.getSoilData(paramMap);
		
		EgovMap resultMap = new EgovMap();
		resultMap.put("list1", list1);
		resultMap.put("list2", list2);
		resultMap.put("list3", list3);
		
		return resultMap;
	}//ndviData() end
}
