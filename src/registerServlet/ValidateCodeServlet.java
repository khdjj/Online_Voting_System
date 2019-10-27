package registerServlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ValidateCodeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("abc");
		// 创建图片
		BufferedImage image = new BufferedImage(100, 30,
				BufferedImage.TYPE_INT_RGB);
		// 获取画笔
		Graphics g = image.getGraphics();
		// 设置背景颜色
		Random r = new Random();
		g.setColor(new Color(255,255,255));
		g.fillRect(0, 0, 100, 30);
		String num = getNumber(4);
		request.getSession().setAttribute("code", num);
		System.out.println("code\t"+request.getSession().getAttribute("code"));
		g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
		g.setFont(new Font("楷体", Font.ITALIC, 20));

		g.drawString(num, 20, 20);
		// 画干扰线
		for (int i = 0; i < 6; i++) {
			g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
			g.drawLine(r.nextInt(100), r.nextInt(30), r.nextInt(100),
					r.nextInt(30));
		}
		response.setContentType("image/jpeg");
		OutputStream out = response.getOutputStream();
		ImageIO.write(image, "jpeg", out);
	}

	public String getNumber(int n) {
		String str = "abcdefghijkmlnopqrstuvwxyz1234567890";
		Random r = new Random();
		String m = "";
		for (int i = 0; i < n; i++) {
			m += str.charAt(r.nextInt(str.length()));
		}
		System.out.println(m);
		return m;
	}
}
