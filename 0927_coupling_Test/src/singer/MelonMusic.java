package singer;

public class MelonMusic {
	public static void main(String[] args) {

		BeanFactory factory = new BeanFactory();

		// factory.getBean()�� ��ȯ�� ������Ʈ�� ����ȯ�� ���ش�.
		// PlaySong play = (PlaySong) factory.getBean("blink");
		// PlaySong play = (PlaySong) factory.getBean("bts");
		PlaySong play = (PlaySong) factory.getBean(args[0]);

		play.SongPlay();
		play.Intro();
		play.Sing();
		play.SongEnd();

	}
}
