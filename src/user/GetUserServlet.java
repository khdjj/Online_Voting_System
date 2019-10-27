package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import pojo.PageBean;
import pojo.User;
import utils.JsonUtil;
import utils.ResponseUtil;

import dao.UserDao;

public class GetUserServlet extends HttpServlet {

	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		System.out.println("GetUserServlet");

		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
			
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));

		UserDao userDao = new UserDao();

		JSONObject result = new JSONObject();
		JSONArray jsonArray;
		
		try {
			jsonArray = JsonUtil.formatRsToJsonArray(userDao.getUser(pageBean));
			int total = userDao.userCount();
			result.put("rows", jsonArray);
			result.put("total", total);	
			ResponseUtil.write(response, result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		
	}

}
