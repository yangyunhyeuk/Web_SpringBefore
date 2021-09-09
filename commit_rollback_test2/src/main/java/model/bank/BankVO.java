package model.bank;

public class BankVO {
	private int bnum;
	private String bname;
	private int money;
	private int change;
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getChange() {
		return change;
	}
	public void setChange(int change) {
		this.change = change;
	}
	@Override
	public String toString() {
		return "BankVO [bnum=" + bnum + ", bname=" + bname + ", money=" + money + ", change=" + change + "]";
	}
	
	

}
