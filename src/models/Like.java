package models;
import java.sql.Timestamp;

public class Like {
	
	private static final long serialVersionUID = 1L;
	
	private Integer ID;
	private Integer tweet_id;
	private String user_id;
	private Timestamp likeDateTime;
	
	public Like() {
		
	}
	
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public Integer getTweet_id() {
		return tweet_id;
	}
	public void setTweet_id(Integer tweet_id) {
		this.tweet_id = tweet_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Timestamp getLikeDateTime() {
		return likeDateTime;
	}
	public void setLikeDateTime(Timestamp likeDateTime) {
		this.likeDateTime = likeDateTime;
	}

	
}
