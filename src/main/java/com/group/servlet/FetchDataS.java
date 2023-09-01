package com.group.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
		}else {
			
		}

	}

}
