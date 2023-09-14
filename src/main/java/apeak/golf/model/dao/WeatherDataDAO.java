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
import apeak.golf.model.dto.WeatherDataDTO;

@Repository
public class WeatherDataDAO {

	@Autowired
	private SqlSession session;
	
	
	public List<HoleInfoDTO> getWeatherData(EgovMap paramMap){
		System.out.println("오류지점 찾기3");
		try {
			session.selectList("dashboardMapper.weather", paramMap);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return session.selectList("dashboardMapper.weather", paramMap);
	}
	
}