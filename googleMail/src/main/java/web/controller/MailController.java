package web.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.mail.MailSend;

@WebServlet("/mail")
public class MailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String action = request.getRequestURI().substring(request.getContextPath().length());

		System.out.println(action);

		switch (action) {
		case "/mail/send":
			/**
			 * TODO Send Mail
			 */
			MailSend sender = new MailSend();
			sender.MailSend((String) request.getParameter("mymail"));
			break;
		}
	}
}
