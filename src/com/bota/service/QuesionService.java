package com.bota.service;

import java.util.List;


import org.springframework.ui.Model;

import com.bota.bean.sworklist;
import com.bota.bean.data;
import com.bota.bean.quebank;
import com.bota.bean.squesionbank;

public interface QuesionService {
	
	public List<sworklist> selectworklist(String studentid,int indentfy);
	public List<quebank> selectquebank(String courseNumber);
	public void exahomework(squesionbank s,int num);
	public List<squesionbank> selectxq(String studentid,String courseNumber,int workid);
	public void updatestatus(sworklist s);
	public void tjurl(data d);
}
