package apeak.golf.controller;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.golf.model.dto.HoleInfoDTO;
import apeak.golf.service.AllCourseService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/all")
public class AllCourseController {

	@Autowired
	private AllCourseService allCourseService;

	@GetMapping("/course_allcourse")
	private String courseAllcourse() {
		return "/all/course_allcourse";
	}
	
	@GetMapping("/getCurrentData")
	@ResponseBody
	public EgovMap getCurrentData(@RequestParam Map<String, Object> param){
		log.debug(param.toString());
		return allCourseService.getCurrentData(param);
	}
	
	@GetMapping("/getChartData")
	@ResponseBody
	public List<EgovMap> getChartData(@RequestParam Map<String, Object> param){
		log.debug(param.toString());
		return allCourseService.getChartData(param);
	}
	
	@GetMapping("/getLayerData")
	@ResponseBody
	public List<EgovMap> getLayerData(@RequestParam Map<String, Object> param){
		return allCourseService.getLayerData(param);
	}
	
	@GetMapping("/getHoleInfo")
	@ResponseBody
	public HoleInfoDTO getHoleInfo(@RequestParam Map<String, Object> param){
		//log.debug(param.toString());
		return allCourseService.getHoleInfoOne(param);
	}
}