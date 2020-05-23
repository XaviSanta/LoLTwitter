package managers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.Login;
import models.User;
import utils.DAO;

public class ManageUser {
	
	private DAO db = null ;
	
	public ManageUser() {
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
	// Check Login User-pass
	public boolean isCorrectLogin(Login login) {
		String query = "SELECT password "
				+ "from ts1.useraccounts "
				+ "WHERE username='"+ login.getUser() + "'";
		try {
			ResultSet rs = db.executeSQL(query);
			if (rs.next()) {
				String password = rs.getString("password");
				return password.equals(login.getPassword());
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// Check User name
	public boolean isUsernameAvailable(User user) {
		String query = "SELECT * from UserAccounts where username='" + user.getUser() +"'";
		
		try {
			ResultSet rs = db.executeSQL(query);
			if(rs.next())  {
				return false;
			} else {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	// Add new user
	public void addUser(User user) {
		String query = "INSERT INTO UserAccounts "
				+ "(username, email, password) VALUES (?,?,?)";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,user.getUser());
			statement.setString(2,user.getMail());
			statement.setString(3,user.getPassword());
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/*Check if all the fields are filled correctly */
	public boolean isComplete(User user) {
	    return(hasValue(user.getUser()) &&
	    	   hasValue(user.getMail()) &&
	    	   hasValue(user.getPassword()));
	}
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
}
