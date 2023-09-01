package com.group.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.beans.UserValidation;

public class RegisterS extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterS() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		performTask(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		performTask(request, response);
	}

	public void performTask(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = "";
		boolean valid = UserValidation.createUser(request.getParameter("name"), request.getParameter("gender"),
				request.getParameter("phone"), request.getParameter("email"), request.getParameter("pass"),
				request.getParameter("dob"));
		if (valid) {
			HttpSession session = request.getSession(true);
			session.setAttribute("logininfo", valid);
			uri = "login.jsp";
		} else {
			HttpSession session = request.getSession();
			session.invalidate();
			uri = "registration.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(uri);
		dispatcher.forward(request, response);
	}
}
