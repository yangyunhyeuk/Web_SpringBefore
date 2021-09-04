package model.message;

import java.sql.Date;

public class MessageVO {
	int mnum; // 작성 순서, pk
	String mid; // 작성자 id
	String writer; // 작성자
	String title; // 작성 제목
	String content; // 작성 내용

	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "MessageVO [mnum=" + mnum + ", mid=" + mid + ", writer=" + writer + ", title=" + title + ", content="
				+ content + "]";
	}



	
}