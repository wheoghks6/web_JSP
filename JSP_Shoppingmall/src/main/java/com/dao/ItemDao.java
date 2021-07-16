package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Board;
import com.model.Item;
import com.util.DbUtil;

public class ItemDao {
	private Connection connection;
	PreparedStatement preparedStatement;
	
	public ItemDao() {
		connection = DbUtil.getConnection();
		System.out.printf("connect : %s\n",connection);
	}
	public List<Item> getAllMobiles() {
		List<Item> items = new ArrayList<Item>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from mobile_table ");
			while (rs.next()) {
				Item item = new Item();
				item.setItem_num(rs.getInt("item_num"));
				item.setItem_name(rs.getString("item_name"));
				item.setItem_content(rs.getString("item_content"));
				item.setItem_price(rs.getInt("item_price"));
				item.setItem_img(rs.getString("item_img"));
				item.setItem_count(rs.getInt("item_count"));
				items.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return items;
	}
	public Item getMobileById(int item_num) {
		Item item = new Item();
		try {
			preparedStatement = connection.
					prepareStatement("select * from mobile_table where item_num=?");
			preparedStatement.setInt(1, item_num);
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				item.setItem_num(rs.getInt("item_num"));
				item.setItem_name(rs.getString("item_name"));
				item.setItem_content(rs.getString("item_content"));
				item.setItem_price(rs.getInt("item_price"));
				item.setItem_img(rs.getString("item_img"));
				item.setItem_count(rs.getInt("item_count"));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return item;
	}
	public int updateMobile_count(int item_num) {
		Item item = new Item();	
		try {
				System.out.println(item_num+"구매중");
				preparedStatement = connection.
						prepareStatement("select * from mobile_table where item_num=?");
				preparedStatement.setInt(1, item_num);
				ResultSet rs = preparedStatement.executeQuery();
				
				if (rs.next()) {
					item.setItem_num(rs.getInt("item_num"));
					item.setItem_name(rs.getString("item_name"));
					item.setItem_content(rs.getString("item_content"));
					item.setItem_price(rs.getInt("item_price"));
					item.setItem_img(rs.getString("item_img"));
					item.setItem_count(rs.getInt("item_count") - 1);
					
					}
				preparedStatement = connection.
				prepareStatement("update mobile_table set item_count=? where item_num=?");
				preparedStatement.setInt(1, item.getItem_count());
				
				preparedStatement.setInt(2, item_num);
				preparedStatement.executeUpdate();
				return 1;
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return -1;
	}
	
	public List<Item> getAllcomputers() {
		List<Item> items = new ArrayList<Item>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from computer_table order by item_num desc");
			while (rs.next()) {
				Item item = new Item();
				item.setItem_num(rs.getInt("item_num"));
				item.setItem_name(rs.getString("item_name"));
				item.setItem_content(rs.getString("item_content"));
				item.setItem_price(rs.getInt("item_price"));
				item.setItem_img(rs.getString("item_img"));
				item.setItem_count(rs.getInt("item_count"));
				items.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return items;
	}
	public Item getComputerById(int item_num) {
		Item item = new Item();
		try {
			preparedStatement = connection.
					prepareStatement("select * from computer_table where item_num=?");
			preparedStatement.setInt(1, item_num);
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				item.setItem_num(rs.getInt("item_num"));
				item.setItem_name(rs.getString("item_name"));
				item.setItem_content(rs.getString("item_content"));
				item.setItem_price(rs.getInt("item_price"));
				item.setItem_img(rs.getString("item_img"));
				item.setItem_count(rs.getInt("item_count"));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return item;
	}
	
	public int updatecomputer_count(int item_num) {
		Item item = new Item();	
		try {
				preparedStatement = connection.
						prepareStatement("select * from computer_table where item_num=?");
				preparedStatement.setInt(1, item_num);
				ResultSet rs = preparedStatement.executeQuery();
				
				if (rs.next()) {
					item.setItem_num(rs.getInt("item_num"));
					item.setItem_name(rs.getString("item_name"));
					item.setItem_content(rs.getString("item_content"));
					item.setItem_price(rs.getInt("item_price"));
					item.setItem_img(rs.getString("item_img"));
					item.setItem_count(rs.getInt("item_count") -1);
					}
				preparedStatement = connection.
				prepareStatement("update computer_table set item_count = ? where item_num=?");
				preparedStatement.setInt(1, item.getItem_count());
				preparedStatement.setInt(2, item_num);
				preparedStatement.executeUpdate();
				return 1;
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return -1;
	}
	public List<Item> getComputerSearchList(String keyWord){	
		List<Item> items = new ArrayList<Item>();
			try {
			preparedStatement = connection.
					prepareStatement("select * from computer_table where item_name like ?");
			String key = "%" + keyWord + "%";
			preparedStatement.setString(1, key);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Item item = new Item();
				item.setItem_num(rs.getInt("item_num"));
				item.setItem_name(rs.getString("item_name"));
				item.setItem_content(rs.getString("item_content"));
				item.setItem_price(rs.getInt("item_price"));
				item.setItem_img(rs.getString("item_img"));
				item.setItem_count(rs.getInt("item_count"));
				items.add(item);
			}
			}catch (SQLException e) {
				e.printStackTrace();
			}

			return items;
		}
	public List<Item> getMobileSearchList(String keyWord){	
		List<Item> items = new ArrayList<Item>();
			try {
			preparedStatement = connection.
					prepareStatement("select * from mobile_table where item_name like ?");
			String key = "%" + keyWord + "%";
			preparedStatement.setString(1, key);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Item item = new Item();
				item.setItem_num(rs.getInt("item_num"));
				item.setItem_name(rs.getString("item_name"));
				item.setItem_content(rs.getString("item_content"));
				item.setItem_price(rs.getInt("item_price"));
				item.setItem_img(rs.getString("item_img"));
				item.setItem_count(rs.getInt("item_count"));
				items.add(item);
			}
			}catch (SQLException e) {
				e.printStackTrace();
			}

			return items;
		}
}
