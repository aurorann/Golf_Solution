package apeak.golf.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apeak.golf.model.dto.UserAuthDTO;
import apeak.golf.model.dto.UserInfoDTO;

@Repository
public class UserAuthDAO {

	@Autowired
	private SqlSession session;

	public List<UserAuthDTO> selectAuthorityByUserId(String userId) {
		return session.selectList("userMapper.selectAuthorityByUserId",userId);
	}
	
}