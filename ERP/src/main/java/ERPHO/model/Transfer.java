package ERPHO.model;

import java.sql.Timestamp;

public class Transfer {
private int pid;
private int fid;
private String batch;
private Timestamp expdate;
private int stkstrans;
private float cp;
private float sp;

public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public int getFid() {
	return fid;
}
public void setFid(int fid) {
	this.fid = fid;
}
public String getBatch() {
	return batch;
}
public void setBatch(String batch) {
	this.batch = batch;
}
public Timestamp getExpdate() {
	return expdate;
}
public void setExpdate(Timestamp expdate) {
	this.expdate = expdate;
}
public int getStkstrans() {
	return stkstrans;
}
public void setStkstrans(int stkstrans) {
	this.stkstrans = stkstrans;
}
public float getCp() {
	return cp;
}
public void setCp(float cp) {
	this.cp = cp;
}
public float getSp() {
	return sp;
}
public void setSp(float sp) {
	this.sp = sp;
}


}
