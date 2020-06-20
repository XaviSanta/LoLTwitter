package models;
import java.sql.Timestamp;

public class Tweets implements java.io.Serializable {

	 private static final long serialVersionUID = 1L;

	 private Integer tid;
	 private String uid;
	 private Timestamp postDateTime;
	 private String content;

	 public Tweets() {
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

}
