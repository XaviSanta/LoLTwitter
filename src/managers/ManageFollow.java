package managers;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
}
