package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import dao.UserDao;

import pojo.User;
import utils.ResponseUtil;

public class EditUserServlet extends HttpServlet {


	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("EditUserServlet");

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String userId  = request.getParameter("userId");
		String username = request.getParameter("username");
		String phone = request.getParameter("phone");
		String pwd= request.getParameter("pwd");
		String sex = request.getParameter("sex");;
		String age = request.getParameter("age");
		String city = request.getParameter("city");
		String status =request.getParameter("status");
		int s = 0 ;
		if(status.equals("激活")){
			 s = 1;
		}else if(status.equals("禁用")){
			 s = 0;
		}
		
		User user = new User(phone,userId,username,pwd,s,age,sex,city);
		
		System.out.println(user);
		UserDao dao = new UserDao();
		JSONObject obj = new JSONObject();
		try {
			dao.modifyUser(user);
			obj.put("code", 200);
			obj.put("status", 1);
			obj.put("msg", "数据修改成功");
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e);
			obj.put("code", 400);
			obj.put("status",1);
			obj.put("msg", "数据修改失败");
		}
		
		try {
			ResponseUtil.write(response, obj);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
