package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DataDao;

public class GetDataAnaServlet extends HttpServlet {


	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String voteId = request.getParameter("voteId");
		String classfity = request.getParameter("classfity");
		DataDao dao = new DataDao();
		String data = dao.getData(voteId, classfity);
		response.getWriter().write(data);
	}

}
