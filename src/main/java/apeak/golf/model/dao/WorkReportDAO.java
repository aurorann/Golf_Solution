package apeak.golf.model.dao;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;


import org.apache.ibatis.session.SqlSession;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import lombok.extern.slf4j.Slf4j;


@Repository
public class WorkReportDAO {

	@Autowired
	private SqlSession session;
	
	public void insertWork(String workstart, String workend, String hole, String course, String workclass, String worktype, String workbrand, String oriImgName, String comment) {
		try {
			System.out.println("DAO 성공");
			
		    Map<String, Object> params1 = new HashMap<>();
		    params1.put("workstart", workstart);
		    params1.put("workend", workend);
		    params1.put("workclass", workclass);
		    params1.put("worktype", worktype);
		    params1.put("workbrand", workbrand);
		    params1.put("comment", comment);
		    
		    session.insert("managementCourseMapper.insertworkreport", params1);
		    
		    Map<String, Object> params2 = new HashMap<>();
		    params2.put("hole", hole);
		    params2.put("course", course);
		    
		    session.insert("managementCourseMapper.insertworkreporttarget", params2);
		    
		    Map<String, Object> params3 = new HashMap<>();
		    
		    //이미지 파일명만 자르기
		    oriImgName = oriImgName.substring(oriImgName.lastIndexOf("\\") + 1);
		    
		    //이미지 확장자 자르기
		    String ext = oriImgName.substring(oriImgName.lastIndexOf("."));
		    
		    //이미지 랜덤명 생성
		    String imgName = UUID.randomUUID().toString().replace("-", "");
		    
		    //이미지 저장 이름
		    String saveName = imgName+ext;
		    System.out.println(saveName);
		    
		    //이미지 경로
		    String path = "C:\\DATA\\";		   
		    
		    //이미지 저장 이름과 저장 경로
		    String filePath = path+saveName;
		    
		    params3.put("filePath", filePath);
		    params3.put("oriImgName", oriImgName);
		    params3.put("saveName", saveName);
		    
		    session.insert("managementCourseMapper.insertworkreportimg", params3);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
	}//insertwork() end
	
	
	public List<EgovMap> workReportAllList(){
		return session.selectList("managementCourseMapper.workReportAllList");
	}//workReportAllList() end
	
	
	public List<EgovMap> searchWorkReportList(EgovMap paramMap){
		return session.selectList("managementCourseMapper.workReportAllList", paramMap);
	}//workReportAllList() end
	
	public List<EgovMap> workReportUpdateList(String workNo){
		return session.selectList("managementCourseMapper.workReportUpdateList", workNo);
	}
	
}














