package apeak.golf.controller;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import apeak.golf.service.RobotService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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

}