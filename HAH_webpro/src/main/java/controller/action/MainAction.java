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

		System.out.println("���ξ׼� ����");

		BoardDAO bDAO = new BoardDAO();
		int totalCount = bDAO.getTotalCount("STUDYBOARD");
		// select count(*) from message�� �޽��� ���̺� �ν��Ͻ� ������ �ʱ�ȭ�Ѵ�.

		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		// page�� null�̸� 1�� �ʱ�ȭ�Ͽ� ����Ѵ�.
		// page�� null�� �ƴϸ� �޾ƿ� page �Ķ���Ͱ��� ����Ѵ�.

		System.out.println("BoardAction������ page :" + page);

		Paging paging = new Paging();
		paging.setPageNo(page); // get����� parameter������ ���� page����, ���� ������ ��ȣ
		paging.setTotalCount(totalCount);
		/*
		 * ���� �ʱ�ȭ + ����¡ �����Լ��� �ʱ�ȭ ���� public void setTotalCount(int totalCount) {
		 * this.totalCount = totalCount; this.makePaging(); }
		 * 
		 */

		page = ((page - 1) * 10) + 1; // select�ؿ��� ������ ���Ѵ� : 1, 11, 21, 31...
		paging.setPageSize(page + 9); // ���������� �ҷ��� �Խù��� ���� ���� : �� �� �� 10���� �Խñ�
		// System.out.println("select�ؿ��� ���� : " + page);
		ArrayList<BoardVO> list = bDAO.getList(page, paging.getPageSize(), "STUDYBOARD");
		// System.out.println("main �׼ǿ����� list : " + list);
		request.setAttribute("list", list); // dao�� ���� ������ �Խñ� ����
		request.setAttribute("paging", paging); // paging ��ü ����

		forward.setRedirect(false);
		forward.setPath("main.jsp");
		// ������ ���޹�İ� ��θ� �����Ϸ��� ������̴�.!
		System.out.println("���ξ׼� ����");

		return forward;

	}

}
