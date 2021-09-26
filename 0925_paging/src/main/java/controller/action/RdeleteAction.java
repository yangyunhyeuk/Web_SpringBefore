package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.msg.ReplyDAO;
import model.msg.ReplyVO;

public class RdeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = null;

		ReplyDAO rDAO = new ReplyDAO();
		ReplyVO rVO = new ReplyVO();
		rVO.setRid(Integer.parseInt(request.getParameter("rid")));
		rVO.setMid(Integer.parseInt(request.getParameter("mid")));

		if (rDAO.delete(rVO)) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("main.do");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('댓글 삭제 실패!');history.go(-1)</script>");
		}

		return forward;

	}

}
