package vote;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.Comment;

import utils.Utils;

import dao.CommentDao;

import net.sf.json.JSONObject;

public class CommentServlet extends HttpServlet {


	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		
		System.out.println("commentSerlvet");
		JSONObject obj = new JSONObject();
		HttpSession session = request.getSession();
		String content = request.getParameter("content");
		String voteId = request.getParameter("voteId");
		String userId = (String)session.getAttribute("userId");
		String commentId = Utils.getUUID();
		String time = Utils.getTime();
		System.out.println(content);
		if(userId == null){
			obj.put("code", 400);
			obj.put("status", 0);
			obj.put("msg","对不起，用户信息已过期 ，请重新登录");
			response.getWriter().write(obj.toString());
			return ;
		}
		

		CommentDao dao = new CommentDao();
		Comment c = new Comment(voteId,commentId,content,time,userId);
		System.out.println(c);
		try {
			dao.insertComment(c);
			obj.put("code", 200);
			obj.put("status", 1);
			obj.put("msg","评论发表成功");
			
		} catch (SQLException e) {
			obj.put("code",400);
			obj.put("status", 0);
			obj.put("msg","评论发表失败");
			e.printStackTrace();
		}
		response.getWriter().write(obj.toString());
	}


}
