package apeak.golf.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import apeak.golf.model.dao.UserInfoDAO;

@Component // id="memberAuthenticationFailureHandler"
public class MemberAuthenticationFailureHandler implements AuthenticationFailureHandler {
	
	static final Logger logger = LoggerFactory.getLogger(MemberAuthenticationFailureHandler.class);
	
	
	@Autowired
	private UserInfoDAO userInfoDAO;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException auth)
			throws IOException, ServletException {
		request.setAttribute("errorMessage", auth.getMessage());
		logger.debug(request.getHeader("user-agent"));
		request.getRequestDispatcher("/WEB-INF/views/error/loginError.jsp").forward(request, response);
	}
	
}
