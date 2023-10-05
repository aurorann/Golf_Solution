package apeak.golf.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;


@Component // id="memberAuthenticationFailureHandler"
public class MemberAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	
	static final Logger logger = LoggerFactory.getLogger(MemberAuthenticationSuccessHandler.class);
	/*
	@Autowired
	private LoginHistoryDAO loginHistoryDAO;

	
	@Autowired
	private UserInfoDAO userDAO;
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		logger.debug(request.getHeader("user-agent"));
		LoginHistoryDTO loginHistory = userAccessLogger(request);
		loginHistoryDAO.insertLoginHistory(loginHistory);
		userDAO.updateLastLogin(loginHistory.getUserId());		
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		redirectStratgy.sendRedirect(request, response, "/");
		
		/*
		 * if(savedRequest!=null) { String targetUrl = savedRequest.getRedirectUrl();
		 * redirectStratgy.sendRedirect(request, response, targetUrl); } else {
		 * redirectStratgy.sendRedirect(request, response, "/"); }
		 */
	/*
		Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
		
		if (roles.contains("ROLE_ADMIN")) {
			request.getSession(false).setMaxInactiveInterval(-1);
			int timeout = request.getSession(false).getMaxInactiveInterval();
			System.out.println("관리자 타임아웃 = "+timeout);
		}else {
			request.getSession(false).setMaxInactiveInterval(-1);
			int timeout = request.getSession(false).getMaxInactiveInterval();
			System.out.println("기타 타임아웃 = "+timeout);
		}

		//request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
	}
	
	public LoginHistoryDTO userAccessLogger(HttpServletRequest req) throws IOException {
		logger.debug(req.getParameterMap().toString());
		LoginHistoryDTO loginHistory = new LoginHistoryDTO();
		Parser uaParser = new Parser();
		Client client = uaParser.parse(req.getHeader("user-agent"));
		String acssIp = req.getRemoteAddr();
		String pushToken = req.getParameter("pushToken");
		
		loginHistory.setUserId(req.getParameter("userId"));
		if(pushToken != null && !pushToken.equals("")) {
			loginHistory.setPushToken(pushToken);
		}
		loginHistory.setIp(acssIp);
		loginHistory.setDevice(client.userAgent.family + "/" + client.os.family + "/" + client.device.family);
		loginHistory.setSuccess("로그인 성공");
		
		return loginHistory;
	}*/

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}

}
