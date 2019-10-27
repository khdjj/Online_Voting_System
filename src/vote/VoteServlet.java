package vote;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.Options;
import pojo.VoteFont;
import utils.Utils;

import net.sf.json.JSONObject;

import dao.OptionsDao;
import dao.VoteDao;
import dao.VoteOverDao;

public class VoteServlet extends HttpServlet {

	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		System.out.println("VoteServlet");
		JSONObject obj = new JSONObject();
		int isMult = Integer.parseInt(request.getParameter("isMult"));
		System.out.println("isMult 	"+isMult);
		String options = request.getParameter("opt");
		String vid = request.getParameter("vid");
		String oid = request.getParameter("oid");
		String time = Utils.getSimpleTime();
		String uid = (String) request.getSession().getAttribute("userId");
		OptionsDao dao = new OptionsDao();
		VoteDao vd = new VoteDao();
		VoteOverDao vod = new VoteOverDao();
		System.out.println(vid+"\t"+oid+"\t"+uid+"\t"+options);
		
		if(options != null && vid != null && uid !=null){
			try{
				System.out.println("serchoneday");
				boolean oneday = vod.SearchByOneDay(vid, uid, time)	;
				if(oneday){
					obj.put("code",200);
					obj.put("status", 0);
					obj.put("msg", "今日投票次数已达上限");
					response.getWriter().write(obj.toString());
					return;
				}
				System.out.println(options+"\t"+uid+"\t"+oid+"\t"+time);
				if(isMult == 0){
					dao.updateOptions(options, uid,vid,oid,time);
				}else if(isMult == 1){
					dao.updateMultiOptions(options,uid,vid,oid,time);
				}
				System.out.println(oid);
				List<Options> o = dao.searchOptions(oid);
				VoteFont vf = vd.searchVoteFontById(vid);
				session.setAttribute("options", o);
				session.setAttribute("voteAction",vf);
				session.setAttribute("show",true);
				System.out.println(session.getAttribute("show"));
				obj.put("code",200);
				obj.put("status", 1);
				obj.put("msg", "投票成功");
			}catch(Exception e){
				System.out.println(e);
				obj.put("code",400);
				obj.put("status", 1);
				obj.put("msg", "投票失败,请重试");
			}
		}
		response.getWriter().write(obj.toString());

	}

}
