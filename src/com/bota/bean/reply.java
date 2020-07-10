package com.bota.bean;

public class reply {

	private int id;
	private String comment_id;
	private String commentuserNumber;
	private String replyuserNumber;
	private String comment;
	private String reply;
	private String createtime;	
	private String courseNumber;
	public String getCourseNumber() {
		return courseNumber;
	}
	public void setCourseNumber(String courseNumber) {
		this.courseNumber = courseNumber;
	}
	public String getCommentuserNumber() {
		return commentuserNumber;
	}
	public void setCommentuserNumber(String commentuserNumber) {
		this.commentuserNumber = commentuserNumber;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getReplyuserNumber() {
		return replyuserNumber;
	}
	public void setReplyuserNumber(String replyuserNumber) {
		this.replyuserNumber = replyuserNumber;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	
}
