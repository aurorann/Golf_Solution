package apeak.golf.service;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import apeak.golf.model.dao.HoleInfoDAO;
import apeak.golf.model.dto.HoleInfoDTO;

@Service
@Transactional
public class DashboardService {

	@Autowired
	private HoleInfoDAO holeInfoDAO;
	
	/*
	public void holeinfo() {
		holeInfoDAO.holeinfo();
	}//holeinfo() end
	*/
	
	public EgovMap data(String category) {
		
		System.out.println("오류지점 찾기2"+category);
		
		EgovMap paramMap = new EgovMap();
		paramMap.put("category", category);
		
		List<HoleInfoDTO> list1 = holeInfoDAO.getHoleInfo(paramMap);
		
		EgovMap resultMap = new EgovMap();
		resultMap.put("list1", list1);
		
		return resultMap;
	}//data() end
	
}
