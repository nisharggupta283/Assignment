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

public class LoginS extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginS() {
    	System.out.println("Int loginS----------------------------->");
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		performTask(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		performTask(request, response);
	}
	public void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri="";
		LoginInfo valid = UserValidation.isValid(request.getParameter("email"), request.getParameter("password"));
		if(valid!=null) {
			HttpSession session = request.getSession(true);
			session.setMaxInactiveInterval(3*60);
			session.setAttribute("logininfo", valid);
			request.setAttribute("UserList", UserDetails.getDetailsInit());
			uri="see-list.jsp";
		}else {
			HttpSession session = request.getSession();
			session.invalidate();
			uri="login.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(uri);
		dispatcher.forward(request, response);
	}
}
