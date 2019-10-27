package registerServlet;

import java.io.IOException;
import java.io.OutputStream;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import pojo.User;

import dao.UserDao;

public class UserNameServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		System.out.println(username);
		UserDao dao = new UserDao();
		User user = new User();
		user = dao.selectByName(username);
		System.out.println(user);
		JSONObject obj = new JSONObject();
		if(user.getUsername() != null){
			obj.put("code", 200);
			obj.put("status", 0);
			obj.put("msg", "对不起,该用户名已存在");
		}else{
			obj.put("code", 200);
			obj.put("status", 1);
			obj.put("msg", "用户名可注册");
		}
		response.getWriter().write(obj.toString());
	}
}
