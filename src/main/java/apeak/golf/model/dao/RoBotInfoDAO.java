package apeak.golf.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apeak.golf.model.dto.UserInfoDTO;

@Repository
public class RoBotInfoDAO {

	@Autowired
	private SqlSession session;

	public List<EgovMap> getRobotInfo() {
		return session.selectList("robotMapper.getRobotInfo");
	}
	
}