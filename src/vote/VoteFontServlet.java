package vote;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import dao.VoteDao;

import pojo.VoteFont;

import utils.Utils;

public class VoteFontServlet extends HttpServlet {

	
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		res.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		JSONObject obj =new JSONObject();
		String userId = (String)session.getAttribute("userId");
		if(userId == null){
			obj.put("code",400);
			obj.put("status",0);
			obj.put("msg","对不起，用户名未登录或信息已消失，请重新登录");
			res.getWriter().write(obj.toString());
			return;
		}
		
		String voteId = Utils.getUUID();
		String optionsId = Utils.getUUID();
		String title = req.getParameter("title");
		String img = req.getParameter("img");
		String desc = req.getParameter("desc");
		String select = req.getParameter("select");
		String endtime = req.getParameter("endtime");
		String visible = req.getParameter("visible");
		String options = req.getParameter("options");
		String key = req.getParameter("key");
		String classfity = req.getParameter("classfity");
		String vid = req.getParameter("vid");
		String oid = req.getParameter("oid");
		String time = Utils.getTime();
		System.out.println(voteId+"\t"+optionsId);
		VoteFont voteFont = new VoteFont(voteId,optionsId,title,img,desc,time,classfity,time,endtime,visible,key,userId,"font");
		String[] o = Utils.stringToList(options);
		voteFont.setOptions(o);
		if(select.equals("单选")){
			voteFont.setSingleEle("单选");
		}else{
			voteFont.setMultipleEle("多选");
		}
		VoteDao dao = new VoteDao();
		if(vid == null && oid == null){
			System.out.println("VoteFontServlet get vid oid is null");
			try {
				dao.insertVote(voteFont,null);
				obj.put("code",200);
				obj.put("status",1);
				obj.put("msg","投票信息发布成功");
				
			} catch (SQLException e) {
				System.out.println(e);
				obj.put("code",400);
				obj.put("status",0);
				obj.put("msg","投票信息发布失败，请重试");
			}
		
		}else{
			System.out.println("VoteFontServlet get vid oid is not null modify");
			try {
				dao.modifyVote(voteFont,vid);
				obj.put("code",200);
				obj.put("status",1);
				obj.put("msg","投票信息修改成功");
				
			} catch (SQLException e) {
				System.out.println(e);
				obj.put("code",400);
				obj.put("status",0);
				obj.put("msg","投票信息修改失败，请重试");
			}
		}
		
		res.getWriter().write(obj.toString());
	}

}
