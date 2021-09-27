package singer;

public class BeanFactory {
	public Object getBean(String beanName) {
		if (beanName.equals("blink")) {
			return new BlackPink();
		} else if (beanName.equals("bts")) {
			return new Bts();
		}
		return null;
	}
}
