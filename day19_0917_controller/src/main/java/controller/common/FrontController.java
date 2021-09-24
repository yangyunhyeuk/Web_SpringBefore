package controller.common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.ActionForward;
import controller.action.HeartAction;
import controller.action.InsertAction;
import controller.action.LoginAction;
import controller.action.LogoutAction;
import controller.action.MainAction;
import controller.action.MdeleteAction;
import controller.action.MinsertAction;
import controller.action.RdeleteAction;
import controller.action.RinsertAction;

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
		System.out.println("get Ȯ��");
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("post Ȯ��");
		doAction(request, response);

	}

	private void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1) ������� ��û�� �м�
		String uri = request.getRequestURI();
		String cp = request.getContextPath();
		String action = uri.substring(cp.length());
		System.out.println(action);
		ActionForward forward = null;
		// 2) ��Ʈ�ѷ��� ����
		if (action.equals("/main.do")) {
			forward = new MainAction().execute(request, response);
		} else if (action.equals("/login.do")) {
			// ó���ؾ��ϴ� ���μ����� LoginAction ���Ͽ��� ó��!
			forward = new LoginAction().execute(request, response);
		} else if (action.equals("/logout.do")) {
			forward = new LogoutAction().execute(request, response);
		} else if (action.equals("/insert.do")) {
			forward = new InsertAction().execute(request, response);
		} else if (action.equals("/haction.do")) {
			forward = new HeartAction().execute(request, response);
		} else if (action.equals("/mdelete.do")) {
			forward = new MdeleteAction().execute(request, response);
		} else if (action.equals("/rdelete.do")) {
			forward = new RdeleteAction().execute(request, response);
		} else if (action.equals("/minsert.do")) {
			forward = new MinsertAction().execute(request, response);
		} else if (action.equals("/rinsert.do")) {
			forward = new RinsertAction().execute(request, response);
		}

		else {
			// ���������� ����
			forward = new ActionForward();
			forward.setRedirect(false); // true�� ���� �����Ͱ� ���� ���� ���!
			forward.setPath("/error/error404.jsp");
		}

		// history go back�� ���� forward�� null�� �ƴ� ���� �����ϰ� ������ ���� ���ǹ��� �����!!
		// �������� �̵��ϴ� �� �ƴ� ��� null�� �߻��ϱ⿡ ������ ������ �ɾ��ش�.
		if (forward != null) {
			// 3) ����ڿ��� ���ȭ�� ���
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}
