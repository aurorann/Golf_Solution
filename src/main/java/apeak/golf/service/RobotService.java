package apeak.golf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import apeak.golf.model.dao.RobotInfoDAO;
import apeak.golf.model.dao.RobotLogDAO;
import apeak.golf.model.dto.RobotInfoDTO;
import apeak.golf.model.dto.RobotLogDTO;
import apeak.golf.util.PagingUtil;

@Service
@Transactional
public class RobotService {

	@Autowired
	private RobotInfoDAO robotInfoDAO;
	
	@Autowired
	private RobotLogDAO robotLogDAO;
	
	public List<EgovMap> getRobotInfo() {
		return robotInfoDAO.getRobotInfo();
	}
	
	//robot log 목록 가져오기
	public Map<String, Object> getLogList(Map<String, Object> paramMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		int curPage = Integer.parseInt((String) paramMap.get("curPage"));

		int listCnt = robotLogDAO.getLogListCnt(paramMap);

		PagingUtil pager = new PagingUtil(listCnt, curPage);
		pager.setPageSize(10);
		paramMap.put("startIndex", pager.getStartIndex());
		paramMap.put("pageSize", pager.getPageSize());
		
		List<RobotInfoDTO> list = robotLogDAO.getLogList(paramMap);

		resultMap.put("listCnt", listCnt);
		resultMap.put("list", list);
		resultMap.put("pager", pager);
		
		return resultMap;
	}
	
	//검색 robot log 목록 가져오기
	public Map<String, Object> logSearchList(Map<String, Object> paramMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int curPage = Integer.parseInt((String) paramMap.get("curPage"));
		
		int listCnt = robotLogDAO.logSearchListCnt(paramMap);
		
		PagingUtil pager = new PagingUtil(listCnt, curPage);
		pager.setPageSize(10);
		paramMap.put("startIndex", pager.getStartIndex());
		paramMap.put("pageSize", pager.getPageSize());
		
		List<RobotLogDTO> list = robotLogDAO.logSearchList(paramMap);
		
		resultMap.put("listCnt", listCnt);
		resultMap.put("list", list);
		resultMap.put("pager", pager);
		
		return resultMap;
	}

}