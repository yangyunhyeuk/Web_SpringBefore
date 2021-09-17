package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

import model.msg.MessageDAO;
import model.msg.MsgSet;
import model.user.UserDAO;
import model.user.UserVO;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = null;

		// 1. ���� ���������� �����־��� uVO�� ���� �� �ִ� ���ڵ��� GET�ؾ��Ѵ�.
		// 2. �α��� �������θ� �Ǵ��Ѵ�.
		// 3. �����ߴٸ� ���ǿ� ���� �������ְ�, ���� �� ��ũ��Ʈ ���!
		// ���� ������ ��� ��3��(���ǰ� ����, ��ũ��Ʈ ���)�� �۾��� FOJO(�����ڹ��ڵ�)��
		// ó���ϴ� �� ������� �ֱ⿡ control.jsp���� ó���ϴ°� �����ε�
		// �츮�� ����������̴ϱ� �ѹ� �۾��غ���!!

		UserDAO uDAO = new UserDAO();
		UserVO uVO = new UserVO();
		// ������ �ʴ� ���ڴ� �ۼ����� �ʴ´�
		uVO.setUuid(request.getParameter("uuid"));
		uVO.setPasswd(request.getParameter("passwd"));

		if (uDAO.login(uVO)) {
			// ���Ǵ����� ����ؾ��� �� ����� �����͸� �����پ�������, ������ �ڵ带 �� �ۼ��ؾ��Ѵ�.
			// ������� ��û request �ȿ� �ִ� ���ǰ��� ������ ���� �����̴�.
			HttpSession session = request.getSession();
			session.setAttribute("seUser", uVO.getUuid());
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("main.do");
			// ���� �������� main.jsp
			// ������ ���޹�İ� ��θ� �����Ϸ��� ������̴�.!

		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('�α��� ����!');history.go(-1);</script>");
		}

		return forward;
	}

}
