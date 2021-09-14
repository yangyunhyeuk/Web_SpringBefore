package model.msg;

import java.util.ArrayList;

public class MsgSet {
	// MessageVO타입의 댓글 담을 공간
	private MessageVO m;
	
	// ReplyVO 제네릭의 배열리스트 타입의 대댓글을 담을 공간
	private ArrayList<ReplyVO> rlist=new ArrayList<ReplyVO>();
	
	
	public MessageVO getM() {
		return m;
	}
	public void setM(MessageVO m) {
		this.m = m;
	}
	
	
	public ArrayList<ReplyVO> getRlist() {
		return rlist;
	}
	public void setRlist(ArrayList<ReplyVO> rlist) {
		this.rlist = rlist;
	}
	
	
	@Override
	public String toString() {
		return "MsgSet [m=" + m + ", rlist=" + rlist + "]";
	}
}
