package ERPHO.model;

import java.sql.Timestamp;
import java.util.List;

public class Purchases extends BaseModel{
private int autoid;
private String allocationid;
private Timestamp receiveddate;
private int supplierid;
private String supplier;
private String supplierinvoice;
private double grandtotal;

private List<PurchaseDetails> purchaseDetailsList;

public int getAutoid() {
	return autoid;
}

public void setAutoid(int autoid) {
	this.autoid = autoid;
}

public String getAllocationid() {
	return allocationid;
}

public void setAllocationid(String allocationid) {
	this.allocationid = allocationid;
}

public Timestamp getReceiveddate() {
	return receiveddate;
}

public void setReceiveddate(Timestamp receiveddate) {
	this.receiveddate = receiveddate;
}

public int getSupplierid() {
	return supplierid;
}

public void setSupplierid(int supplierid) {
	this.supplierid = supplierid;
}

public String getSupplier() {
	return supplier;
}

public void setSupplier(String supplier) {
	this.supplier = supplier;
}

public String getSupplierinvoice() {
	return supplierinvoice;
}

public void setSupplierinvoice(String supplierinvoice) {
	this.supplierinvoice = supplierinvoice;
}

public double getGrandtotal() {
	return grandtotal;
}

public void setGrandtotal(double grandtotal) {
	this.grandtotal = grandtotal;
}

public List<PurchaseDetails> getPurchaseDetailsList() {
	return purchaseDetailsList;
}

public void setPurchaseDetailsList(List<PurchaseDetails> purchaseDetailsList) {
	this.purchaseDetailsList = purchaseDetailsList;
}


}
