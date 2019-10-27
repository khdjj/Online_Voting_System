package loginServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import dao.UserDao;

public class LoginServlet extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		JSONObject obj = new JSONObject();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		System.out.println("username");
		UserDao dao = new UserDao();
		String code = request.getParameter("code");
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		String reqcode =(String) request.getSession().getAttribute("code");


		if(reqcode == null || reqcode.equals("")){
			obj.put("code", 400);
			obj.put("stauts", 0);
			obj.put("msg", "验证码忆失效，请刷新重试");
			response.getWriter().write(obj.toString());
			return;
		}
		
		if(!reqcode.equals(code)){
			System.out.println("验证码不相等");
			obj.put("code", 400);
			obj.put("stauts", 0);
			obj.put("msg", "验证码错误");
			response.getWriter().write(obj.toString());
			return;
		}
		
		String userId = dao.userLogin(username, pwd);
		System.out.println(userId);
		if(userId != null){
			request.getSession().setAttribute("userId", userId);
			if(username.equals("admin")){
				obj.put("code", 200);
				obj.put("status",2);
				obj.put("msg", "登录成功");
				
			}else{
				obj.put("code", 200);
				obj.put("status",1);
				obj.put("msg", "登录成功");
			}
			
		}else{
			
			obj.put("code", 400);
			obj.put("status",0);
			obj.put("msg", "登录失败");
		}
		response.getWriter().write(obj.toString());
	}

}
