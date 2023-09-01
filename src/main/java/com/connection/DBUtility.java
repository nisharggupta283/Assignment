package com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtility {
	public static void closeQuietly(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) { // NOPMD
			// quiet
		}
	}

	public static void closeQuietly(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (SQLException e) { // NOPMD
			// quiet
		}
	}

	public static void closeQuietly(PreparedStatement ps) {
		try {
			if (ps != null)
				ps.close();
		} catch (SQLException e) { // NOPMD
			// quiet
		}
	}

	public static void closeQuietly(Connection con) {
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) { // NOPMD
			// quiet
		}
	}

	public static void closeQuietly(Connection conn, PreparedStatement ps, ResultSet rs) {

		try {
			closeQuietly(rs);
		} finally {
			try {
				closeQuietly(ps);
			} finally {
				closeQuietly(conn);
			}
		}

	}

	public static void shoutClose(Connection conn, PreparedStatement ps, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		}
	}
}
