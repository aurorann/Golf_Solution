package apeak.golf.controller;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.golf.service.RobotService;

@Controller
@RequestMapping("/management")
@CrossOrigin(origins = "*")
public class RobotController {
	
	@Autowired
	private RobotService robotService;

	@RequestMapping("/robot1")
	private String robot1(Model model) {
		List<EgovMap> list = robotService.getRobotInfo();
		model.addAttribute("list", list);

		List<EgovMap> log = robotService.getLogList();
		model.addAttribute("log", log);
		
		return "/management/robot/management_robot1";
	}
	
	@RequestMapping("/robot2")
	private String robot2() {
		return "/management/robot/management_robot2";
	}
	
	@ResponseBody
	@RequestMapping("/getRobotInfo")
	private List<EgovMap> getRobotInfo(){
		return robotService.getRobotInfo();
	}
	
	@ResponseBody
	@RequestMapping("/getRobotInfoSelect")
	private List<EgovMap> getRobotInfo(@RequestParam(value="robotName", required=false)  String robotName){
		return robotService.getRobotInfo(robotName);
	}
	
	//로봇 로그 리스트
	@RequestMapping("/getLogList")
	@ResponseBody
	public Map<String,Object> getLogList(@RequestParam Map<String, Object> pMap){
		return robotService.getLogList(pMap);
	}
	
	@RequestMapping("/getLogList2")
	@ResponseBody
	public List<EgovMap> getLogList(){
		return robotService.getLogList();
	}
	
	//로봇 로그 검색 리스트
	@ResponseBody
	@RequestMapping("/logSearchList")
	public Map<String,Object> logSearchList(@RequestParam Map<String, Object> pMap) {
		
		return robotService.logSearchList(pMap);
	}
	
	

}