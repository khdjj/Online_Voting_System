package registerServlet;

import java.io.IOException;

import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import dao.UserDao;

import pojo.User;
import utils.Utils;

public class RegisterServlet extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("aaa");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String phone = request.getParameter("phone");
		String pwd = request.getParameter("pwd");
		String city = request.getParameter("city");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		int apply =Integer.parseInt(request.getParameter("apply"));
		JSONObject obj = new JSONObject();
		UserDao dao = new UserDao();

		System.out.println(apply);
		System.out.println(username+"\t"+phone+"\t"+pwd+"\t"+age+"\t"+sex+"\t"+city);
		String userId = Utils.getUUID();
		System.out.println(userId);
		User user= new User(phone,userId,username,pwd,age,city,sex,apply);
		
		try{
			dao.InsertUser(user);
			obj.put("code", 200);
			obj.put("stauts", 1);
			obj.put("msg", "注册成功");
		}catch(Exception e){
			obj.put("code", 400);
			obj.put("stauts", 0);
			obj.put("msg", "注册失败");
		}
		response.getWriter().write(obj.toString());

	}

}
