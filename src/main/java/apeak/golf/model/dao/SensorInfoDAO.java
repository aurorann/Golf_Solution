package apeak.golf.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apeak.golf.model.dto.HoleInfoDTO;
import apeak.golf.model.dto.SensorInfoDTO;
import apeak.golf.model.dto.RobotInfoDTO;

@Repository
public class SensorInfoDAO {

	@Autowired
	private SqlSession session;
	
	public List<HoleInfoDTO> test() {
		List<HoleInfoDTO> list = session.selectList("reportCourseMapper.holeSensorList");

		
		for(HoleInfoDTO dto:list) {
			System.out.println(dto);
			
			List<SensorInfoDTO> aa = dto.getSensorInfoList();
									
			if(aa!=null) {
				System.out.println("센서 : "+aa.size());
			}
			
			for(SensorInfoDTO sensor:aa){
				System.out.println(sensor);
			}
			
			List<RobotInfoDTO> robotinfo = dto.getRobotInfoList();
			
			if(robotinfo!=null) {
				System.out.println("로봇 : "+robotinfo.size());
			}

			for(RobotInfoDTO robot:robotinfo){
				System.out.println(robotinfo);
			}
		}
		
		return list;
	}//test end
	
	public List<HoleInfoDTO> getdata(String hole, String category){
        Map<String, Object> params = new HashMap<>();
        params.put("hole", hole);
        params.put("category", category);
		return session.selectList("reportCourseMapper.SensorData", params);
	}//getdata() end
}