package uploadServlet;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import utils.Utils;

public class UploadImgServlet extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String returndata = "";
		Utils uuid = new Utils();
		JSONObject obj = new JSONObject();
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		 System.out.println(request.getParameter("file"));
		DiskFileItemFactory factory = new DiskFileItemFactory();
		File f = new File("D:/target");
		if(!f.exists()){
			f.mkdirs();
		}
		factory.setRepository(f);
		ServletFileUpload fileupload = new ServletFileUpload(factory);
		fileupload.setHeaderEncoding("utf-8");
		PrintWriter out = response.getWriter();
		try {
			List<FileItem> fileItems = fileupload.parseRequest(request);
			for(FileItem fileitem:fileItems){
				if(fileitem.isFormField()){
					String name = fileitem.getFieldName();
					String value = fileitem.getString();
					System.out.println("value");
					out.println("上传作者是"+value+"*****");
				}else{
					
					String fileName = fileitem.getName();
					fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
					System.out.println(fileName);
					fileName =uuid.getUUID()+"_"+fileName;
					String filepath = "upload/";
					filepath = getServletContext().getRealPath(filepath+fileName);
					System.out.println(filepath);
					File file = new File(filepath);
					OutputStream op = new FileOutputStream(file);
					InputStream in = fileitem.getInputStream();
					System.out.println("on");
					byte[] buffer = new byte[1024];
					int len = -1;
					while((len = in.read(buffer))!=-1){
						op.write(buffer,0,len);
					}
					op.close();
					in.close();
					fileitem.delete();
					System.out.println(fileName);
					returndata = returndata+"upload/"+fileName + ",";
					
				}

			}	
			System.out.println(returndata.lastIndexOf(","));
			returndata = returndata.substring(0,returndata.lastIndexOf(","));
			obj.put("code",200);
			obj.put("status", 1);
			System.out.println(returndata);
			obj.put("url",returndata);
			
		} catch (FileUploadException e) {
			obj.put("code",400);
			obj.put("status", 0);
			obj.put("msg","上传失败");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.getWriter().write(obj.toString());
	}
		
		
	}
