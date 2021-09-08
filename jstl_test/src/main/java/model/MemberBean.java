package model;

public class MemberBean {

	private String uid = "yang";
	private String upw = "7777";

	public String getUid() {
		return uid;
	}

	public String getUpw() {
		return upw;
	}

	public String Check(String id, String pw) {

		if (uid.equals(id) && upw.equals(pw)) {
			return "로그인 성공!!";
		}
		else {
			return "로그인 실패ㅠㅠ";
		}

	}

}
