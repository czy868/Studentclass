package com.bota.service;

import java.util.List;
import java.util.Map;

import com.bota.bean.Course;
import com.bota.bean.comment;
import com.bota.bean.data;
import com.bota.bean.reply;
import com.bota.bean.swords;

public interface CourseService {
	/**
	 * 根据课程号查询该课程是否存在
	 * @author bota
	 * @param courseNumber
	 * @return
	 */
	public String selectCourseByCourseNumber(long courseNumber);
	
	/**
	 * 修改课程信息
	 */
	public boolean updateCourseById(Course course);
	
	/**
	 * 添加课程
	 * @param course 课程实体
	 * @return
	 */
	public boolean addCourse(Course course);
	
	/**
	 * 查询所有的课程
	 * @return
	 */
	public List<Map<String, Object>> selectAllCourse();
	
	/**
	 * 分页查询所有的课程
	 * @return
	 */
	public Map<String, Object> selectAllCourse(int pageNum,int pageSize,Map<String, Object> paramMap);
	
	/**
	 * 查询课程的数量
	 * @return 
	 */
	Map<String, Object> selectCourseNumber();
	
	
	/**
	 * 根据老师id查询课程
	 * @param id
	 * @return
	 */
	public List<Map<String, Object>> selectCourseByTeacherId(long teacherId);
	
	/**
	 * 根据id查询课程
	 * @param id
	 * @return
	 */
	public Course selectOne(long id);
	/**
	 * 修改课程的信息
	 * @param course
	 * @return
	 */
	public boolean updateById(Course course);
	/**
	 * 根据id删除课程
	 * @param id
	 * @return
	 */
	public boolean deleteById(long id);

	/**
	 * 根据id批量删除课程
	 * @param ids
	 * @return
	 */
	public boolean deleteByIds(String id);

	/**
	 * 老师查询课程
	 * @param pageNum
	 * @param pageSize
	 * @param paramMap
	 * @return
	 */
	public Map<String, Object> selectAllCourseByTeacher(int pageNum, int pageSize, Map<String, Object> paramMap);

	/**
	 * 学生查询课程
	 * @param pageNum
	 * @param pageSize
	 * @param paramMap
	 * @return
	 */
	Map<String, Object> selectAllCourseByStudent(int pageNum, int pageSize, Map<String, Object> paramMap);

	/**
	 * 老师申请修改课程
	 * @param course
	 */
	public boolean updateCourse(Course course);
	/**
	 * 评论区
	 * @param courseNumber
	 * @return
	 */
	public List<comment> intoforum(String courseNumber);
	/**
	 * 评论
	 * @param c
	 */
	public void tjcomment(comment c);
	/**
	 * 回复
	 * @param r
	 */
	public void tjreply(reply r);
	/**
	 * 显示回复
	 * @param courseNumber
	 * @return
	 */
	public List<reply> selectreply(String courseNumber);
	/**
	 * 显示资料
	 * @param d
	 * @return
	 */
	public List<data> selectdata(data d);
	/**
	 * 敏感词筛选
	 * @return
	 */
	public List<swords> selectwords();
	/**
	 * 
	 * @param c
	 */
	public void deletecomment(comment c);
}
