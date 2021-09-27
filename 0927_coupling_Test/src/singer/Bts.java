package singer;

public class Bts implements PlaySong {

	@Override
	public void SongPlay() {
		System.out.println("노래가 시작합니다.");
	}

	@Override
	public void Intro() {
		System.out.println("Coldplay,BTS_My Universe");
	}

	@Override
	public void Sing() {
		System.out.println("You, you are My Universe and I just want to put you first");
	}

	@Override
	public void SongEnd() {
		System.out.println("노래가 종료됩니다.");
	}

}
