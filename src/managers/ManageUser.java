package managers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.Login;
import models.User;
import utils.DAO;

import java.math.BigInteger; 
import java.security.MessageDigest; 
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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
	
	// Get a user given its PK
	public User getUser(String uid) {
		String query = "SELECT * FROM users WHERE uid = ? ;";
		PreparedStatement statement = null;
		ResultSet rs = null;
		User user = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,uid);
			rs = statement.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setUser(rs.getString("uid"));
				user.setProfilePicture(rs.getString("profilePicture"));
				// user.setName(rs.getString("name"));
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	// Get profile image from user
	
	public String getProfilePicture(String uid) {
		String query = "SELECT profilePicture FROM users WHERE uid = ? ;";
		PreparedStatement statement = null;
		ResultSet rs = null;
		String aux ="";
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,uid);
			rs = statement.executeQuery();
			if (rs.next()) {
				aux = rs.getString("profilePicture");
			}
			rs.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return aux;
	}
	
	
	// Get users a given user is following
	public List<User> getUserFollows(String uid) {
		 String query = "SELECT users.uid FROM followers JOIN users ON users.uid = followers.fid WHERE followers.uid = ?;";
		 PreparedStatement statement = null;
		 List<User> l = new ArrayList<User>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setString(1,uid);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 User user = new User();
				 user.setUser(rs.getString("uid"));
				 // user.setName(rs.getString("name"));
				 l.add(user);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	public List<User> getUserFollows(String uid, Integer start, Integer end) {
		 String query = "SELECT users.uid FROM followers JOIN users ON users.uid = followers.fid WHERE followers.uid = ? ORDER BY users.uid LIMIT ?,?;";
		 PreparedStatement statement = null;
		 List<User> l = new ArrayList<User>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setString(1,uid);
			 statement.setInt(2,start);
			 statement.setInt(3,end);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 User user = new User();
				 user.setUser(rs.getString("uid"));
				 // user.setName(rs.getString("name"));
				 l.add(user);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	// Check Login User-pass
	public boolean isCorrectLogin(Login login) {
		String query = "SELECT password,salt "
				+ "from ts1.users "
				+ "WHERE uid='"+ login.getUser() + "'";

		try {
			ResultSet rs = db.executeSQL(query);
			if (rs.next()) {
				String password = rs.getString("password");
				String salt = rs.getString("salt");
				
				String inputPassword = encryptThisString(login.getPassword()+salt);
				
				return password.equals(inputPassword);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// Check User name
	public boolean isUsernameAvailable(User user) {
		String query = "SELECT * from users where uid='" + user.getUser() +"'";
		
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

	public boolean addUser(User user) {
		Random rand = new Random();
		
		// Obtain a number between [0 - 2147483646].
		int salt = rand.nextInt(2147483647);
		String hashedUsername = "SHA2(CONCAT('"+user.getPassword()+"','"+salt+"'),512)";
		String query = "INSERT INTO users "
				+ "(uid, email, profilePicture, password, salt, submission_date) "
				+ "VALUES (?,?,?,"+hashedUsername+",?,NOW())";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,user.getUser());
			statement.setString(2,user.getMail());
			statement.setInt(4, salt);
			statement.setString(3, "https://www.w3schools.com/w3images/avatar2.png");
			statement.executeUpdate();
			statement.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
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
	
	public static String encryptThisString(String input) 
    { 
        try { 
            // getInstance() method is called with algorithm SHA-512 
            MessageDigest md = MessageDigest.getInstance("SHA-512"); 
  
            // digest() method is called 
            // to calculate message digest of the input string 
            // returned as array of byte 
            byte[] messageDigest = md.digest(input.getBytes()); 
  
            // Convert byte array into signum representation 
            BigInteger no = new BigInteger(1, messageDigest); 
  
            // Convert message digest into hex value 
            String hashtext = no.toString(16); 
  
            // Add preceding 0s to make it 32 bit 
            while (hashtext.length() < 32) { 
                hashtext = "0" + hashtext; 
            } 
  
            // return the HashText 
            return hashtext; 
        } 
  
        // For specifying wrong message digest algorithms 
        catch (NoSuchAlgorithmException e) { 
            throw new RuntimeException(e); 
        } 
    }
}
