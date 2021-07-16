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

import com.model.Board;
import com.util.DbUtil;



public class BoardDao {
	private Connection connection;
	PreparedStatement preparedStatement;
	
	public BoardDao() {
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
	public int addBoard(Board board) {
		try {
			preparedStatement = connection.prepareStatement("insert into board_table (title,user_id,content,readcount,timestamp) values (?, ?, ?,?,? )");
			// Parameters start with 1
			preparedStatement.setString(1, board.getTitle());
			preparedStatement.setString(2, board.getUser_id());
			preparedStatement.setString(3, board.getContent());
			preparedStatement.setInt(4, 0);
			preparedStatement.setString(5, getDate());
			int result = preparedStatement.executeUpdate();
			return result;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int deleteBoard(int board_num) {
		try {
			preparedStatement = connection
					.prepareStatement("delete from board_table where board_num=?");
			// Parameters start with 1
			preparedStatement.setInt(1, board_num);
			int result = preparedStatement.executeUpdate();
			return result;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int updateBoard(Board board) {
		try {
			preparedStatement = connection.prepareStatement("update board_table set title=?, user_id=?, content=? " +
							"where board_num=?");
			// Parameters start with 1
			preparedStatement.setString(1, board.getTitle());
			preparedStatement.setString(2, board.getUser_id());
			preparedStatement.setString(3, board.getContent());
			preparedStatement.setInt(4, board.getBoard_num());
			int result = preparedStatement.executeUpdate();
			return result;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public List<Board> getAllBoards() {
		List<Board> boards = new ArrayList<Board>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from board_table order by board_num desc ");
			while (rs.next()) {
				Board board = new Board();
				board.setBoard_num(rs.getInt("board_num"));
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
	
	public Board getBoardById(int board_num) {
		Board board = new Board();
		try {
			preparedStatement = connection.
					prepareStatement("select * from board_table where board_num=?");
			preparedStatement.setInt(1, board_num);
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				board.setBoard_num(rs.getInt("board_num"));
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
	public void updateReadCount(int board_num) {
		Board board = new Board();	
		try {
				preparedStatement = connection.
					prepareStatement("select * from board_table where board_num=?");
				preparedStatement.setInt(1, board_num);
				ResultSet rs = preparedStatement.executeQuery();
				
				if (rs.next()) {
					board.setBoard_num(rs.getInt("board_num"));
					board.setUser_id(rs.getString("user_id"));
					board.setContent(rs.getString("content"));
					board.setReadcount(rs.getInt("readcount")+1);
					board.setTitle(rs.getString("title"));
					board.setTimestamp(rs.getString("timestamp"));
					}
				preparedStatement = connection.
				prepareStatement("update board_table set readcount = ? where board_num=?");
				preparedStatement.setInt(1, board.getReadcount());
				preparedStatement.setInt(2, board_num);
				preparedStatement.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	public List<Board> getSearchList(String keyWord){	
	List<Board> boards = new ArrayList<Board>();
		try {
		preparedStatement = connection.
				prepareStatement("select * from board_table where title like ?");
		String key = "%" + keyWord + "%";
		preparedStatement.setString(1, key);
		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			Board board = new Board();
			board.setBoard_num(rs.getInt("board_num"));
			board.setUser_id(rs.getString("user_id"));
			board.setContent(rs.getString("content"));
			board.setReadcount(rs.getInt("readcount"));
			board.setTitle(rs.getString("title"));
			board.setTimestamp(rs.getString("timestamp"));
			boards.add(board);
		}
		}catch (SQLException e) {
			e.printStackTrace();
		}

		return boards;
	}
}
