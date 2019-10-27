package vote;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.Comment;
import pojo.Options;
import pojo.VoteFont;

import dao.CommentDao;
import dao.OptionsDao;
import dao.VoteDao;

public class VoteFontActionServlet extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		session.setAttribute("show",false);
		System.out.println("VoteFontActionServlet");
		OptionsDao optdao  = new OptionsDao();
		VoteDao dao = new VoteDao();
		String voteId = request.getParameter("vote_id");
		String optionsId = request.getParameter("options_id");
		int index =Integer.parseInt(request.getParameter("vote_index"));
		String type = request.getParameter("type");
		System.out.println(index);
		dao.insertVisitNum(voteId);
		System.out.println(session.getAttribute("show"));
		List<Options> options = optdao.searchOptions(optionsId);
		for(Options o:options){
			System.out.println(o);
		}
		session.setAttribute("options", options);
		VoteFont vf = dao.searchVoteFontById(voteId);
		System.out.println(vf);
		session.setAttribute("voteAction",vf);
		System.out.println("aaaaaaaaaaaaaaaa");
		//获取评论数据
		CommentDao cd = new CommentDao();
		Comment c = null;
		
		List<Comment> cl = cd.searchAllComment(voteId);
		for(int i = 0;i<cl.size();i++){
			System.out.println("aaaa");
			String cid = cl.get(i).getCommentId();
			System.out.println(cid);
			List<String> sl = cd.searchQuoteId(cid);
			System.out.println(sl);
			List<Comment> clr = new ArrayList<Comment>();
			for(int j = 0;j<sl.size();j++){
				System.out.println(sl.get(j));
				String  qid = sl.get(j);
				if(qid !=null || qid.equals("")){
					c = cd.searchOneComment(qid);	
					clr.add(c);
				}
			}
			cl.get(i).setQuocom(clr);
		}
		
		for(Comment cc:cl){
			System.out.println(cc);
		}

		session.setAttribute("comment", cl);
		
		if(type.equals("font")){
			response.sendRedirect("vote_font_action.jsp");
		}else if(type.equals("img")){
			response.sendRedirect("vote_img_action.jsp");
		}
	}
}
