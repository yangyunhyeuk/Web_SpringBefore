package model.msg;

import java.util.Date;

public class ReplyVO {
	private int rid;
	private int mid;
	private String uuid;
	private Date udate;
	private String rmsg;

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Date getUdate() {
		return udate;
	}

	public void setUdate(Date udate) {
		this.udate = udate;
	}

	public String getRmsg() {
		return rmsg;
	}

	public void setRmsg(String rmsg) {
		this.rmsg = rmsg;
	}

	@Override
	public String toString() {
		return "ReplyVO [rid=" + rid + ", mid=" + mid + ", uuid=" + uuid + ", udate=" + udate + ", rmsg=" + rmsg + "]";
	}

}
