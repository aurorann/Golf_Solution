package apeak.golf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import apeak.golf.model.dao.HomeDAO;

@Service
public class HomeService {
	
	@Autowired
	private HomeDAO dao;
	
	public void test() {
		dao.test();
	}
	
}