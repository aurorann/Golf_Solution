package apeak.golf.controller;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.golf.service.RobotService;

@Controller
@RequestMapping("/management")
public class RobotController {
	
	@Autowired
	private RobotService robotService;

	@RequestMapping("/robot1")
	private String robot1() {
		return "/management/robot/management_robot1";
	}
	
	@RequestMapping("/robot2")
	private String robot2() {
		return "/management/robot/management_robot2";
	}
	
	@RequestMapping("/getRobotInfo")
	private List<EgovMap> getRobotInfo(){
		return robotService.getRobotInfo();
	}
	
	//로봇 로그 리스트
	@RequestMapping("/getLogList")
	@ResponseBody
	public Map<String,Object> getLogList(@RequestParam Map<String, Object> pMap){
		return robotService.getLogList(pMap);
	}
	
	//로봇 로그 검색 리스트
	@ResponseBody
	@RequestMapping("/logSearchList")
	public Map<String,Object> logSearchList(@RequestParam Map<String, Object> pMap) {
		
		return robotService.logSearchList(pMap);
	}
	
	

}