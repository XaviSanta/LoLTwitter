package models;

public class Login {

	private String user = "";
	private String password = "";
	
	private int[] error = {0};
	
	public String getUser(){
		return user;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setUser(String user){
		this.user = user;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int[] getError() {
		return error;
	}
	
	public boolean isComplete() {
	    return(hasValue(getUser()));
	}
	
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
	
}