package ERPHO.model;

public class Branch {
private int id;
private String name;
private String address;
private String logo;
private String type;
private String df2;
private String df3;
private String iop;
private int ssid;
private int pid;

public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public int getSsid() {
	return ssid;
}
public void setSsid(int ssid) {
	this.ssid = ssid;
}
public String getIop() {
	return iop;
}
public void setIop(String iop) {
	this.iop = iop;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getLogo() {
	return logo;
}
public void setLogo(String logo) {
	this.logo = logo;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getDf2() {
	return df2;
}
public void setDf2(String df2) {
	this.df2 = df2;
}
public String getDf3() {
	return df3;
}
public void setDf3(String df3) {
	this.df3 = df3;
}


}
