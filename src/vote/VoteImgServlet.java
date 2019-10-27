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
import pojo.VoteFont;
import utils.Utils;
import dao.VoteDao;

public class VoteImgServlet extends HttpServlet {


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
		String key = req.getParameter("keys");
		String classfity = req.getParameter("classfity");
		String imgdesc = req.getParameter("imgdesc");
		String time = Utils.getTime();
		System.out.println(title+"\t"+img+"\t"+desc);
		System.out.println(voteId+"\t"+optionsId);
		String visible = "全部可见";
		String type = "img";
		System.out.println(img+"\t"+imgdesc);
		VoteFont voteFont = new VoteFont(voteId,title,optionsId,desc,time,classfity,time,endtime,key,userId,visible,type);
		String[] o = Utils.stringToList(img);
		String[] d = Utils.stringToList(imgdesc);
		System.out.println(o);
		voteFont.setOptions(o);
		
		
		System.out.println(title+"\t"+img+"\t"+desc);
		
		
		if(select.equals("单选")){
			voteFont.setSingleEle("单选");
		}else{
			voteFont.setMultipleEle("多选");
		}
		VoteDao dao = new VoteDao();
		
		try {
			dao.insertVote(voteFont,d);
			obj.put("code",200);
			obj.put("status",1);
			obj.put("msg","投票信息发布成功");
			
		} catch (SQLException e) {
			System.out.println(e);
			obj.put("code",400);
			obj.put("status",0);
			obj.put("msg","投票信息发布失败，请重试");
		}
	
		res.getWriter().write(obj.toString());

	}
}
