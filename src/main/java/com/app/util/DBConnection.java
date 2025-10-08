package com.app.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static String URL="jdbc:mysql://127.0.0.1:3306/foodapp";
	private static String USERNAME="root";
	private static String PASSWORD="0701";
	private static Connection connection;
	public static Connection getConnection(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
		
	}

}
