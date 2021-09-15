package model.msg;

import java.util.Date;

public class MessageVO {
	private int mid;
	private String uuid;
	private String msg;
	private int favcount;
	private int replycount;
	private Date udate;

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

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getFavcount() {
		return favcount;
	}

	public void setFavcount(int favcount) {
		this.favcount = favcount;
	}

	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}

	public Date getUdate() {
		return udate;
	}

	public void setUdate(Date udate) {
		this.udate = udate;
	}

	@Override
	public String toString() {
		return "MessageVO [mid=" + mid + ", uuid=" + uuid + ", msg=" + msg + ", favcount=" + favcount + ", replycount="
				+ replycount + ", udate=" + udate + "]";
	}

}
