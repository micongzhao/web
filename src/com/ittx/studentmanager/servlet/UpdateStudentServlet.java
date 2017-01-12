package com.ittx.studentmanager.servlet;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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

public class UpdateStudentServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 解决post请求乱码
		response.setContentType("text/html;charset=utf-8");// 设置响应编码
		HashMap<String, String> parameterMap = new HashMap<>();

		// -----保存参数到hashMap并上传新头像-----
		uploadHeader(request, parameterMap);

		// ----删除原头像-----
		deleteHeaderImg(parameterMap);

		// -----修改数据库字段----
		updateStudent(parameterMap);

		response.sendRedirect(request.getContextPath() + "/student_list.jsp");
	}

	/**
	 * 上传修改后头像并保存表单数据到hashmap
	 * 
	 * @param request
	 * @throws UnsupportedEncodingException
	 */
	public void uploadHeader(HttpServletRequest request, HashMap<String, String> parameterMap)
			throws UnsupportedEncodingException {
		ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
		List<FileItem> fileItemLists = null;
		try {
			fileItemLists = servletFileUpload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		Iterator<FileItem> iterator = fileItemLists.iterator();
		while (iterator.hasNext()) {
			FileItem fileItem = iterator.next();
			// 如果是表单数
			if (fileItem.isFormField()) {
				String filedName = fileItem.getFieldName();
				String fileValue = fileItem.getString("UTF-8");
				parameterMap.put(filedName, fileValue);
			} else {// 文件操作
				String rootDir = getServletContext().getRealPath("/");
				String fileDir = "upload/" + fileItem.getName();
				File file = new File(rootDir + fileDir);
				FileUtil.createFile(file);
				
				try {
					fileItem.write(file);
				} catch (Exception e) {
					e.printStackTrace();
				}

				parameterMap.put(fileItem.getFieldName(), fileDir);
			}
		}
	}

	/**
	 * 删除原头像
	 * 
	 * @param parameterMap
	 */
	public void deleteHeaderImg(HashMap<String, String> parameterMap) {
		String number = parameterMap.get("number");
		Student student = StudentDB.getInstance().findStudentByNumber(Integer.parseInt(number));
		String header_img = student.getFileUrl();
		String header_file = getServletContext().getRealPath("/") + header_img;
		System.out.println("header_file ：" + header_file);
		File file = new File(header_file);
		if (file.exists()) {
			file.delete();
		}
	}

	/**
	 * 修改学生信息
	 * 
	 * @param parameterMap
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void updateStudent(HashMap<String, String> parameterMap) throws IOException {
		String userName = parameterMap.get("userName");
		String nums = parameterMap.get("number");
		String age = parameterMap.get("age");
		String sex = parameterMap.get("sex");
		String header_url = parameterMap.get("header_img");
		int num = Integer.parseInt(nums);
		int ages = Integer.parseInt(age);
		boolean sexs = sex.equals("1") ? true : false;

		Student stu = new Student(userName, num, ages, sexs, header_url);
		StudentDB.getInstance().updateStudent(stu);

	}

}
