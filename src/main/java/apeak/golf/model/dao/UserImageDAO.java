package apeak.golf.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserImageDAO {

	@Autowired
	private SqlSession session;

	public void insertUserImage(Map<String, Object> param) {
		session.insert("userMapper.insertUserImg", param);
	}

	
}