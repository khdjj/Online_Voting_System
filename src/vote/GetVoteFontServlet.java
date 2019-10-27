package vote;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.Options;
import pojo.VoteFont;

import dao.DataDao;
import dao.OptionsDao;
import dao.VoteDao;

public class GetVoteFontServlet extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		System.out.println("getVoteFontServlet");
		String pa = request.getParameter("page");
		int count = 6;
		int page = 0;
		
		try{
	
			if(pa != null){
				page  = Integer.parseInt(request.getParameter("page"));
				if(page<0){
					page = 0;
				}
			}
			
		}catch(Exception e){
			System.out.println(e);
		}
	

		VoteDao dao = new VoteDao();
		OptionsDao od = new OptionsDao();
		List<VoteFont> list = dao.getVote(page,count);
		List<Options> ol = new ArrayList<Options>();
		for(VoteFont f:list){
			System.out.println(f);
		}
		for(int i = 0;i<list.size();i++){
			String oid = list.get(i).getOptionsId();
			ol.add(od.searchOneOptions(oid));
		}
		for(Options o:ol){
			System.out.println(o);
		}
		
		request.getSession().setAttribute("page", page);
		request.getSession().setAttribute("count", count);
		request.getSession().setAttribute("voteFont", list);
		request.getSession().setAttribute("voteOpt", ol);

		response.sendRedirect("index.jsp");

		
	}

}
