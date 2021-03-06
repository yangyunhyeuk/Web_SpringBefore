package controller.action;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.msg.MessageDAO;
import model.msg.MessageVO;
import model.msg.MsgSet;
import model.user.UserDAO;
import model.user.UserVO;

public class MainAction implements Action {

	// 상속관계에서 자식의 접근지정자 범위가 부모보다 넓거나 일치해야하는데
	// 부모가 public이라서 private을 쓰지 않는 것이다!
	// 부모가 public인데 어찌 자식이 public이 아닐 수 있겠소!?
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = new ActionForward();

		String mcntt = request.getParameter("mcnt");
		int mcnt = 3;
		if (mcntt != null) {
			mcnt = Integer.parseInt(mcntt);
		}

		String selUser = request.getParameter("selUser");

		MessageDAO mDAO = new MessageDAO();
		MessageVO mVO = new MessageVO();
		UserDAO uDAO = new UserDAO();
		ArrayList<MsgSet> datas = mDAO.selectAll(selUser, mcnt);
		ArrayList<UserVO> newUsers = uDAO.selectAll();

		int viewcnt = mDAO.Mcount(selUser);

		System.out.println(viewcnt);

		request.setAttribute("datas", datas); // 전체 게시글데이터
		request.setAttribute("newUsers", newUsers); // 신규 유저
		request.setAttribute("selUser", selUser); // 보고있는 유저
		request.setAttribute("mcnt", mcnt); // 볼 게시글 갯수
		request.setAttribute("viewcnt", viewcnt); // 가져온 게시글 갯수

		forward.setRedirect(false);
		forward.setPath("main.jsp");
		// 페이지 전달방식과 경로를 세팅하려고 만든것이다.!

		return forward;

	}

}
