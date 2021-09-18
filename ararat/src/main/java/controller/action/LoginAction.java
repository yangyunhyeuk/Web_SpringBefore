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

		// 1. 이전 페이지에서 보내주었던 uVO를 만들 수 있는 인자들을 GET해야한다.
		// 2. 로그인 성공여부를 판단한다.
		// 3. 성공했다면 세션에 값을 세팅해주고, 실패 시 스크립트 출력!
		// 기존 포폴의 경우 위3번(세션값 세팅, 스크립트 출력)의 작업을 FOJO(순수자바코드)로
		// 처리하는 데 어려움이 있기에 control.jsp에서 처리하는게 보통인데
		// 우리는 국비취업반이니까 한번 작업해보자!!

		UserDAO uDAO = new UserDAO();
		UserVO uVO = new UserVO();
		// 오지도 않는 인자는 작성하지 않는다
		uVO.setUuid(request.getParameter("uuid"));
		uVO.setPasswd(request.getParameter("passwd"));

		if (uDAO.login(uVO)) {
			// 세션단위를 사용해야할 때 헤더의 데이터를 가져다쓰기위해, 다음의 코드를 꼭 작성해야한다.
			// 사용자의 요청 request 안에 있는 세션값을 가져다 쓰는 과정이다.
			HttpSession session = request.getSession();
			session.setAttribute("seUser", uVO.getUuid());
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("main.do");
			// 최종 목적지는 main.jsp
			// 페이지 전달방식과 경로를 세팅하려고 만든것이다.!

		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 실패!');history.go(-1);</script>");
		}

		return forward;
	}

}
