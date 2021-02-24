package ERPHO.model;

import java.sql.Date;
import java.util.List;

public class Order extends BaseModel{
private String orderid;
private Date orderDate;
private String delivery;
private String author; 
private String supplier;
private int autoid;
private int supplierid;
private int count;
private List<OrderDetails> orderDetailsList;

public String getOrderid() {
	return orderid;
}
public void setOrderid(String orderid) {
	this.orderid = orderid;
}
public Date getOrderDate() {
	return orderDate;
}
public void setOrderDate(Date orderDate) {
	this.orderDate = orderDate;
}
public String getDelivery() {
	return delivery;
}
public void setDelivery(String delivery) {
	this.delivery = delivery;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getSupplier() {
	return supplier;
}
public void setSupplier(String supplier) {
	this.supplier = supplier;
}
public int getAutoid() {
	return autoid;
}
public void setAutoid(int autoid) {
	this.autoid = autoid;
}
public int getSupplierid() {
	return supplierid;
}
public void setSupplierid(int supplierid) {
	this.supplierid = supplierid;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public List<OrderDetails> getOrderDetailsList() {
	return orderDetailsList;
}
public void setOrderDetailsList(List<OrderDetails> orderDetailsList) {
	this.orderDetailsList = orderDetailsList;
}
}
