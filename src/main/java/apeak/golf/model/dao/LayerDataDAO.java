package apeak.golf.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class LayerDataDAO {

	@Autowired
	private SqlSession session;

	public List<EgovMap> getLayerData(Map<String, Object> param) {
		return session.selectList("allCourseMapper.getLayerData",param);
	}	
	
}
