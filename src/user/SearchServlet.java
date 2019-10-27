package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import pojo.VoteFont;

import dao.VoteDao;

public class SearchServlet extends HttpServlet {

	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		JSONObject obj = new JSONObject();
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String key = request.getParameter("key");
		System.out.println("searchSerlvet");
		VoteDao dao = new VoteDao();
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		if(userId == null){
			obj.put("code", 400);
			obj.put("status", 0);
			obj.put("msg", "用户信息已过期，请稍候重试");
			response.getWriter().write(obj.toString());
			return ;
		}
		
		VoteDao vd = new VoteDao();
		List<VoteFont> vflist = vd.searchByKey(userId,key);
		
		for(VoteFont vf:vflist){
			System.out.println(vf);
		}
		
		session.setAttribute("UserVote", vflist);
		
	}

}
