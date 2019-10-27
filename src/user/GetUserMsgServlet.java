package user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.VoteFont;

import dao.VoteDao;

import net.sf.json.JSONObject;

public class GetUserMsgServlet extends HttpServlet {

	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("GetUserMsgServlet");
		JSONObject obj = new JSONObject();
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
		List<VoteFont> vflist = vd.searchByUserId(userId);
		for(VoteFont vf:vflist){
			System.out.println(vf);
		}
		
		session.setAttribute("UserVote", vflist);
		request.getRequestDispatcher("my.jsp").forward(request, response);
	}
}
