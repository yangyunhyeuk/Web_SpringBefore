package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.msg.MessageDAO;
import model.msg.MessageVO;

public class HeartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = null;

		MessageDAO mDAO = new MessageDAO();
		MessageVO mVO = new MessageVO();
		mVO.setMid(Integer.parseInt(request.getParameter("mid")));

		if (mDAO.update(mVO)) {

			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("main.do");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('좋아요 적용 실패!');history.go(-1)</script>");

		}

		return forward;
	}

}
