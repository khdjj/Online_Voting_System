package filter;

import java.io.IOException;


import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest  httpRequest = (HttpServletRequest)req;
		HttpServletResponse httpResponse = (HttpServletResponse) res;
		String url = httpRequest.getRequestURL().toString();
		System.out.println("abc");
		if(url.indexOf("/index") != -1){
			System.out.println("index.jsp");
			httpResponse.sendRedirect("getVoteFontServlet");
		}else{
			chain.doFilter(req, res);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
