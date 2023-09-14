package apeak.golf.controller;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.golf.service.DashboardService;

@Controller
@RequestMapping("/management")
public class DashboardController {

	@Autowired
	private DashboardService dashboardService;
	
	@RequestMapping("/dashboard")
	private String dashBoard() {
		
		dashboardService.holeinfo();
		
		return "/management/dashboard/management_dashboard";
	}//dashBoard() end
	

	@RequestMapping(value = "/dashboardAjax", method = RequestMethod.GET)
	@ResponseBody
	public EgovMap dashBoard(@RequestParam String category) {
		
		//System.out.println("오류지점 찾기");
		
	    return dashboardService.data(category);
	}

}