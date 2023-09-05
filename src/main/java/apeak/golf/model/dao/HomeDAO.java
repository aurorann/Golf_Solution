package apeak.golf.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apeak.golf.model.dto.UserInfoDTO;

@Repository
public class HomeDAO {

	@Autowired
	private SqlSession session;
	
	public void test() {
		List<UserInfoDTO> list = session.selectList("userMapper.test");
		
		System.out.println(list.size());
	}
}