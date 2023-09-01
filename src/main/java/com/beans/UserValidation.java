package com.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.connection.ConnectionPool;
import com.connection.DBUtility;
import com.infoes.LoginInfo;

public class UserValidation {

	public static LoginInfo isValid(String email, String pass) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		LoginInfo logininfo = null;
		try {
			con = ConnectionPool.getReadOnlyConnection();
			ps = con.prepareStatement("SELECT * FROM USER_MASTER WHERE EMAIL_ID=? AND PASSWORD=?");
			ps.setString(1, email);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
			}
			System.out.println("Login count-------------------->" + count);
			if (count == 1) {
				if (rs.next()) {
					logininfo = new LoginInfo();
					logininfo.setUserID(rs.getInt(1));
					logininfo.setName(rs.getString(2));
					logininfo.setGender(rs.getString(3));
					logininfo.setPhone(rs.getLong(4));
					logininfo.setDob(rs.getString(5));
					logininfo.setEmail(email);
					logininfo.setPassword(pass);
				}
			}
			DBUtility.shoutClose(con, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtility.shoutClose(con, ps, rs);
		}
		return logininfo;
	}

	public static boolean createUser(String name, String gender, String phone, String email, String pass, String dob) {

		Connection con = null;
		PreparedStatement ps = null;
		int update = 0;
		try {
			con = ConnectionPool.getReadOnlyConnection();
			ps = con.prepareStatement("INSERT INTO USER_MASTER  () VALUES(?,?,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, gender);
			ps.setLong(3, Long.parseLong(phone));
			ps.setString(4, email);
			ps.setString(5, pass);
			ps.setString(6, dob);
			update = ps.executeUpdate();
			System.out.println("updated ------------------------> " + update);
			DBUtility.shoutClose(con, ps, null);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtility.shoutClose(con, ps, null);
		}
		return update > 0;
	}
}
