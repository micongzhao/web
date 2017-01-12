package com.ittx.studentmanager.servlet;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ittx.studentmanager.bean.Student;
import com.ittx.studentmanager.db.StudentDB;
import com.ittx.studentmanager.utils.FileUtil;

public class AddStudentServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //解决post请求乱码
		response.setContentType("text/html;charset=utf-8");//设置响应编码
		
		uploadFileAndStudent(request,response);
	}
	
	public void uploadFileAndStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
		servletFileUpload.setHeaderEncoding("utf-8");
		// 定义一个HashMap，存放请求参数
		HashMap<String, String> parameters = new HashMap<String, String>();
		// 得到所有的文件，以及其它请求参数：
		List<FileItem> fileItems = null;
		try {
			fileItems = servletFileUpload.parseRequest(req);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		Iterator<FileItem> i = fileItems.iterator();
		// 依次处理每一个文件，以及请求参数：
		while (i.hasNext()) {
			FileItem itemFile = (FileItem) i.next();
			// 如果是请求参数
			if (itemFile.isFormField()) {
				String name = itemFile.getFieldName();
				String value = itemFile.getString("utf-8");
				parameters.put(name, value);
                
			} else {// 如果是文件,进行上传操作
				String name = itemFile.getFieldName();
				String fileName = itemFile.getName();  
                String contentType = itemFile.getContentType();  
                //文件预备存放的位置  
                String filePath = getServletContext().getRealPath("/") + "upload/"+fileName;
                System.out.println(fileName +" ;  "+ contentType+"\n"+filePath);
                File file = new File(filePath);  
                FileUtil.createFile(file);
                try {
					itemFile.write(file);
				} catch (Exception e) {
					e.printStackTrace();
				}  
              
                parameters.put(name, "upload/"+fileName);
			}
		}
		
		addStudent(parameters,req,resp);
	}
	
	private void addStudent(HashMap<String,String> parameters,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String userName = parameters.get("userName");
		String number = parameters.get("number");
		int numbers = Integer.parseInt(number);
		int ages = 23;
		String fileUrl = parameters.get("header_img");
		System.out.println("userName:"+userName+", number :"+number+" ,fileUrl :"+fileUrl);
		
		
		//根据学号判断学生是否存在
		if(StudentDB.getInstance().isExistStudentByNumber(numbers)){
			request.getRequestDispatcher("./add_student.jsp?flag=false").forward(request, response);
		}else{
			//添加学生到数据库
			Student student = new Student(userName,numbers,ages,true,fileUrl);
			StudentDB.getInstance().addStudent(student); 

			response.sendRedirect("./student_list.jsp");
		}
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
