package controller.action;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.board.BoardVO;
import model.page.Paging;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// =====================================================================================================================
		ActionForward forward = new ActionForward();

		System.out.println("메인액션 입장");

		BoardDAO bDAO = new BoardDAO();
		int totalCount = bDAO.getTotalCount("STUDYBOARD");
		// select count(*) from message로 메시지 테이블 인스턴스 개수를 초기화한다.

		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		// page가 null이면 1로 초기화하여 사용한다.
		// page가 null이 아니면 받아온 page 파라미터값을 사용한다.

		System.out.println("BoardAction에서의 page :" + page);

		Paging paging = new Paging();
		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setTotalCount(totalCount);
		/*
		 * 변수 초기화 + 페이징 생성함수를 초기화 수행 public void setTotalCount(int totalCount) {
		 * this.totalCount = totalCount; this.makePaging(); }
		 * 
		 */

		page = ((page - 1) * 10) + 1; // select해오는 기준을 구한다 : 1, 11, 21, 31...
		paging.setPageSize(page + 9); // 한페이지에 불러낼 게시물의 개수 지정 : 각 블럭 당 10개의 게시글
		// System.out.println("select해오는 기준 : " + page);
		ArrayList<BoardVO> list = bDAO.getList(page, paging.getPageSize(), "STUDYBOARD");
		// System.out.println("main 액션에서의 list : " + list);
		request.setAttribute("list", list); // dao를 통해 가져온 게시글 세팅
		request.setAttribute("paging", paging); // paging 객체 세팅

		forward.setRedirect(false);
		forward.setPath("main.jsp");
		// 페이지 전달방식과 경로를 세팅하려고 만든것이다.!
		System.out.println("메인액션 퇴장");

		return forward;

	}

}
