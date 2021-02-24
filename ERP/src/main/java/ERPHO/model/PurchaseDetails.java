package ERPHO.model;

import java.sql.Date;
import java.sql.Timestamp;

public class PurchaseDetails extends BaseModel{
private int autoid;
private int purchasesid;

private Date expirydate;
private String packdesc;
private int packsize;
private String singleunitdesc;
private int purchaseqty;
private double totalpurchaseprice;
private float unitcp;
private int stocknumber;
private double stockvaluepurchase;

public int getAutoid() {
	return autoid;
}
public void setAutoid(int autoid) {
	this.autoid = autoid;
}
public int getPurchasesid() {
	return purchasesid;
}
public void setPurchasesid(int purchasesid) {
	this.purchasesid = purchasesid;
}
public Date getExpirydate() {
	return expirydate;
}
public void setExpirydate(Date expirydate) {
	this.expirydate = expirydate;
}
public String getPackdesc() {
	return packdesc;
}
public void setPackdesc(String packdesc) {
	this.packdesc = packdesc;
}
public int getPacksize() {
	return packsize;
}
public void setPacksize(int packsize) {
	this.packsize = packsize;
}
public String getSingleunitdesc() {
	return singleunitdesc;
}
public void setSingleunitdesc(String singleunitdesc) {
	this.singleunitdesc = singleunitdesc;
}
public int getPurchaseqty() {
	return purchaseqty;
}
public void setPurchaseqty(int purchaseqty) {
	this.purchaseqty = purchaseqty;
}
public double getTotalpurchaseprice() {
	return totalpurchaseprice;
}
public void setTotalpurchaseprice(double totalpurchaseprice) {
	this.totalpurchaseprice = totalpurchaseprice;
}
public float getUnitcp() {
	return unitcp;
}
public void setUnitcp(float unitcp) {
	this.unitcp = unitcp;
}
public int getStocknumber() {
	return stocknumber;
}
public void setStocknumber(int stocknumber) {
	this.stocknumber = stocknumber;
}
public double getStockvaluepurchase() {
	return stockvaluepurchase;
}
public void setStockvaluepurchase(double stockvaluepurchase) {
	this.stockvaluepurchase = stockvaluepurchase;
}
}
