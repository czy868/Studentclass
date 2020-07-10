/**
 * 
 */
package com.bota.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bota.bean.data;
import com.bota.bean.quebank;
import com.bota.bean.squesionbank;
import com.bota.bean.sworklist;
import com.bota.service.CourseService;
import com.bota.service.QuesionService;

/**
 * @author 14455
 *
 */
@Controller
public class QuesionController {

	@Autowired
	private QuesionService quesionService;


	@RequestMapping("homeworklist")
	public String addwork(HttpServletRequest request,String studentId,HttpSession session) {
		Map<String,Object> workmap = new HashMap<String, Object>();
		workmap.put("studentid",studentId);
		System.out.println("学号"+studentId);
		List<sworklist> swlist = quesionService.selectworklist(studentId,0);
		request.setAttribute("swlist", swlist);
		session.setAttribute("swlist", swlist);
		return "studentCourse/swlist";
	}

	@RequestMapping("filehomeworklist")
	public String filehomeworklist(HttpServletRequest request,String studentId,HttpSession session) {
		Map<String,Object> workmap = new HashMap<String, Object>();
		workmap.put("studentid",studentId);
		System.out.println("学号"+studentId);
		List<sworklist> swlist = quesionService.selectworklist(studentId,1);
		request.setAttribute("fileswlist", swlist);
		session.setAttribute("fileswlist", swlist);
		return "studentCourse/File";
	}

	@RequestMapping("selectquebank")
	public String selectquebank(HttpServletRequest request,String studentId,String courseNumber,String workid,String id,HttpSession session) {
		System.out.println("做作业");
		System.out.println("courseNumber"+courseNumber);
		System.out.println("studentId"+studentId);
		//当前进入的作业的课程号码和作业第几份
		session.setAttribute("cursworklistid", id);
		System.out.println("id"+id);
		List<quebank> quebanklist = quesionService.selectquebank(courseNumber);
		request.setAttribute("quebanklist", quebanklist);
		session.setAttribute("quebanklist", quebanklist);
		System.out.println("开始去页面");
		return "studentCourse/quebank";
	}
	@RequestMapping("exahomework")
	public String exahomework(String[] list,HttpSession session,HttpServletRequest request) {
		//获取当前做的这一份作业的课程号码和第几份作业
		String id = (String) session.getAttribute("cursworklistid");
		int idd=Integer.parseInt(id);
		String curworkid = (String) session.getAttribute("curworkid");
		System.out.println("开始检查作业"+list[0]);
		int num=0,flag=0;
		for(int i=1;i<=10;i++)
		{
			System.out.println("回答"+list[i]);
		}
		List<quebank> quebanklist = (List<quebank>) session.getAttribute("quebanklist");
		List<sworklist> swlist = (List<sworklist>) session.getAttribute("swlist");
		List<squesionbank> squesionbanklist = new ArrayList<squesionbank>();
		//找到当前做的这一份作业
		for(int i=0;i<swlist.size();i++)
		{
			if(idd == swlist.get(i).getId())
			{
				flag=i;
				break;
			}
		}
		for(int i=1;i<=10;i++)
		{
			squesionbank s =new squesionbank();
			s.setCourseNumber(quebanklist.get(0).getCourseNumber());
			s.setCoursename(quebanklist.get(0).getCoursename());
			s.setTeachername(swlist.get(flag).getTeacher());
			s.setQuesion(quebanklist.get(i-1).getQuesion());
			s.setWorkid(swlist.get(flag).getWorkid());
			s.setSanswer(list[i]);
			s.setAnswer(quebanklist.get(i-1).getAnswer());
			s.setStudentname(swlist.get(flag).getStudentname());
			s.setStudentid(swlist.get(flag).getStudentid());
			if(quebanklist.get(i-1).getAnswer().equals(list[i]))
			{
				num+=10;
				s.setGrade(10);
			}
			else
			{
				s.setGrade(0);
			}
			quesionService.exahomework(s,num);
			squesionbanklist.add(s);
		}
		List<sworklist> swlist1 = quesionService.selectworklist(swlist.get(0).getStudentid(),0);
		request.setAttribute("swlist", swlist1);
		session.setAttribute("swlist", swlist1);
		//System.out.println("老师名字"+quebanklist.get(0).getCourseNumber());
		return "redirect:homeworklist";
	}
	@RequestMapping("selectxq")
	public String selectxq(HttpServletRequest request,String studentid,String courseNumber,int workid)
	{
		List<squesionbank> selectxqlist=quesionService.selectxq(studentid, courseNumber, workid);
		request.setAttribute("selectxqlist", selectxqlist);
		return "studentCourse/selectxq";

	}
	@RequestMapping("fanhui")
	public String fanhui(HttpServletRequest request){
		return "personalCenter/myself";
	}
	@RequestMapping(value="regist", method= {RequestMethod.GET, RequestMethod.POST})
	public String regist(@RequestParam MultipartFile file,String id,String courseNumber,HttpSession session) {
		try {
			// 上传到本地
			// 获取文件名
			Long usernumber1 = (Long) session.getAttribute("studentId");
			String studentid = String.valueOf(usernumber1);
			String fileName = file.getOriginalFilename();
			String headPath = "D:\\javaxm\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\zhuanzhuan\\files\\" + fileName;
			//data是文件信息实体
			data d = new data();
			//存这个文件是那个课程编号的课程的文件
			d.setCourseNumber(courseNumber);
			//0代表这个文件是作业不是课件，1代表文件是课件
			d.setIndentfy(0);
			//c存上传作业学生的id
			d.setStudentid(studentid);
			//存这个文件的文件名
			d.setUrl(fileName);
			//输出文件存放的路径看看
			System.out.println(headPath);
			//把文件信息存到数据库
			quesionService.tjurl(d);
			//实例化一个文件类型，指定路径headPath
			File dest = new File(headPath);
			//开始存文件，路径上一行已经写进去了
			file.transferTo(dest);
			System.out.println("上传成功");
			int idd=Integer.parseInt(id);
			//更新这一份作业的状态，1代表我现在作业完成了。
			sworklist s= new sworklist();
			s.setStatus(1);
			//idd代表学生id
			s.setId(idd);
			//现在开始向数据库里面去更新作业的状态
			quesionService.updatestatus(s);
			//从新获取这个学生作业的状态，1代表这份作业是需要提交文件的，0代表这份作业是再题库里面完成的
			List<sworklist> swlist = quesionService.selectworklist(studentid,1);
			//更新session里面的fileswlist，用于页面更新
			session.setAttribute("fileswlist", swlist);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("上传失败");
		}
		return "studentCourse/File";
	}

}