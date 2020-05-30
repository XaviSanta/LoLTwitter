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
	// Check Login User-pass
	public boolean isCorrectLogin(Login login) {
		String query = "SELECT password,salt "
				+ "from ts1.useraccounts "
				+ "WHERE username='"+ login.getUser() + "'";
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
		
		Random rand = new Random();
		// Obtain a number between [0 - 2147483646].
		int n = rand.nextInt(2147483647);
		
		String hashedUsername = "SHA2(CONCAT('"+user.getPassword()+"','"+n+"'),512)";
		String query = "INSERT INTO UserAccounts "
				+ "(username, email, password, salt, submission_date) VALUES (?,?,"+hashedUsername+","+n+",NOW())";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,user.getUser());
			statement.setString(2,user.getMail());
			//statement.setString(3,user.getPassword());
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
	
	private String hashString() {
		return "";
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
