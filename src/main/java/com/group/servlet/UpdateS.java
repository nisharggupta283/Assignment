package com.group.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.UserDetails;
import com.beans.UserValidation;
import com.infoes.LoginInfo;

public class UpdateS extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateS() {
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
		if (request.getParameter("mode") != null && "col".equalsIgnoreCase(request.getParameter("mode"))) {
			LoginInfo valid = UserValidation.isValid(request.getParameter("id"));
			request.setAttribute("username", valid.getName());
			request.setAttribute("id", valid.getUserID());
			uri = "updateDetails.jsp";
		} else {
			LoginInfo valid = UserValidation.isValid(request.getParameter("id"));
			if (valid != null) {
				boolean update = UserDetails.update(request);
				if (update)
					uri = "see-list.jsp";
				else
					uri = "updateDetails.jsp";
			} else {
				HttpSession session = request.getSession();
				session.invalidate();
				uri = "login.jsp";
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(uri);
		dispatcher.forward(request, response);
	}
}
