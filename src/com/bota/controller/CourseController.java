package com.bota.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bota.bean.Course;
import com.bota.bean.comment;
import com.bota.bean.data;
import com.bota.bean.reply;
import com.bota.bean.squesionbank;
import com.bota.bean.swords;
import com.bota.service.CourseService;
import com.bota.service.MajorService;
import com.bota.service.TeacherCourseService;
import com.bota.service.UserService;
import com.bota.util.DateStrConvert;

/**
 * 
 * @author bota
 */
@Controller
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private MajorService majorService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private TeacherCourseService teacherCourseService;
	
	/**
	 * 添加课程
	 */
	@RequestMapping("addCourse")
	@ResponseBody
	public boolean addCourse(Course course,String createTime){
		Date date = DateStrConvert.strToDate(createTime, "yyyy-MM-dd");
		course.setCreatetime(date);
		course.setNumberspace(course.getNumberlimit());
		System.out.println(course);
		return courseService.addCourse(course);
	}
	

	/**
	 * 添加课程页面
	 * @return
	 */
	@RequestMapping("addCoursePage")
	public String addCoursePage(HttpServletRequest request){
		List<Map<String, Object>> teacherMap = userService.selectAllUserByIdentity(1);//1代表老师的角色
		List<Map<String, Object>> majorMap = majorService.selectAllMajor();
		request.setAttribute("teachers", teacherMap);
		request.setAttribute("majors", majorMap);
		return "course/addCourse";
	}
	
	
	/***
	 * 修改课程页面
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("editCoursePage")
	public String editCoursePage(long id,HttpServletRequest request){
		Course course = courseService.selectOne(id);
		List<Map<String, Object>> teacherMap = userService.selectAllUserByIdentity(1);//1代表老师的角色
		List<Map<String, Object>> majorMap = majorService.selectAllMajor();
		request.setAttribute("teachers", teacherMap);
		request.setAttribute("majors", majorMap);
		request.setAttribute("course", course);
		return "course/editCourse";
	}
	
	/**
	 * 查询所有的课程
	 * @return
	 */
	@RequestMapping("courseList")
	@ResponseBody
	public List<Map<String, Object>> selectAllCourse(){
		return courseService.selectAllCourse();
	}
	
	/**
	 * 分页查询所有的课程
	 * @return
	 */
	
	@RequestMapping("courseListBySearch")
	public ModelAndView selectAllCourses(int pageNum,int pageSize,long teacherId,String search, long specialtyId){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if(teacherId != -1){
			paramMap.put("teacherId", teacherId);
		}
		if(specialtyId != -1){
			paramMap.put("specialtyId", specialtyId);
		}
		paramMap.put("search", search);
		ModelAndView model = new ModelAndView();
		Map<String, Object> map = courseService.selectAllCourse(pageNum,pageSize,paramMap);
		model.addObject("courses", map.get("listMap"));
		model.addObject("teachers", userService.selectAllUserByIdentity(1));//1代表老师角色
		model.addObject("majors", majorService.selectAllMajor());
		
		if(map.get("count") != null){
			int count = Integer.parseInt(map.get("count").toString());
			int totalPage  = 0;
			if(count % 5 != 0 ){
				totalPage =count/5 + 1; 
			}else{
				totalPage =count/5;
			}
			model.addObject("count", count);
			model.addObject("totalPage", totalPage);
		}
		model.addObject("pageNum", pageNum);
		if(paramMap != null){
			model.addObject("search", paramMap.get("search"));
			model.addObject("teacherId", paramMap.get("teacherId"));
			model.addObject("specialtyId", paramMap.get("specialtyId"));
		}
		model.setViewName("course/course");
		return model;
	}
	
	/**
	 * 查询老师的课程
	 * @param pageNum
	 * @param pageSize
	 * @param teacherId
	 * @param request
	 * @return
	 */
	@RequestMapping("courseListByTeacher")
	public String selectAllCourseByTeacher(int pageNum,int pageSize,String teacherId,HttpServletRequest request){
		Map<String, Object> paramMap = null;
		paramMap = new HashMap<String, Object>();
		paramMap.put("teacherId",teacherId);
		
		Map<String, Object> map = courseService.selectAllCourseByTeacher(pageNum,pageSize,paramMap);
		List<Map<String, Object>> teacherMap = userService.selectAllUserByIdentity(1);//1代表老师的角色
		List<Map<String, Object>> majorMap = majorService.selectAllMajor();
		request.setAttribute("courses", map.get("listMap"));
		request.setAttribute("teachers", teacherMap);
		request.setAttribute("majors", majorMap);
		
		if(map.get("count") != null){
			int count = Integer.parseInt(map.get("count").toString());
			int totalPage  = 0;
			if(count % 5 != 0 ){
				totalPage =count/5 + 1; 
			}else{
				totalPage =count/5;
			}
			request.setAttribute("count",count);
			request.setAttribute("totalPage",totalPage);
		}
		request.setAttribute("pageNum",pageNum);
		return "course/course";
	}
	
	
	
	@RequestMapping("courseListByPage")
	public String selectAllCourse(int pageNum,int pageSize,HttpServletRequest request){
		Map<String, Object> paramMap = null;
		Map<String, Object> map = courseService.selectAllCourse(pageNum,pageSize,paramMap);
		List<Map<String, Object>> teacherMap = userService.selectAllUserByIdentity(1);//1代表老师的角色
		List<Map<String, Object>> majorMap = majorService.selectAllMajor();
		request.setAttribute("courses", map.get("listMap"));
		request.setAttribute("teachers", teacherMap);
		request.setAttribute("majors", majorMap);
		
		if(map.get("count") != null){
			int count = Integer.parseInt(map.get("count").toString());
			int totalPage  = 0;
			if(count % 5 != 0 ){
				totalPage =count/5 + 1; 
			}else{
				totalPage =count/5;
			}
			request.setAttribute("count",count);
			request.setAttribute("totalPage",totalPage);
		}
		request.setAttribute("pageNum",pageNum);
		return "course/course";
	}
	
	/**
	 * 学生页面显示的可以选的课程
	 * @param pageNum
	 * @param pageSize
	 * @param isFinish 0：不可选  1：可选
	 * @param request
	 * @return
	 */
	@RequestMapping("courseListByStudent")
	public String selectAllCourseByStudent(int pageNum,int pageSize,int isFinish,int studentId, HttpServletRequest request){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("isFinish",isFinish);
		paramMap.put("studentId",studentId);
		return commonExecute(pageNum,pageSize,paramMap,request);
	}
	
	public  String commonExecute(int pageNum,int pageSize,Map<String, Object> paramMap,HttpServletRequest request){
		Map<String, Object> map = courseService.selectAllCourseByStudent(pageNum,pageSize,paramMap);
		List<Map<String, Object>> teacherMap = userService.selectAllUserByIdentity(1);//1代表老师的角色
		List<Map<String, Object>> majorMap = majorService.selectAllMajor();
		request.setAttribute("courses", map.get("listMap"));
		request.setAttribute("teachers", teacherMap);
		request.setAttribute("majors", majorMap);
		
		if(map.get("count") != null){
			int count = Integer.parseInt(map.get("count").toString());
			int totalPage  = 0;
			if(count % 5 != 0 ){
				totalPage =count/5 + 1; 
			}else{
				totalPage =count/5;
			}
			request.setAttribute("count",count);
			request.setAttribute("totalPage",totalPage);
		}
		request.setAttribute("pageNum",pageNum);
		return "course/course";
	}
	
	/**
	 * 根据id查询课程
	 * @param id
	 * @return
	 */
	@RequestMapping("selectCourse")
	@ResponseBody
	public Course selectOne(long id){
		return courseService.selectOne(id);
	}
	
	/**
	 * 修改课程的信息
	 * @param Course
	 * @return
	 */
	@RequestMapping("editCourse")
	@ResponseBody
	public boolean updateById(Course course, String createTime,HttpSession session){
		Date date = DateStrConvert.strToDate(createTime, "yyyy-MM-dd");
		course.setCreatetime(date);
		@SuppressWarnings("unchecked")
		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("user");
		if(userMap.get("identity").equals(1)){
			courseService.updateCourse(course);//需要修改teacherCourse表
		}
		return courseService.updateById(course);
	}
	
	
	/**
	 * 修改课程的可选状态
	 * @param Course
	 * @return
	 */
	@RequestMapping("editStatus")
	@ResponseBody
	public boolean editStatus(Course course){
		return courseService.updateById(course);
	}
	
	/**
	 * 根据id删除课程
	 * 
	 */
	@RequestMapping("deleteCourse")
	@ResponseBody
	public boolean deleteById(long id){
		return courseService.deleteById(id);
	}
	
	/**
	 * 根据ids批量删除课程
	 * 
	 */
	@RequestMapping("deleteManyCourses")
	@ResponseBody
	public boolean deleteById(String ids){
		return courseService.deleteByIds(ids);
	}
	/**
	 * 
	 * @param request
	 * @param courseNumber
	 * @param session
	 * @return
	 */
	@RequestMapping("forum")
	public String intoforum(HttpServletRequest request,String courseNumber,HttpSession session) {
		//获取课程id
		List<comment> commentlist = courseService.intoforum(courseNumber);
		//把课程id放进session里面是为了后买你在回复哪里可以再调出来用
		session.setAttribute("commentcourseNumber", courseNumber);
		//通过课程id在数据库里面插叙到相应的评论后，存到commnetlist里面，在存进request里面留着待会跳到评论页面时候显示评论用。
		request.setAttribute("commentlist",commentlist);
		//有评论九幽回复，所以也要把回复业搜出来，留着在comment.jsp页面使用
		List<reply> replylist = courseService.selectreply(courseNumber);
		session.setAttribute("replylist", replylist);
		return "course/comment";
	}
	/**
	 * 根据id--评论
	 * @param comment
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("tjcomment")
	@ResponseBody
	public boolean tjcomment(String comment,HttpSession session,HttpServletRequest request) {
		List<swords> slist=courseService.selectwords();
		for(int i=0;i<slist.size();i++)
		{
			System.out.println("评论"+comment+"敏感词"+slist.get(i).getWords());
			if(comment.equals(slist.get(i).getWords())) {
				return false;
			}
			System.out.println("按理不可以执行这个");
		}
		System.out.println(comment);
		//获取课程id
		String courseNumber = (String) session.getAttribute("commentcourseNumber");
		System.out.println("开始提交评论1");
		//获取学生id
		Long usernumber1 = (Long) session.getAttribute("studentId");
		String userNumber = String.valueOf(usernumber1);
		System.out.println("开始提交评论2");
		String createtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		comment c = new comment();
		//c.set就是为了把评论应该有的属性设置好了，再存进数据库
		c.setCourseNumber(courseNumber);
		c.setUserNumber(userNumber);
		c.setContent(comment);
		c.setCreatetime(createtime);
		//开始存评论
		courseService.tjcomment(c);
		List<comment> commentlist = courseService.intoforum(courseNumber);
		session.setAttribute("commentlist",commentlist);
		return true;
		
	}
	/**
	 * 根据id--回复
	 * @param session
	 * @param comment_id
	 * @param userNumber
	 * @param comment
	 * @param reply
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("tjreply")
	@ResponseBody
	public boolean tjreply(HttpSession session,String comment_id,String userNumber,String comment,String reply) throws UnsupportedEncodingException {
		List<swords> slist=courseService.selectwords();
		for(int i=0;i<slist.size();i++)
		{
			System.out.println("评论"+comment+"敏感词"+slist.get(i).getWords());
			if(reply.equals(slist.get(i).getWords())) {
				return false;
			}
			System.out.println("按理不可以执行这个");
		}
		reply r = new reply();
		//comment = URLDecoder.decode(comment,"utf-8");
		r.setComment_id(comment_id);
		r.setCommentuserNumber(userNumber);
		r.setComment(comment);
		r.setReply(reply);
		String courseNumber = (String)session.getAttribute("commentcourseNumber");
		Long usernumber1 = (Long) session.getAttribute("studentId");
		String replyuserNumber = String.valueOf(usernumber1);
		String createtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		r.setCreatetime(createtime);
		r.setReplyuserNumber(replyuserNumber);
		r.setCourseNumber(courseNumber);
		System.out.println("回复课程号和评论id"+courseNumber+comment);
		courseService.tjreply(r);
		List<reply> replylist = courseService.selectreply(courseNumber);
		session.setAttribute("replylist", replylist);
		List<comment> commentlist = courseService.intoforum(courseNumber);
		session.setAttribute("commentlist",commentlist);
		return true;
	}
	/**
	 * 查找资料
	 * @param courseNumber
	 * @param indentfy
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("selectdata")
	public String selectdata(String courseNumber,String indentfy,HttpSession session,HttpServletRequest request){
		System.out.println("查找资料库");
		data d = new data();
		d.setCourseNumber(courseNumber);
		d.setIndentfy(Integer.parseInt(indentfy));
		Long usernumber1 = (Long) session.getAttribute("studentId");
		String studentid = String.valueOf(usernumber1);
		d.setStudentid(studentid);
		List<data> datalist = courseService.selectdata(d);
		request.setAttribute("datalist",datalist);
		return "course/homeworkdatalist";
	}
	/**
	 * 下载资料
	 * @param fileName
	 * @param res
	 * @param req
	 * @throws IOException
	 */
	@RequestMapping("download")
	public void download(String fileName,HttpServletResponse res,HttpServletRequest req) throws IOException{
		//设置响应流中文件进行下载
		System.out.println("开始下载");
		res.setHeader("Content-Disposition", "attachment;filename="+fileName);
		//把二进制流放入到响应体中.
		ServletOutputStream os = res.getOutputStream();
		String path = req.getServletContext().getRealPath("files");
		System.out.println(path);
		File file = new File(path, fileName);
		byte[] bytes = FileUtils.readFileToByteArray(file);
		os.write(bytes);
		os.flush();
		os.close();
	}
	@RequestMapping("deletecomment")
	@ResponseBody
	public boolean deletecomment(String comment_id,HttpSession session,HttpServletRequest request) {
		comment c=new comment();
		c.setId(Integer.parseInt(comment_id));
		courseService.deletecomment(c);
		String courseNumber = (String) session.getAttribute("commentcourseNumber");
		List<comment> commentlist = courseService.intoforum(courseNumber);
		session.setAttribute("commentlist",commentlist);
		return true;
		
	}
}
