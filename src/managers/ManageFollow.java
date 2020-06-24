package managers;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Follower;
import models.Tweets;
import utils.DAO;

public class ManageFollow {
	private DAO db = null;
	
	public ManageFollow() {
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
	
	// follow user fid
	public void followUser(String uid, String fid) {
		String query = "INSERT INTO followers (uid, fid) VALUES (?,?)";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,uid);
			statement.setString(2,fid);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// unfollow user fid
	public void unfollowUser(String uid, String fid) {
		String query = "DELETE FROM followers WHERE uid=? AND fid=?";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,uid);
			statement.setString(2,fid);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// get followers:
	public List<Follower> getFollowers(String uid) {
		 String query = "SELECT uid, fid FROM followers WHERE followers.uid = ? ";
		 PreparedStatement statement = null;
		 List<Follower> l = new ArrayList<Follower>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setString(1,uid);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 Follower foll = new Follower();
    			 foll.setUid(rs.getString("uid"));
				 foll.setFid(rs.getString("fid"));
				 l.add(foll);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return l;
		} 
		return  l;
	}
	
	
	
}
