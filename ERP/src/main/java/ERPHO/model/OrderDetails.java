package ERPHO.model;

public class OrderDetails extends BaseModel{

private String ean;
private String productName;
private String unit;
private int quantity;
private int stks;
private int autoid;
private int orderautoid;

public String getEan() {
	return ean;
}
public void setEan(String ean) {
	this.ean = ean;
}
public String getProductName() {
	return productName;
}
public void setProductName(String productName) {
	this.productName = productName;
}
public String getUnit() {
	return unit;
}
public void setUnit(String unit) {
	this.unit = unit;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}

public int getStks() {
	return stks;
}
public void setStks(int stks) {
	this.stks = stks;
}
public int getAutoid() {
	return autoid;
}
public void setAutoid(int autoid) {
	this.autoid = autoid;
}
public int getOrderautoid() {
	return orderautoid;
}
public void setOrderautoid(int orderautoid) {
	this.orderautoid = orderautoid;
}



}
