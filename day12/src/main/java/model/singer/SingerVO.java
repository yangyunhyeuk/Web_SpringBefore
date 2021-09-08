package model.singer;

public class SingerVO {
	private int snum;
	private String name;
	private int age;
	private String song;

	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getSong() {
		return song;
	}

	public void setSong(String song) {
		this.song = song;
	}

	@Override
	public String toString() {
		return "SingerVO [snum=" + snum + ", name=" + name + ", age=" + age + ", song=" + song + "]";
	}

}
