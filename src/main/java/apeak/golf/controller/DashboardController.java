package apeak.golf.controller;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.golf.service.AllCourseService;
import apeak.golf.service.DashboardService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/management")
public class DashboardController {

	@Autowired
	private DashboardService dashboardService;

	@RequestMapping("/dashboard")
	private String courseAllcourse() {
		return "/management/dashboard/management_dashboard";
	}

}