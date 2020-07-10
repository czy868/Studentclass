package com.bota.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bota.bean.data;
import com.bota.bean.quebank;
import com.bota.bean.squesionbank;
import com.bota.bean.sworklist;
import com.bota.dao.MajorDao;
import com.bota.dao.QuesionDao;
import com.bota.service.QuesionService;
@Service("quesionServiceImpl")
public class QuesionServiceImpl implements QuesionService{
	@Resource
	private QuesionDao quesionDao;
	
	
	@Override
	public List<sworklist> selectworklist(String studentid,int indentfy) {
		
		sworklist s=new sworklist();
		s.setStudentid(studentid);
		s.setIndentfy(indentfy);
		List<sworklist> swlist = quesionDao.selectworklist(s);
		System.out.println("可以返回");
		System.out.println(swlist.get(0).getTeacher());
		return swlist;
	}
	
	@Override
	public List<quebank> selectquebank(String courseNumber){
		List<quebank> quebanklist = quesionDao.selectquebank(courseNumber);
		List<quebank> quebanklist1 = new ArrayList<quebank>();
		int m=quebanklist.size();
		Random r = new Random();
		int num[] = new int[1000];
		System.out.println("可以执行"+m);
		for(int i=0;i<10;i++)
		{
			int r1 = r.nextInt(m);
//			System.out.println("m=="+m);
//			System.out.println("quebanklist.get(m)"+quebanklist.get(m).getQuesion());
//			int n=r1%m;
			quebanklist1.add(i,quebanklist.get(r1));
		}
		System.out.println("List接受成功");
		return quebanklist1;
	}
	@Override
	public void exahomework(squesionbank s,int num) {
		quesionDao.exahomework(s);
		System.out.println("学生作业提交完成");
		sworklist swlist = new sworklist();
		swlist.setCourseNumber(s.getCourseNumber());
		swlist.setWorkid(s.getWorkid());
		swlist.setStudentid(s.getStudentid());
		swlist.setStatus(1);
		swlist.setGrade(num);
		quesionDao.updataswlist(swlist);
		System.out.println("学生作业状态更新完成");
	}
	@Override
	public List<squesionbank> selectxq(String studentid,String courseNumber,int workid)
	{
		squesionbank s = new squesionbank();
		s.setStudentid(studentid);
		s.setCourseNumber(courseNumber);
		s.setWorkid(workid);
		List<squesionbank> selectxqlist=quesionDao.selectxq(s);
		return selectxqlist;
	}
	public void updatestatus(sworklist s) {
		quesionDao.updatestatus(s);
	}
	public void tjurl(data d) {
		quesionDao.tjurl(d);
	}
}
