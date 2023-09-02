package com.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import com.connection.ConnectionPool;
import com.connection.DBUtility;
import com.infoes.LoginInfo;

public class UserDetails {
	public static String getDetails() {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		JSONArray main = new JSONArray();
		try {
			con = ConnectionPool.getReadOnlyConnection();
			ps = con.prepareStatement("SELECT USER_ID,NAME,GENDER,PHONE,DOB,EMAIL FROM USER_MASTER");
			rs = ps.executeQuery();
			int count = 0;

			while (rs.next()) {
				JSONObject hold = new JSONObject();
				hold.put("ID", rs.getInt(1));
				hold.put("NAME", rs.getString(2));
				hold.put("GENDER", rs.getString(3));
				hold.put("PHONE", rs.getLong(4));
				hold.put("DOB", rs.getString(5));
				hold.put("EMAIL", rs.getString(6));
				main.put(hold);
			}
			main.put(0, count);// Put total number of USER so that we can iterate over it on front-end
			DBUtility.shoutClose(con, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtility.shoutClose(con, ps, rs);
		}
		return main.toString();

	}

	public static List<LoginInfo> getDetailsInit() {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<LoginInfo> main = new ArrayList<>();
		try {
			con = ConnectionPool.getReadOnlyConnection();
			ps = con.prepareStatement("SELECT USER_ID,NAME,GENDER,PHONE,DOB,EMAIL FROM USER_MASTER");
			rs = ps.executeQuery();

			while (rs.next()) {
				LoginInfo logininfo = new LoginInfo();
				logininfo.setUserID(rs.getInt(1));
				logininfo.setGender(rs.getString(3));
				logininfo.setEmail(rs.getString(6));
				logininfo.setName(rs.getString(2));
				logininfo.setPhone(rs.getLong(4));
				logininfo.setDob(rs.getString(5));
				main.add(logininfo);
			}
			System.out.println(main.size());
			DBUtility.shoutClose(con, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtility.shoutClose(con, ps, rs);
		}
		return main;

	}

	public static String getLikeRecords(String field, String value) {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		JSONArray hold = new JSONArray();
		try {
			con = ConnectionPool.getReadOnlyConnection();
			ps = con.prepareStatement(
					"SELECT " + field + ",USER_ID FROM USER_MASTER where UPPER(" + field + ") like ?");
			ps.setString(1, "%" + value.toLowerCase() + "%");
			rs = ps.executeQuery();
			while (rs.next()) {

				hold.put(rs.getString(1) + " {" + rs.getInt(2) + "}");
			}
			DBUtility.shoutClose(con, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtility.shoutClose(con, ps, rs);
		}
		return hold.toString();

	}

	public static String getDetail(String id) {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		JSONObject main = new JSONObject();
		try {
			if (id != null && !"".equalsIgnoreCase(id)) {
				con = ConnectionPool.getReadOnlyConnection();
				ps = con.prepareStatement("SELECT NAME,GENDER,PHONE,DOB,EMAIL FROM USER_MASTER where USER_ID=" + id);
				rs = ps.executeQuery();

				if (rs.next()) {
					main.put("ID", id);
					main.put("NAME", rs.getString(1));
					main.put("GENDER", rs.getString(2));
					main.put("PHONE", rs.getString(3));
					main.put("DOB", rs.getString(4));
					main.put("EMAIL", rs.getString(5));
				}
				DBUtility.shoutClose(con, ps, rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtility.shoutClose(con, ps, rs);
		}
		return main.toString();

	}

	public static String deleteUser(String id) {

		Connection con = null;
		PreparedStatement ps = null;
		int isExecuted = 0;
		JSONObject main = new JSONObject();
		try {
			if (id != null && !"".equalsIgnoreCase(id)) {
				con = ConnectionPool.getReadOnlyConnection();
				ps = con.prepareStatement("DELETE FROM USER_MASTER where USER_ID=" + id);
				isExecuted = ps.executeUpdate();

				if (isExecuted == 1)
					main.put("STATUS", true);
				else
					main.put("STATUS", false);
				DBUtility.shoutClose(con, ps, null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtility.shoutClose(con, ps, null);
		}
		return main.toString();

	}

	public static String deleteUsers(String ids[]) {

		Connection con = null;
		PreparedStatement ps = null;
		int isExecuted = 0;
		JSONObject main = new JSONObject();
		try {
			if (ids != null) {
				con = ConnectionPool.getReadOnlyConnection();

//			String idString = Arrays.toString(ids);
//			idString = idString.substring(1, idString.length() - 1);

				ps = con.prepareStatement("DELETE FROM USER_MASTER where USER_ID IN (" + ids + ")");
				isExecuted = ps.executeUpdate();

				System.out.println(ids);

				if (isExecuted >= 1) {
					main.put("STATUS", true);
					main.put("FREQUENCY", isExecuted);
				} else
					main.put("STATUS", false);
				DBUtility.shoutClose(con, ps, null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtility.shoutClose(con, ps, null);
		}
		return main.toString();

	}

	public static boolean update(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement ps = null;
		int isExecuted = 0;
		try {
			if (request == null) {
				System.out.println("Invalid aruguments--------------------> 146 USerDetails.java");
			} else {

				String name = "";
				String dob = "";
				String gender = "";
				String email = "";
				String phone = "";
				String pass = "";
				if (request.getParameter("name") != null && !"".equalsIgnoreCase(request.getParameter("name"))) {
					name = "name=" + request.getParameter("name");
				} else {
					name = "name=name";
				}
				if (request.getParameter("dob") != null && !"".equalsIgnoreCase(request.getParameter("dob"))) {
					dob = "dob=dob";
				}
				if (request.getParameter("gender") != null && !"".equalsIgnoreCase(request.getParameter("gender"))) {
					gender = "gender=gender";
				}
				if (request.getParameter("email") != null && !"".equalsIgnoreCase(request.getParameter("email"))) {
					email = "email=email";
				}
				if (request.getParameter("phone") != null && !"".equalsIgnoreCase(request.getParameter("phone"))) {
					phone = "phone=phone";
				}
				if (request.getParameter("pass") != null && !"".equalsIgnoreCase(request.getParameter("pass"))) {
					pass = "pass=pass";
				}
				name = "UPDATE USER_MASTER set " + name + "," + dob + "," + gender + "," + email + "," + phone + ","
						+ pass;
				con = ConnectionPool.getReadOnlyConnection();
				ps = con.prepareStatement(name);
				isExecuted = ps.executeUpdate();

				System.out.println(name);
				DBUtility.shoutClose(con, ps, null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtility.shoutClose(con, ps, null);
		}
		return isExecuted == 1;
	}
}
