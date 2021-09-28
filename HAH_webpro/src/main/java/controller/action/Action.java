package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;
	
	// 위에서 접근지정자 public이 없는 이유 : "인터페이스잖아요!", 위의 메서드 execute가 인터페이스 메서드인데
	// 인터페이스내 메서드의 경우 접근지정자가 abstract public이 default값이다!
	
	
}
