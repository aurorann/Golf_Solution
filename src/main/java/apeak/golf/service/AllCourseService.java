package apeak.golf.service;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import apeak.golf.model.dao.HomeDAO;

@Service
@Transactional
public class AllCourseService {

	@Autowired
	private HomeDAO homeDAO;
	
	public List<EgovMap> test() {
		return homeDAO.test();
	}
}
