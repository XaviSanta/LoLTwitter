package models;

import java.sql.Timestamp;

public class alikModel {

    private static final long serialVersionUID = 1L;
    private Integer tid;
    private String uid; // user who gives the like

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

}