package singer;

public class BlackPink implements PlaySong {

	@Override
	public void SongPlay() {
		System.out.println("�뷡�� �����մϴ�.");
	}

	@Override
	public void Intro() {
		System.out.println("BLACKPINK_How You Like That");
	}

	@Override
	public void Sing() {
		System.out.println("BLACKPINK in your area");
	}

	@Override
	public void SongEnd() {
		System.out.println("�뷡�� ����˴ϴ�.");
	}

}
