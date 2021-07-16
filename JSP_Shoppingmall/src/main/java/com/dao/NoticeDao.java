package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.model.Notice;
import com.util.DbUtil;

public class NoticeDao {
	private Connection connection;
	PreparedStatement preparedStatement;
	
	public NoticeDao() {
		connection = DbUtil.getConnection();
		System.out.printf("connect : %s\n",connection);
	}

	public String getDate() {
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
		Date currentTime = new Date ( );
		String dTime = formatter.format ( currentTime );
		System.out.println ( dTime );
		return dTime;

		}
	public int addNotice(Notice notice) {
		try {
			preparedStatement = connection.prepareStatement("insert into notice_table (title,user_id,content,readcount,timestamp) values (?, ?, ?,?,? )");
			// Parameters start with 1
			preparedStatement.setString(1, notice.getTitle());
			preparedStatement.setString(2, notice.getUser_id());
			preparedStatement.setString(3, notice.getContent());
			preparedStatement.setInt(4, 0);
			preparedStatement.setString(5, getDate());
			int result = preparedStatement.executeUpdate();
			return result;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int deleteNotice(int notice_num) {
		try {
			preparedStatement = connection
					.prepareStatement("delete from notice_table where notice_num=?");
			// Parameters start with 1
			preparedStatement.setInt(1, notice_num);
			int result = preparedStatement.executeUpdate();
			return result;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int updateNotice(Notice board) {
		try {
			preparedStatement = connection.prepareStatement("update notice_table set title=?, user_id=?, content=? " +
							"where notice_num=?");
			// Parameters start with 1
			preparedStatement.setString(1, board.getTitle());
			preparedStatement.setString(2, board.getUser_id());
			preparedStatement.setString(3, board.getContent());
			preparedStatement.setInt(4, board.getNotice_num());
			int result = preparedStatement.executeUpdate();
			return result;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public List<Notice> getAllNotices() {
		List<Notice> boards = new ArrayList<Notice>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from notice_table order by notice_num desc ");
			while (rs.next()) {
				Notice board = new Notice();
				board.setNotice_num(rs.getInt("notice_num"));
				board.setUser_id(rs.getString("user_id"));
				board.setContent(rs.getString("content"));
				board.setReadcount(rs.getInt("readcount"));
				board.setTitle(rs.getString("title"));
				board.setTimestamp(rs.getString("timestamp"));
				boards.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return boards;
	}
	
	public Notice getNoticeById(int notice_num) {
		Notice board = new Notice();
		try {
			preparedStatement = connection.
					prepareStatement("select * from notice_table where notice_num=?");
			preparedStatement.setInt(1, notice_num);
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				board.setNotice_num(rs.getInt("notice_num"));
				board.setUser_id(rs.getString("user_id"));
				board.setContent(rs.getString("content"));
				board.setReadcount(rs.getInt("readcount"));
				board.setTitle(rs.getString("title"));
				board.setTimestamp(rs.getString("timestamp"));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return board;
	}
	public void updateReadCount(int notice_num) {
		Notice notice = new Notice();	
		try {
				preparedStatement = connection.
						prepareStatement("select * from notice_table where notice_num=?");
				preparedStatement.setInt(1, notice_num);
				ResultSet rs = preparedStatement.executeQuery();
				
				if (rs.next()) {
					notice.setNotice_num(rs.getInt("notice_num"));
					notice.setUser_id(rs.getString("user_id"));
					notice.setContent(rs.getString("content"));
					notice.setReadcount(rs.getInt("readcount")+1);
					notice.setTitle(rs.getString("title"));
					notice.setTimestamp(rs.getString("timestamp"));
					}
				preparedStatement = connection.
				prepareStatement("update notice_table set readcount = ? where notice_num=?");
				preparedStatement.setInt(1, notice.getReadcount());
				preparedStatement.setInt(2, notice_num);
				preparedStatement.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
}
