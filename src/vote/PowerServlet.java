package vote;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

public class PowerServlet extends HttpServlet {

	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("PowerServlet");
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String type = request.getParameter("type");
		String userId =(String) session.getAttribute("userId");
		if(userId == null){
			request.setAttribute("err", "用户id不存在,请重新登录");
		}
		UserDao dao = new UserDao();
		int status = dao.searchByStatus(userId);
		if(status == 1){
			if(type.equals("img")){
				request.getRequestDispatcher("vote_img.jsp").forward(request, response);
			}else if(type.equals("font")){
				request.getRequestDispatcher("vote_font.jsp").forward(request, response);
			}
		}else {
			request.setAttribute("err", "对不起，您没有投票的权限");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	}

	
}
