package day14;

public class CoffeeVO {
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "CoffeVO [name=" + name + "]";
	}

	public CoffeeVO(String name) {
		this.name = name;

	}
}
