package apeak.golf.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apeak.golf.model.dto.HoleInfoDTO;
import apeak.golf.model.dto.NdviDataDTO;
import apeak.golf.model.dto.SensorInfoDTO;
import apeak.golf.model.dto.RobotInfoDTO;

@Repository
public class NdviDataDAO {

	@Autowired
	private SqlSession session;


	public List<HoleInfoDTO> getNdviData(EgovMap paramMap){
		return session.selectList("dashboardMapper.ndviData", paramMap);
	}//getndvidata() end


	public List<EgovMap> getNdviDataList(Map<String, Object> param) {
		return session.selectList("allCourseMapper.getNdviDataList",param);
	}


	public NdviDataDTO getCurrentNdviData(Map<String, Object> param) {
		return session.selectOne("allCourseMapper.getCurrentNdviData",param);
	}


	public List<HoleInfoDTO> getNdviDataAllList(Map<String, Object> param) {
		return session.selectList("eachCourseMapper.getNdviDataAllList",param);
	}
	
//	public List<EgovMap> getNdviData(){
//		return session.selectList("eachCourseMapper.ndviData");
//	}//getndvidata() end

}