package controller.action;

// 1. 페이지 전달방식 
// 2. 경로 지정

// 자료형 격 클래스 파일
// 페이지를 전달할 수 있는 자료형 격이라 할 수 있다. 
public class ActionForward {
	private boolean redirect;
	private String path;

	public boolean isRedirect() {
		return redirect;
	}

	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
