package apeak.golf.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component // id="memberAuthenticationFailureHandler"
public class MemberAuthenticationFailureHandler implements AuthenticationFailureHandler {
	
	static final Logger logger = LoggerFactory.getLogger(MemberAuthenticationFailureHandler.class);
	/*
	@Autowired
	private LoginHistoryDAO loginHistoryDAO;
	
	@Autowired
	private UserInfoDAO userDAO;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException auth)
			throws IOException, ServletException {
		request.setAttribute("errorMessage", auth.getMessage());
		logger.debug(request.getHeader("user-agent"));
		if(userDAO.isExistMemberbyId((String)request.getParameter("userId")) != 0) {
			LoginHistoryDTO loginHistory = userAccessLogger(request);
			loginHistoryDAO.insertLoginHistory(loginHistory);
		}
		request.getRequestDispatcher("/WEB-INF/views/error/loginError.jsp").forward(request, response);
	}
	
	public LoginHistoryDTO userAccessLogger(HttpServletRequest req) throws IOException {
		LoginHistoryDTO loginHistory = new LoginHistoryDTO();
		Parser uaParser = new Parser();
		Client client = uaParser.parse(req.getHeader("user-agent"));
		String acssIp = req.getRemoteAddr();

		loginHistory.setUserId(req.getParameter("userId"));
		loginHistory.setIp(acssIp);
		loginHistory.setDevice(client.userAgent.family + "/" + client.os.family + "/" + client.device.family);
		loginHistory.setSuccess("로그인 실패");
		
		return loginHistory;
	}*/

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}
}
