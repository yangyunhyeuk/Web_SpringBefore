package model.comment;

public class FreeCoVO {
	private int cnum; // CNUM INT PRIMARY KEY, -- ��� ���� ��ȣ
	private String comm; // COMMENT VARCHAR(200) NOT NULL, -- ��� ����
	private String cdate; // CDATE DATE NOT NULL, -- ��� �ۼ� ����
	private int pnum; // PNUM INT NOT NULL, -- �Խñ� ��ȣ
	private String mname; // MNAME VARCHAR(50) NOT NULL, -- ȸ�� �г���
	private String mid; // MID VARCHAR(50) NOT NULL -- ȸ�� ���̵�

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public String getComm() {
		return comm;
	}

	public void setComm(String comm) {
		this.comm = comm;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
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

	@Override
	public String toString() {
		return "FreeCoVO [cnum=" + cnum + ", comm=" + comm + ", cdate=" + cdate + ", pnum=" + pnum + ", mname=" + mname
				+ ", mid=" + mid + "]";
	}

}
