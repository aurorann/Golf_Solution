package apeak.golf.model.dao;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apeak.golf.model.dto.UserInfoDTO;

@Repository
public class WorkReportDAO {

	@Autowired
	private SqlSession session;
	
	public void insertWork(String writeat, String workstart, String workend) {
		System.out.println("DAO 성공");
	    Map<String, Object> params = new HashMap<>();
	    params.put("writeat", writeat);
	    params.put("workstart", workstart);
	    params.put("workend", workend);
	    
	    session.insert("courseMapper.insertwork", params);
	}//insertwork() end
	
}