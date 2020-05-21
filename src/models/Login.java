package models;

public class Login {

	private String user = "";
	private String pass = "";
	
	private int[] error = {0};
	
	public String getUser(){
		return user;
	}
	
	public String getPass() {
		return pass;
	}
	
	public void setUser(String user){
		this.user = user;
	}
	
	public void setPass(String pass) {
		this.pass = pass;
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