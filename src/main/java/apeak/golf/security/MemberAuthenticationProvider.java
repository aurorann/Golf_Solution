package apeak.golf.security;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import apeak.golf.model.dao.UserAuthDAO;
import apeak.golf.model.dao.UserInfoDAO;
import apeak.golf.model.dto.UserAuthDTO;
import apeak.golf.model.dto.UserInfoDTO;


@Service			// id= memberAuthenticationProvider
public class MemberAuthenticationProvider implements AuthenticationProvider {
	static final Logger logger = LoggerFactory.getLogger(MemberAuthenticationProvider.class);
	
	@Autowired
	private UserInfoDAO userInfoDAO;
	
	@Autowired
	private UserAuthDAO userAuthDAO;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private HttpServletRequest req;
	
	/*
	 * 사용자가 화면에서 로그인을 진행하면 아래의 메소드가 실행된다.*매개변수: 인증시 필요한 정보-
	 * 
	 * Authentication(사용자가 입력한 ID,PASSWORD가 저장되어 있다) 리턴값 : 인증된 정보를 가진 Authentication
	 * 
	 * 결론 : 인자값으로 전달된 Authentication객체를 받아 인증처리를 한 뒤 인증한 정보를 Authentication에 담아서
	 * 리턴한다.
	 */

	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		logger.debug("auth provider access");		
//		HttpServletRequest req =((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();		
//		logger.debug(userAccessLogger(req).toString());
		
		// 1. 파라미터로 전달받은 Authentication 객체의 인증처리가 지원되지 않으면 null이 리턴
		if (!supports(auth.getClass())) {
			return null;
		}
		
		// 2.인수로 받는 user정보를 가지고 디비에 존재하는지 체크(id check)
		String userId = auth.getName();
		UserInfoDTO userInfoDTO = userInfoDAO.selectUserById(userId);
		
		if (userInfoDTO == null) {// ID가 없는경우
			throw new UsernameNotFoundException("아이디 또는 패스워드 오류입니다.");// spring exception
		}
		
		//3.id가 존재하면 비밀번호 비교
		String password = 	(String)auth.getCredentials();
		
		if (!passwordEncoder.matches(password, userInfoDTO.getUserPw())) {
			throw new BadCredentialsException("아이디 또는 패스워드 오류입니다.");
		}
		
		logger.debug(userId + " , " + password);
		//////////// 여기까지 왔다면 인증에 성공함 /////////////////
		// 4. id, password 모두가 일치하면 Authentication를 만들어서 리턴.
		// 사용자의 권한을 조회 : 하나의 사용자는 여러개의 권한을 가짐.
		
		List<UserAuthDTO> list = userAuthDAO.selectAuthorityByUserId(userId);

		if (list.isEmpty()) {
			// 아무 권한이 없는경우....
			System.out.println("에러발생");
			throw new UsernameNotFoundException("사용이 중지된 유저입니다.");
		}

		// db에서 가지고 온 권한을 GrantedAuthority 로 변환해야함.
		List<SimpleGrantedAuthority> authList = new ArrayList<SimpleGrantedAuthority>();
		for (UserAuthDTO authority : list) {
			authList.add(new SimpleGrantedAuthority(authority.getAuth()));
		}
		
		// UsernamePasswordAuthenticationToken(Object principal, Object credentials,
		// authorities)
		// UsernamePasswordAuthenticationToken는 Authentication의 자식객체
		// 인증완료된 결과로 UsernamePasswordAuthenticationToken를 리턴한다.
		logger.debug(userInfoDTO.toString());
		return new UsernamePasswordAuthenticationToken(userInfoDTO, null, authList);
	}

	/*
	 * 해당 타입의 Authentication객체를 이용해서 인증 처리를 할수 있는지 여부를 리턴해주는 메소드
	 */
	
	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
	
//	public Map<String, String> userAccessLogger(HttpServletRequest req) {
//		Map<String, String> acssInfoMap = new HashMap<String, String>();
//		Client client = uaParser.parse(req.getHeader("user-agent"));
//		String acssIp = req.getHeader("X-FORWARDED-FOR");
//		if(acssIp == null) {
//			acssIp = req.getRemoteAddr();
//		}
//		
//		acssInfoMap.put("ip", acssIp);
//		acssInfoMap.put("device", client.userAgent.family + "/" + client.os.family + "/" + client.device.family);
//		
//		return acssInfoMap;
//	}
}