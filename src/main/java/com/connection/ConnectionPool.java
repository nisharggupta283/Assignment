package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ResourceBundle;

public class ConnectionPool {
	private ConnectionPool() {
	}

	public static Connection getConnection() throws Exception {
		Connection connection = null;
		ResourceBundle res = ResourceBundle.getBundle("Application");
		System.out.println(res.getString("Driver"));
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "root");
		return connection;
	}

	public static Connection getReadOnlyConnection() throws Exception {

		Connection con = getConnection();
		con.setReadOnly(true);
		return con;

	}
}
