package model.board;

import java.util.Date;

public class BoardVO {
	private int pnum;
	private String ptitle;
	private String pcontent;
	private Date pdate;
	private String mname;
	private String mid;
	private int cnt;
	private String category;

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "StudyBoardVO [pnum=" + pnum + ", ptitle=" + ptitle + ", pcontent=" + pcontent + ", pdate=" + pdate
				+ ", mname=" + mname + ", mid=" + mid + ", cnt=" + cnt + ", category=" + category + "]";
	}

}
