package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import dao.VoteDao;

public class DeleteVoteServlet extends HttpServlet {


	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("deleteModifyServlet");
		JSONObject obj = new JSONObject();
		String voteId = request.getParameter("voteId");
		System.out.println(voteId);

		VoteDao dao = new VoteDao();
		
		try {
			dao.deleteVote(voteId);
			obj.put("code",200);
			obj.put("status",1);
			obj.put("msg","投票信息删除成功");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e);
			obj.put("code",400);
			obj.put("status",0);
			obj.put("msg","投票信息删除失败");
		}
		
		response.getWriter().write(obj.toString());
		
	}

}
