package apeak.golf.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apeak.golf.model.dto.HoleInfoDTO;
import apeak.golf.model.dto.SensorInfoDTO;
import apeak.golf.model.dto.RobotInfoDTO;

@Repository
public class WeatherDataDAO {

	@Autowired
	private SqlSession session;
	
	
	public List<HoleInfoDTO> getweatherdata(EgovMap paramMap){
		return session.selectList("dashboardMapper.weatherData", paramMap);
	}//getweatherdata() end
	
	
}