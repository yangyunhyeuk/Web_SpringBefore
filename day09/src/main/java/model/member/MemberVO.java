package model.member;

public class MemberVO {
	int memnum;
	String mid;
	String mpw;
	public int getMemnum() {
		return memnum;
	}
	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	@Override
	public String toString() {
		return "MemberVO [memnum=" + memnum + ", mid=" + mid + ", mpw=" + mpw + "]";
	}
	
	
	
}
