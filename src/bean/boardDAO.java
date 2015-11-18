package bean;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class boardDAO {

	DataSource ds;
	Connection con;

	Statement stmt;
	PreparedStatement pstmt;
	PreparedStatement pstmt1;
	ResultSet rs;

	public boardDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception e) {
			System.out.println(e);
			return;
		}
	}
	public List<mapBean> board_select() {
		List<mapBean> list = new ArrayList<mapBean>();
		String sql = "select * from map   ";

		try {
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {

				mapBean tmp = new mapBean();

				tmp.setTitle(rs.getString("T"
						+ "itle"));
				tmp.setLat(rs.getString("Lat"));
				tmp.setLng(rs.getString("Lng"));
				
				list.add(tmp);
			}

			rs.close();
			stmt.close();
			con.close();
			return list;

		} catch (Exception e) {
			System.out.println("select" + e);
		}
		return null;

	}



}
