package apeak.golf.service;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import apeak.golf.model.dao.RoBotInfoDAO;

@Service
@Transactional
public class RobotService {

	@Autowired
	private RoBotInfoDAO robotInfoDAO;
	
	public List<EgovMap> getRobotInfo() {
		return robotInfoDAO.getRobotInfo();
	}

}