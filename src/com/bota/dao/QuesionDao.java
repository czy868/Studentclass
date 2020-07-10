package com.bota.dao;

import java.util.List;

import com.bota.bean.data;
import com.bota.bean.quebank;
import com.bota.bean.squesionbank;
import com.bota.bean.sworklist;
public interface QuesionDao {
	
	public List<sworklist> selectworklist(sworklist s);
	public List<quebank> selectquebank(String coursename);
	public int exahomework(squesionbank s);
	public int updataswlist(sworklist s);
	public List<squesionbank> selectxq(squesionbank s);
	public void updatestatus(sworklist s);
	public void tjurl(data d);
}
