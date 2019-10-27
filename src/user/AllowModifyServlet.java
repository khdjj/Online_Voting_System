package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import pojo.VoteFont;

import dao.VoteDao;

public class AllowModifyServlet extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		System.out.println("allowModifyServlet");
		JSONObject obj = new JSONObject();
		String voteId = request.getParameter("voteId");
		System.out.println(voteId);

		VoteDao dao = new VoteDao();
		
		VoteFont vf = dao.searchVoteFontById(voteId);
		System.out.println(vf);
		System.out.println(vf.getVotes_num());
		if(vf.getVotes_num() > 0){
			response.sendRedirect("my.jsp");
			return ;
		}
		System.out.println("allow is pass");
		request.getSession().setAttribute("modifyVote", vf);
		response.sendRedirect("vote_font_modify.jsp");
	}


}
