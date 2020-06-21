package models;

public class Follower {
	private static final long serialVersionUID = 1L;
	
	private String uid;
	private String fid;
	
	public String getUid() {
		 return this.uid;
	}
	
	public void setUid(String uid) {
		this.uid = uid;
	}
	
	public String getFid() {
		return fid;
	}
	
	public void setFid(String fid) {
		this.fid = fid;
	}
}
