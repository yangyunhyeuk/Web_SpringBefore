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

		System.out.println("메인액션 입장");
		String selUser = request.getParameter("selUser");

		MessageDAO mDAO = new MessageDAO();
		MessageVO mVO = new MessageVO();
		UserDAO uDAO = new UserDAO();
		ArrayList<MsgSet> datas = mDAO.selectAll(selUser, mcnt);
		ArrayList<UserVO> newUsers = uDAO.selectAll();
		System.out.println("메인액션에서 mDAO.Mcount 실행하기 전 selUser 값 확인"+selUser);
		int viewcnt = mDAO.Mcount(selUser);

		System.out.println(viewcnt);

		/* 페이징 프로세스 */
		String mpage = request.getParameter("page");

		int page = 1;
		if (mpage != null) {
			page = Integer.parseInt(mpage);

		}
		System.out.println("MainAction 에서의 페이지 데이터 : " + page);
		System.out.println("MainAction 에서의 viewCnt : " + viewcnt);
		ArrayList<MsgSet> paging = mDAO.mPaging(page);
		request.setAttribute("paging", paging); // 전체 게시글데이터
		request.setAttribute("page", page); // 현재 게시글데이터
		
		
		
		int cntStart = 1;
		int cntEnd = 5;
		if(page/5 >= 1) {
			cntStart += (5*(page%5));
			cntEnd += (5*(page%5));
		}
		request.setAttribute("cntStart", cntStart); 
		request.setAttribute("cntEnd", cntEnd); 
		
		/* 페이징 프로세스 */

		
		
		request.setAttribute("datas", datas); // 전체 게시글데이터
		request.setAttribute("newUsers", newUsers); // 신규 유저
		request.setAttribute("selUser", selUser); // 보고있는 유저
		request.setAttribute("mcnt", mcnt); // 볼 게시글 갯수
		request.setAttribute("viewcnt", viewcnt); // 가져온 게시글 갯수
		System.out.println("메인액션 퇴장 직전 datas 값"+datas);

		forward.setRedirect(false);
		forward.setPath("main.jsp");
		// 페이지 전달방식과 경로를 세팅하려고 만든것이다.!
		System.out.println("메인액션 퇴장");

		return forward;

	}

}
