package apeak.golf.security;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import apeak.golf.model.dao.UserInfoDAO;

@Component // id="memberAuthenticationFailureHandler"
public class MemberAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	static final Logger logger = LoggerFactory.getLogger(MemberAuthenticationSuccessHandler.class);

	@Autowired
	private UserInfoDAO userDAO;

	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		logger.debug(request.getHeader("user-agent"));

		//userDAO.updateLastLogin(loginHistory.getUserId());
		/*
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		redirectStratgy.sendRedirect(request, response, "/");

		if (savedRequest != null) {
			String targetUrl = savedRequest.getRedirectUrl();
			redirectStratgy.sendRedirect(request, response, targetUrl);
		} else {
			redirectStratgy.sendRedirect(request, response, "/");
		}*/

		Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());

		if (roles.contains("ROLE_ADMIN")) {
			request.getSession(false).setMaxInactiveInterval(-1);
			int timeout = request.getSession(false).getMaxInactiveInterval();
			System.out.println("관리자 타임아웃 = " + timeout);
		} else {
			request.getSession(false).setMaxInactiveInterval(-1);
			int timeout = request.getSession(false).getMaxInactiveInterval();
			System.out.println("기타 타임아웃 = " + timeout);
		}
		
		response.sendRedirect("/all/course_allcourse");

		// request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request,
		// response);
	}

}
