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
		System.out.println("is Resource Bundle file Loaded----------->"+res.getString("isLoaded"));
		Class.forName(res.getString("Driver"));
		connection = DriverManager.getConnection(res.getString("Source"), res.getString("Username"), res.getString("Password"));
//		connection.setReadOnly(false);
		return connection;
	}

	public static Connection getReadOnlyConnection() throws Exception {

		Connection con = getConnection();
		con.setReadOnly(true);
		return con;

	}
}
