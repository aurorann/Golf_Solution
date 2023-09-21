package apeak.golf.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apeak.golf.model.dto.HoleInfoDTO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class HoleInfoDAO {

	@Autowired
	private SqlSession sess;
	
	public List<HoleInfoDTO> getHoleInfo(EgovMap paramMap){
		//System.out.println("오류지점 찾기3");
		try {
		sess.selectList("dashboardMapper.hole", paramMap);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sess.selectList("dashboardMapper.hole", paramMap);
	}
	
	//hole 모든 정보 조회
	public List<EgovMap> holeinfo(){
		return sess.selectList("dashboardMapper.test");
	}
	//hole name 조회
	public List<EgovMap> holedata(){
		return sess.selectList("courseMapper.holename");
	}
	
}