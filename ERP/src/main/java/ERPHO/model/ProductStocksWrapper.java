package ERPHO.model;

import java.sql.Date;
import java.util.List;

public class ProductStocksWrapper extends BaseModel{
/*
 * adding pid,name,category,expdate,batch for search 
 */
private String category;
private Date expirydate;
private String code;
private Date toexpirydate;
private int limit;
private List<ProductStocks> productStockList;

public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public Date getExpirydate() {
	return expirydate;
}
public void setExpirydate(Date expirydate) {
	this.expirydate = expirydate;
}
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
}
public List<ProductStocks> getProductStockList() {
	return productStockList;
}
public void setProductStockList(List<ProductStocks> productStockList) {
	this.productStockList = productStockList;
}
public Date getToexpirydate() {
	return toexpirydate;
}
public void setToexpirydate(Date toexpirydate) {
	this.toexpirydate = toexpirydate;
}
public int getLimit() {
	return limit;
}
public void setLimit(int limit) {
	this.limit = limit;
}

}
