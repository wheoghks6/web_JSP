package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.User;
import com.util.DbUtil;


public class UserDao {
	private Connection connection;
	PreparedStatement preparedStatement;
	
	public UserDao() {
		connection = DbUtil.getConnection();
		System.out.printf("connect : %s\n",connection);
	}

	public int addUser(User user) {
		try {
			preparedStatement = connection.prepareStatement("insert into user_table (user_id,password,name,email,phonenum) values (?, ?, ?,?,? )");
			// Parameters start with 1
			preparedStatement.setString(1, user.getUser_id());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getName());
			preparedStatement.setString(4, user.getEmail());
			preparedStatement.setString(5, user.getPhonenum());
			int result = preparedStatement.executeUpdate();
			return result;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int deleteUser(String userId) {
		try {
			preparedStatement = connection
					.prepareStatement("delete from user_table where user_id=?");
			// Parameters start with 1
			preparedStatement.setString(1, userId);
			int result = preparedStatement.executeUpdate();
			return result;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int updateUser(User user) {
		try {
			preparedStatement = connection.prepareStatement("update user_table set user_id=?, password=?, name=?, email=?, phonenum=? " +
							"where user_id=?");
			// Parameters start with 1
			preparedStatement.setString(1, user.getUser_id());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getName());
			preparedStatement.setString(4, user.getEmail());
			preparedStatement.setString(5, user.getPhonenum());
			preparedStatement.setString(6, user.getUser_id());
			int result = preparedStatement.executeUpdate();
			return result;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public List<User> getAllUsers() {
		List<User> users = new ArrayList<User>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from user_table ");
			while (rs.next()) {
				User user = new User();
				user.setUser_num(rs.getInt("user_num"));
				user.setUser_id(rs.getString("user_id"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPhonenum(rs.getString("phonenum"));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return users;
	}
	
	public User getUserById(String userId) {
		User user = new User();
		try {
			preparedStatement = connection.
					prepareStatement("select * from user_table where user_id=?");
			preparedStatement.setString(1, userId);
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				user.setUser_num(rs.getInt("user_num"));
				user.setUser_id(rs.getString("user_id"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPhonenum(rs.getString("phonenum"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}
	
	public int login(String id, String pw)
	{
		String query = "SELECT * FROM user_table WHERE user_id = ? ";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			
			if(rs.next())
			{
				System.out.print(rs.getString("password")+"\n");
				System.out.print("pw : "+pw+"\n");
				if(rs.getString("password").equals(pw))
				{
					return 1;
				}
				else
				{
					return 0;
					//패스워드 틀림
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return -1;
		//아이디 못찾음
	};

}
