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

	// ��Ӱ��迡�� �ڽ��� ���������� ������ �θ𺸴� �аų� ��ġ�ؾ��ϴµ�
	// �θ� public�̶� private�� ���� �ʴ� ���̴�!
	// �θ� public�ε� ���� �ڽ��� public�� �ƴ� �� �ְڼ�!?
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = new ActionForward();

		String mcntt = request.getParameter("mcnt");
		int mcnt = 3;
		if (mcntt != null) {
			mcnt = Integer.parseInt(mcntt);
		}

		System.out.println("���ξ׼� ����");
		String selUser = request.getParameter("selUser");

		MessageDAO mDAO = new MessageDAO();
		MessageVO mVO = new MessageVO();
		UserDAO uDAO = new UserDAO();
		ArrayList<MsgSet> datas = mDAO.selectAll(selUser, mcnt);
		ArrayList<UserVO> newUsers = uDAO.selectAll();
		System.out.println("���ξ׼ǿ��� mDAO.Mcount �����ϱ� �� selUser �� Ȯ��"+selUser);
		int viewcnt = mDAO.Mcount(selUser);

		System.out.println(viewcnt);

		/* ����¡ ���μ��� */
		String mpage = request.getParameter("page");

		int page = 1;
		if (mpage != null) {
			page = Integer.parseInt(mpage);

		}
		System.out.println("MainAction ������ ������ ������ : " + page);
		System.out.println("MainAction ������ viewCnt : " + viewcnt);
		ArrayList<MsgSet> paging = mDAO.mPaging(page);
		request.setAttribute("paging", paging); // ��ü �Խñ۵�����
		request.setAttribute("page", page); // ���� �Խñ۵�����
		
		
		
		int cntStart = 1;
		int cntEnd = 5;
		if(page/5 >= 1) {
			cntStart += (5*(page%5));
			cntEnd += (5*(page%5));
		}
		request.setAttribute("cntStart", cntStart); 
		request.setAttribute("cntEnd", cntEnd); 
		
		/* ����¡ ���μ��� */

		
		
		request.setAttribute("datas", datas); // ��ü �Խñ۵�����
		request.setAttribute("newUsers", newUsers); // �ű� ����
		request.setAttribute("selUser", selUser); // �����ִ� ����
		request.setAttribute("mcnt", mcnt); // �� �Խñ� ����
		request.setAttribute("viewcnt", viewcnt); // ������ �Խñ� ����
		System.out.println("���ξ׼� ���� ���� datas ��"+datas);

		forward.setRedirect(false);
		forward.setPath("main.jsp");
		// ������ ���޹�İ� ��θ� �����Ϸ��� ������̴�.!
		System.out.println("���ξ׼� ����");

		return forward;

	}

}
