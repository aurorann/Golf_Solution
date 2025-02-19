package apeak.golf.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apeak.golf.model.dto.HoleInfoDTO;
import apeak.golf.model.dto.SoilDataDTO;

@Repository
public class SoilDataDAO {

	@Autowired
	private SqlSession session;
	

	public List<HoleInfoDTO> getSoilData(EgovMap paramMap){
		return session.selectList("dashboardMapper.soilData", paramMap);
	}//getsoildata() end
	
	public List<HoleInfoDTO> getSearchSoilData(EgovMap paramMap){
		return session.selectList("reportCourseMapper.searchSoilData", paramMap);
	}
	
	public List<HoleInfoDTO> getSearchAllSoilData(EgovMap paramMap){
		return session.selectList("reportCourseMapper.searchAllSoilData", paramMap);
	}

	public List<EgovMap> getSoilDataList(Map<String, Object> param) {
		return session.selectList("allCourseMapper.getSoilDataList",param);
	}

	public SoilDataDTO getCurrentSoilData(Map<String, Object> param) {
		return session.selectOne("allCourseMapper.getCurrentSoilData",param);
	}

	public List<HoleInfoDTO> getSoilDataAllList(Map<String, Object> param) {
		return session.selectList("eachCourseMapper.getSoilDataAllList", param);
	}
	
}