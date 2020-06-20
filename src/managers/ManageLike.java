package managers;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import models.Like;
import models.Tweets;
import utils.DAO;

public class ManageLike {

	
	private DAO db = null ;
	
	
	public ManageLike() {
		try {
			db = new DAO();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void finalize() {
		try {
			super.finalize();
			db.disconnectBD();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
	
	/* Get a like by PK */
	public Like getLike(Integer ID) {
		String query = "SELECT ID,tweet_ID,uid,like_date FROM likes WHERE ID = ? ;";
		PreparedStatement statement = null;
		ResultSet rs = null;
		Like like = null;
		try {
			statement = db.prepareStatement(query);
			statement.setInt(1,ID);
			rs = statement.executeQuery();
			if (rs.next()) {
				like = new Like();
				like.setID(rs.getInt("ID"));
				like.setTweet_id(rs.getInt("tweet_ID"));
				like.setUser_id(rs.getString("uid"));
				like.setLikeDateTime(rs.getTimestamp("like_date"));
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return like;
	}
	
	//get likes from tweet:

	public List<Like> getTweetLikes(String tweet_ID) {
		 String query = "SELECT likes.ID,likes.uid,tweets.like_date FROM likes where likes.tweet_ID = ? ;";
		 PreparedStatement statement = null;
		 List<Like> l = new ArrayList<Like>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setString(1,tweet_ID);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 Like like = new Like();
      		     like.setID(rs.getInt("ID"));
				 like.setUser_id(rs.getString("uid"));
				 like.setLikeDateTime(rs.getTimestamp("like_date"));
				 l.add(like);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	
	
	// Add a Like 
	public boolean addLike(Integer tweet_ID, String uid, Timestamp like_date) {
		String query = "INSERT INTO likes (tweet_ID, uid,like_date) VALUES (?,?,?)";
		
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setInt(1,tweet_ID);
			statement.setString(2,uid);
			statement.setTimestamp(3,like_date);
			statement.executeUpdate();
			statement.close();
			return true;
			 
		} catch (SQLException e) {
			//e.printStackTrace();
			return false;
		}
	}
	
	
	// dislike by ID:
	public void deleteLike(Integer ID) {
		// Note that this is done using https://www.arquitecturajava.com/jdbc-prepared-statement-y-su-manejo/
		String query = "DELETE FROM likes WHERE ID = ?";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setInt(1,ID);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// dislike by uid + tweet:!!!!!!!!!!!!!!!!!
	public void deleteUserLike(String uid, Integer tweet_id) {
		// Note that this is done using https://www.arquitecturajava.com/jdbc-prepared-statement-y-su-manejo/
		String query = "DELETE FROM likes WHERE (uid,tweet_id) = (?,?)";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,uid);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	// Get likes from a user:
	public List<Like> getUserLikes(String uid) {
		 String query = "SELECT likes.ID,likes.uid,tweets.like_date FROM likes where likes.uid = ? ;";
		 PreparedStatement statement = null;
		 List<Like> l = new ArrayList<Like>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setString(1,uid);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 Like like = new Like();
       		     like.setID(rs.getInt("ID"));
				 like.setUser_id(rs.getString("uid"));
				 like.setLikeDateTime(rs.getTimestamp("like_date"));
				 l.add(like);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	
	// Get likes from a user given start and end dates:
	public List<Like> getUserLikes(String uid,Integer start, Integer end) {
		 String query = "SELECT likes.ID,likes.uid,tweets.like_date FROM likes where tweets.uid LIKE ? ORDER BY likes.like_date DESC LIMIT ?,? ;";
		 PreparedStatement statement = null;
		 List<Like> l = new ArrayList<Like>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setString(1,uid);
			 statement.setInt(2,start);
			 statement.setInt(3,end);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 Like like = new Like();
       		     like.setID(rs.getInt("ID"));
				 like.setUser_id(rs.getString("uid"));
				 like.setLikeDateTime(rs.getTimestamp("like_date"));
				 l.add(like);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	


}
