package com.bota.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bota.bean.Course;
import com.bota.bean.comment;
import com.bota.bean.data;
import com.bota.bean.reply;
import com.bota.bean.swords;
import com.bota.dao.CourseDao;
import com.bota.dao.TeacherCourseDao;
import com.bota.service.CourseService;

@Service("courseServiceImpl")
public class CourseServiceImpl implements CourseService{

	@Resource
	private CourseDao courseDaoImpl;
	
	@Resource
	private CourseDao courseDao;
	
	@Resource
	private TeacherCourseDao teacherCourseDaoImpl;
	

	@Override
	public String selectCourseByCourseNumber(long CourseNumber) {
		return courseDaoImpl.selectCourseByCourseNumber(CourseNumber);
	}


	@Override
	public boolean updateCourseById(Course course) {
		return courseDao.updateByPrimaryKeySelective(course) > 0;
	}
	
	@Override
	public boolean addCourse(Course course){
		return courseDao.insertSelective(course) > 0;
				
	}
	
	
	/**
	 * 查询所有的课程
	 * @return
	 */
	@Override
	public List<Map<String, Object>> selectAllCourse(){
		return courseDaoImpl.selectAllCourse();
	}
	
	/**
	 * 分页查询所有的课程
	 * @return
	 */
	@Override
	public Map<String, Object> selectAllCourse(int pageNum,int pageSize,Map<String, Object> paramMap){
		StringBuffer whereSql = new StringBuffer(" where 1=1 ");
		if(paramMap != null && paramMap.size() > 0){
			if(paramMap.get("search") != null && !paramMap.get("search").equals("")){
				whereSql.append(" and (u.username like'%"+paramMap.get("search").toString()+"%' "
						+ " or c.name like'%"+paramMap.get("search").toString()+"%' or c.courseNumber like'%"+paramMap.get("search").toString()+"%') ");
			}
			if(paramMap.get("teacherId") != null &&!paramMap.get("teacherId").equals("") &&  !paramMap.get("teacherId").equals("-1")){
				whereSql.append(" and c.teacherId = " + paramMap.get("teacherId").toString());
			}
			if(paramMap.get("specialtyId") != null && !paramMap.get("specialtyId").equals("") && !paramMap.get("specialtyId").equals("-1")){
				whereSql.append(" and c.specialtyId="+paramMap.get("specialtyId").toString());
			}
		}
		return courseDaoImpl.selectAllCourse(pageNum,pageSize,whereSql.toString());
	}
	
	
	/**
	 * 分页查询所有的课程
	 * @return
	 */
	@Override
	public Map<String, Object> selectAllCourseByStudent(int pageNum,int pageSize,Map<String, Object> paramMap){
		StringBuffer whereSql = new StringBuffer(" where 1=1 ");
		if(paramMap != null && paramMap.size() > 0){
			
			if(paramMap.get("isFinish") != null && !paramMap.get("isFinish").equals("") && !paramMap.get("isFinish").equals("-1")){
				whereSql.append(" and c.isFinish="+paramMap.get("isFinish").toString());
			}
			System.out.println(whereSql);
		}
		return courseDaoImpl.selectAllCourseByStudent(pageNum,pageSize,whereSql.toString(),paramMap.get("studentId").toString());
	}
	
	
	
	/**
	 * 分页查询所有的课程
	 * @return
	 */
	@Override
	public Map<String, Object> selectAllCourseByTeacher(int pageNum,int pageSize,Map<String, Object> paramMap){
		StringBuffer whereSql = new StringBuffer(" where 1=1 ");
		if(paramMap != null && paramMap.size() > 0){
			if(paramMap.get("search") != null && !paramMap.get("search").equals("")){
				whereSql.append(" and (u.username like'%"+paramMap.get("search").toString()+"%' "
						+ " or c.name like'%"+paramMap.get("search").toString()+"%' or c.courseNumber like'%"+paramMap.get("search").toString()+"%') ");
			}
			if(paramMap.get("teacherId") != null &&!paramMap.get("teacherId").equals("") &&  !paramMap.get("teacherId").equals("-1")){
				whereSql.append(" and c.teacherId = " + paramMap.get("teacherId").toString());
			}
			System.out.println(whereSql);
		}
		return courseDaoImpl.selectAllCourse(pageNum,pageSize,whereSql.toString());
	}
	
	/**
	 * 查询课程的数量
	 * @return 
	 */
	@Override
	public Map<String, Object> selectCourseNumber(){
		return courseDaoImpl.selectCourseNumber();
	}
	
	/**
	 * 根据id查询课程
	 * @param id
	 * @return
	 */
	@Override
	public Course selectOne(long id){
		return courseDao.selectByPrimaryKey(id);
	}
	/**
	 * 修改课程的信息
	 * @param Course
	 * @return
	 */
	@Override
	public boolean updateById(Course course){
		return courseDao.updateByPrimaryKeySelective(course) > 0;
	}
	/**
	 * 根据id删除课程
	 * @param id
	 * @return
	 */
	@Override
	public boolean deleteById(long id){
		return courseDao.deleteByPrimaryKey(id) > 0;
	}
	
	/**
	 * 根据id删除课程
	 * @param id
	 * @return
	 */
	@Override
	public boolean deleteByIds(String ids){
		return courseDao.deleteByPrimaryKeys(ids);
	}

	/**
	 * 
	 */
	@Override
	public List<Map<String, Object>> selectCourseByTeacherId(long teacherId) {
		return courseDaoImpl.selectCourseByTeacherId(teacherId);
	}

	/**
	 * 
	 */
	@Override
	@Transactional
	public boolean updateCourse(Course course) {
		if(teacherCourseDaoImpl.updateOneByCourseId(course.getId(), 2)){
			return courseDao.updateByPrimaryKeySelective(course) > 0;
		}
		return  false;
	}
	
	@Override
	public List<comment> intoforum(String courseNumber){
		comment c = new comment();
		c.setCourseNumber(courseNumber);
		List<comment> commentlist = courseDao.intoforum(c);
		return commentlist;
	}
	@Override
	public void tjcomment(comment c) {
		courseDao.tjcomment(c);
	}
	@Override
	public void tjreply(reply r) {
		courseDao.tjreply(r);
	}
	@Override
	public List<reply> selectreply(String courseNumber){
		reply r = new reply();
		r.setCourseNumber(courseNumber);
		List<reply> replylist = courseDao.selectreply(r);
		return replylist;
	}
	/**
	 * 
	 */
	@Override
	public List<data> selectdata(data d){
		List<data> datalist=courseDao.selectdata(d);
		return datalist;
	}
	@Override
	public List<swords> selectwords(){
		return courseDao.selectwords();
		
	}
	@Override
	public void deletecomment(comment c) {
		courseDao.deletecomment(c);
	}
}
