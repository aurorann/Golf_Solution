package apeak.golf.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apeak.golf.model.dto.SensorInfoDTO;
import apeak.golf.model.dto.WeatherDataDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class HomeDAO {

	@Autowired
	private SqlSession session;
	
	public void test() {
		List<SensorInfoDTO> list = session.selectList("userMapper.collectTest");
		

		//System.out.println(list.size());
		
		//System.out.println(list);
		
		//log.info("데이터 : ",list);
		
		for(SensorInfoDTO dto:list) {
			System.out.println(dto);
			
			List<WeatherDataDTO> aa = dto.getWeatherDataList();
									
			if(aa!=null) {
				System.out.println("데이터 : "+aa.size());
			}
			for(WeatherDataDTO weather:aa){
				System.out.println(weather);
			}
		}
	}
}