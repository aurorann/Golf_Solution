package apeak.golf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import apeak.golf.model.dao.HoleInfoDAO;
import apeak.golf.model.dao.WorkReportBrandDefDAO;
import apeak.golf.model.dao.WorkReportDAO;
import apeak.golf.model.dao.WorkReportImageDAO;

@Service
@Transactional
public class CourseService {

	@Autowired
	private HoleInfoDAO holeInfoDAO;

	@Autowired
	private WorkReportBrandDefDAO workReportBrandDefDAO;

	@Autowired
	private WorkReportDAO workReportDAO;

	@Autowired
	private WorkReportImageDAO workReportImageDAO;

	// hole 이름 조회
	public List<EgovMap> holedata() {
		return holeInfoDAO.holedata();
	}

	// hole 모든정보 조회
	public List<EgovMap> holedata2() {
		return holeInfoDAO.holeinfo();
	}

	public List<EgovMap> workReportAllList() {

		return workReportDAO.workReportAllList();
	}

	public List<EgovMap> getBrandData(String worktype) {

		return workReportBrandDefDAO.getBrandData(worktype);
	}

	public void insertWorkReport(String workStart, String workEnd, String hole, String course, String workClass,
			String workType, String workBrand, List<String> oriImgNameList, String comment, List<String> filePathList,
			List<String> saveNameList, String userId) {

		Map<String, Object> params = new HashMap<>();
		params.put("workStart", workStart);
		params.put("workEnd", workEnd);
		params.put("workClass", workClass);
		params.put("workType", workType);
		params.put("workBrand", workBrand);
		params.put("comment", comment);
		params.put("userId", userId);

		params.put("hole", hole);
		params.put("course", course);

		workReportDAO.insertWorkReport(params);

		for (int i = 0; i < oriImgNameList.size(); i++) {
			Map<String, Object> param = new HashMap<>();
			String oriImgName = oriImgNameList.get(i);
			String filePath = filePathList.get(i);
			String saveName = saveNameList.get(i);

			param.put("filePath", filePath);
			param.put("oriImgName", oriImgName);
			param.put("saveName", saveName);
			workReportImageDAO.insertWorkReportImg(param);
		}

	}// insertWork() end

	// 검색 선택작업 조회하기
	public EgovMap searchWorkReportList(String searchHole, String searchCourseType, String searchClass,
			String searchType) {
		try {
			EgovMap paramMap = new EgovMap();
			if (searchHole != null) {
				paramMap.put("searchHole", searchHole.replace(',', '|'));
			}
			if (searchCourseType != null) {
				paramMap.put("searchCourseType", searchCourseType.replace(',', '|'));
			}
			if (searchClass != null) {
				paramMap.put("searchClass", searchClass.replace(',', '|'));
			}
			if (searchType != null) {
				paramMap.put("searchType", searchType.replace(',', '|'));
			}

			List<EgovMap> list = workReportDAO.searchWorkReportList(paramMap);

			EgovMap resultMap = new EgovMap();
			resultMap.put("list", list);

			return resultMap;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 수정 할 작업 조회
	public List<EgovMap> workReportUpdateList(String workNo) {

		return workReportDAO.workReportUpdateList(workNo);
	}

	// 작업 삭제
	public void workReportDelete(String workNo) {
		workReportDAO.workReportDelete(workNo);
	}// insertWork() end

}