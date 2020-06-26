package models;

import java.sql.Timestamp;

public class Tweets implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private Integer tid;
	private Integer pid;
	private String uid;
	private Timestamp postDateTime;
	private String content;
	private Integer likes;
	private String profilePicture;
	private boolean isFollowed;
	private boolean isLikedByMe = false;

	public Tweets() {
	}

	public Integer getLikes() {
		return likes;
	}

	public void setLikes(Integer likes) {
		this.likes = likes;
	}

	public Integer getTid() {
		return this.tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getUid() {
		return this.uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public Timestamp getPostDateTime() {
		return this.postDateTime;
	}

	public void setPostDateTime(Timestamp postDateTime) {
		this.postDateTime = postDateTime;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public boolean getIsFollowed() {
		return this.isFollowed;
	}

	public void setIsFollowed(boolean isFollowed) {
		this.isFollowed = isFollowed;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}

	public boolean getIsLikedByMe() {
		return isLikedByMe;
	}

	public void setIsLikedByMe(boolean isLikedByMe) {
		this.isLikedByMe = isLikedByMe;
	}
}
