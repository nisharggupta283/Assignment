package com.group.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.beans.UserDetails;
import com.infoes.LoginInfo;

public class FetchDataS extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FetchDataS() {
		super();
		System.out.println("/FetchDataS called------------------------->");
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
		HttpSession session = request.getSession();
		LoginInfo logininfo = (LoginInfo) session.getAttribute("logininfo");
		if (session == null || logininfo == null) {
			session.invalidate();
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		} else {
			PrintWriter writer = null;
			try {
				switch (request.getParameter("mode")) {
				case "delete": {
					writer = response.getWriter();
					String deleteUsers = UserDetails.deleteUsers(request.getParameterValues("id"),null);
					writer.write(deleteUsers);
					break;
				}
				case "deleteOne": {
					writer = response.getWriter();
					String deleteOne = UserDetails.deleteUser(request.getParameter("id"));
					writer.write(deleteOne);
					break;
				}
				case "getDetail": {
					writer = response.getWriter();
					String detail = UserDetails.getDetail(request.getParameter("id"));
					writer.write(detail);
					break;
				}
				case "getDetails": {
					writer = response.getWriter();
					String details = UserDetails.getDetails();
					writer.write(details);
					break;
				}
				case "likeDetails": {
					writer = response.getWriter();
					String details = UserDetails.getLikeRecords(request.getParameter("select"),
							request.getParameter("input"));
					writer.write(details);
					break;
				}
				default:
					System.out.println("Invalid Mode");
					break;
				}
			} finally {
				if (writer != null)
					writer.close();
			}
		}

	}

}
