package ERPHO.model;

import java.sql.Date;

public class SaleDetails extends BaseModel{
	
private Product product;
private Date expirydate;
private int quantitysold;
private float unitprice;
private int totalquantity;
private int stock;
private double total;
private String spack;
private int spsize;
private String sudesc;
private int salesautoid;
public Product getProduct() {
	return product;
}
public void setProduct(Product product) {
	this.product = product;
}
public Date getExpirydate() {
	return expirydate;
}
public void setExpirydate(Date expirydate) {
	this.expirydate = expirydate;
}
public float getUnitprice() {
	return unitprice;
}
public void setUnitprice(float unitprice) {
	this.unitprice = unitprice;
}
public int getStock() {
	return stock;
}
public void setStock(int stock) {
	this.stock = stock;
}
public double getTotal() {
	return total;
}
public void setTotal(double total) {
	this.total = total;
}
public String getSpack() {
	return spack;
}
public void setSpack(String spack) {
	this.spack = spack;
}
public int getSpsize() {
	return spsize;
}
public void setSpsize(int spsize) {
	this.spsize = spsize;
}
public String getSudesc() {
	return sudesc;
}
public void setSudesc(String sudesc) {
	this.sudesc = sudesc;
}
public int getSalesautoid() {
	return salesautoid;
}
public void setSalesautoid(int salesautoid) {
	this.salesautoid = salesautoid;
}
public int getQuantitysold() {
	return quantitysold;
}
public void setQuantitysold(int quantitysold) {
	this.quantitysold = quantitysold;
}
public int getTotalquantity() {
	return totalquantity;
}
public void setTotalquantity(int totalquantity) {
	this.totalquantity = totalquantity;
}


}
