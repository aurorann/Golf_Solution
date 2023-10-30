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

	public void insertWorkReport(Map<String, Object> params, List<String> oriImgNameList, List<String> filePathList,
			List<String> saveNameList) {

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
	
	public void updateWorkReport(Map<String, Object> params, List<String> oriImgNameList, List<String> filePathList,
			List<String> saveNameList) {

		//일정표 변경
		workReportDAO.updateWorkReport(params);
		
		//삭제 대상 이미지 설정 및 삭제
		EgovMap removeMap = new EgovMap();
		removeMap.put("removeImgList", params.get("removeImgList").toString().split(","));
		workReportImageDAO.deleteWorkReportImage(removeMap);

		//새로 추가된 이미지 설정 및 추가
		for (int i = 0; i < oriImgNameList.size(); i++) {
			Map<String, Object> param = new HashMap<>();
			String oriImgName = oriImgNameList.get(i);
			String filePath = filePathList.get(i);
			String saveName = saveNameList.get(i);

			param.put("workNo", params.get("workNo"));
			param.put("filePath", filePath);
			param.put("oriImgName", oriImgName);
			param.put("saveName", saveName);
			workReportImageDAO.insertWorkReportImg(param);
		}

	}// insertWork() end

	// 검색 선택작업 조회하기
	public EgovMap searchWorkReportList(String searchHole, String searchCourseType, String searchClass,
			String searchType, String searchDate) {
		try {
			EgovMap param = new EgovMap();
			if (searchHole != null) {
				param.put("searchHole", searchHole.replace(',', '|'));
			}
			if (searchCourseType != null) {
				param.put("searchCourseType", searchCourseType.replace(',', '|'));
			}
			if (searchClass != null) {
				param.put("searchClass", searchClass.replace(',', '|'));
			}
			if (searchType != null) {
				param.put("searchType", searchType.replace(',', '|'));
			}
			
			String[] date = searchDate.split("~");

			if(date.length==2) {
				param.put("startDate", date[0].trim()+" 00:00:00");
				param.put("endDate", date[1].trim()+" 23:59:59");
			}

			List<EgovMap> list = workReportDAO.searchWorkReportList(param);

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
		EgovMap param = new EgovMap();
		param.put("workNo", workNo);
		workReportImageDAO.deleteWorkReportImage(param);
		workReportDAO.workReportDelete(workNo);
	}

}