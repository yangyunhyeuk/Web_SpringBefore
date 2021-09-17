package model.user;

import java.util.Date;

public class UserVO {
	private String uuid;
	private String name;
	private String passwd;
	private Date udate;

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public Date getUdate() {
		return udate;
	}

	public void setUdate(Date udate) {
		this.udate = udate;
	}

	@Override
	public String toString() {
		return "UserVO [uuid=" + uuid + ", name=" + name + ", passwd=" + passwd + ", udate=" + udate + "]";
	}

}
