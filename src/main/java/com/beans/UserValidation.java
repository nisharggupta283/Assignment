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
			ps = con.prepareStatement("SELECT USER_ID,NAME,GENDER,PHONE,DOB,EMAIL,PASS FROM USER_MASTER WHERE EMAIL=? AND PASS=?");
			ps.setString(1, email);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				logininfo = new LoginInfo();
				logininfo.setUserID(rs.getInt(1));
				logininfo.setName(rs.getString(2));
				logininfo.setGender(rs.getString(3));
				logininfo.setPhone(rs.getLong(4));
				logininfo.setDob(rs.getString(5));
				logininfo.setEmail(email);
				logininfo.setPassword(pass);
			}
			System.out.println("Login count-------------------->" + count);
			if (!(count == 1)) {
				return null;
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
			con = ConnectionPool.getConnection();
			ps = con.prepareStatement("INSERT INTO USER_MASTER  (NAME,GENDER,PHONE,EMAIL,PASS,DOB) VALUES(?,?,?,?,?,?)");
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
