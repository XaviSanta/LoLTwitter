package models;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class User implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private String user = "";
	private String mail = "";
	private String password = "";
	private String password2 = "";
	private boolean[] error  = {false,false,false,false};
	
	/* Getters */
	public String getUser(){
		return user;
	}
	
	public String getMail() {
		return mail;
	}
	
	public String getPassword() {
		return password;
	}
	
	public String getPassword2() {
		return password2;
	}
	
	public boolean[] getError() {
		return error;
	}
	
	/*Setters*/
	public void setUser(String user){
		this.user = user;
	}
	
	public void setMail(String mail){
		this.mail = mail;
	}
	
	public void setError(int index, boolean isError) {
		this.error[index] = isError;
	}
	
	public void setPassword(String password) {
		String regex = "(?=.[A-Z])(?=.[a-z])(?=.'\\'d)[a-zA-Z'\\'d]";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(password);
		if( matcher.matches()) {
			this.password = password;
		}
		else {
			error[1]=true;
			System.out.println(password);	
		}
	}
	
	public void setPassword2(String password2) {
		String regex = "(?=.[A-Z])(?=.[a-z])(?=.'\\'d)[a-zA-Z'\\'d]";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(password2);
		if( matcher.matches()) {
			this.password2 = password2;
		}
		else {
			error[1]=true;
			System.out.println(password2);	
		}
	}
	
	/* Logic Functions */
	public boolean isComplete() {
	    return(hasValue(getUser()) &&
	           hasValue(getMail()) && 
	           hasValue(getPassword()));
	}
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
}
