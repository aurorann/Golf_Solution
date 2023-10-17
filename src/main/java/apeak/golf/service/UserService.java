package apeak.golf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import apeak.golf.model.dao.UserInfoDAO;

@Service
@Transactional
public class UserService {

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private UserInfoDAO userInfoDAO;
	
	public void example() {
		passwordEncoder.encode("패스워드 암호화");
		//DB에서 꺼내온값과 사용자 입력값 비교
		passwordEncoder.matches("", "");
	}
}