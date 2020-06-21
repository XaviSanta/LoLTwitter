package models;

public class alikModel {
    private static final long serialVersionUID = 1L;
    private Integer tid;
    private String uid; // user who gives the like
    private String comment;

    public alikModel() {

    }
    public Integer getTid() {
        return tid;
    }
    public void setTid(Integer tid) {
        this.tid = tid;
    }
    public String getUid() {
        return uid;
    }
    public void setUid(String uid) {
        this.uid = uid;
    }
    public void setComment(String comment) 
    {
    	this.comment = comment;
    }
    public String getComment() 
    {
    	return comment;
    }
    
}
