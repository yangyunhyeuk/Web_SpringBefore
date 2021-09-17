package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user.UserDAO;
import model.user.UserVO;

public class InsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserDAO uDAO = new UserDAO();
		UserVO uVO = new UserVO();
		// ������ �ʴ� ���ڴ� �ۼ����� �ʴ´�
		uVO.setUuid(request.getParameter("uuid"));
		uVO.setName(request.getParameter("name"));
		uVO.setPasswd(request.getParameter("passwd"));

		if (uDAO.insert(uVO)) {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('ȸ������ �Ϸ�!');window.close();</script>");

		} else {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('ȸ������ ����!');history.go(-1)</script>");
		}

		return null;
	}

}
