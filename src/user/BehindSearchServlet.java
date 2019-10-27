package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.JsonUtil;
import utils.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import dao.UserDao;

public class BehindSearchServlet extends HttpServlet {

	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("aaaaaaaaa");


		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String key = request.getParameter("key");
		String value = request.getParameter("value");
		value = new String(value.getBytes("ISO-8859-1"), "utf-8");
		System.out.println(key+value);
		UserDao dao = new UserDao();
		JSONObject result = new JSONObject();
		JSONArray jsonArray;
		try {
			ResultSet rs = dao.searchUser(key,value);
//			while(rs.next()){
//				System.out.println(rs.getString("username"));
//			}
			jsonArray = JsonUtil.formatRsToJsonArray(rs);
			int total = 1;
			result.put("rows", jsonArray);
			result.put("total", total);	
			ResponseUtil.write(response, result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
