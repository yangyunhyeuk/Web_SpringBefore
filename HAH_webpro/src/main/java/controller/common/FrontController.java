package controller.common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.ActionForward;
import controller.action.MainAction;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("get 확인");
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("post 확인");
		doAction(request, response);

	}

	private void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1) 사용자의 요청을 분석
		String uri = request.getRequestURI();
		String cp = request.getContextPath();
		String action = uri.substring(cp.length());
		System.out.println(action);
		ActionForward forward = null;
		// 2) 컨트롤러랑 매핑
		if (action.equals("/main.do")) {
			forward = new MainAction().execute(request, response);
		}

		else {
			// 에러페이지 연결
			forward = new ActionForward();
			forward.setRedirect(false); // true인 경우는 데이터가 정말 없는 경우!
			forward.setPath("/error/error404.jsp");
		}

		// history go back을 위해 forward가 null이 아닐 때만 수행하게 다음과 같이 조건문을 만든다!!
		// 페이지로 이동하는 게 아닌 경우 null이 발생하기에 다음의 조건을 걸어준다.
		if (forward != null) {
			// 3) 사용자에게 결과화면 출력
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}
