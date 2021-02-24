package ERPHO.model;

import java.sql.Date;

public class ProductStocks extends BaseModel{

	private int autoid;
	private Date expirydate;
	private int currentstock;
	private String mpack;
	private int mpsize;
	private float cp;
	private int purchaseqty;
	private String sudesc;
	private double stockprice;
	private float markup;
	private float sp;
	private String spdesc;
	private int spsize;
	private float stksp;
	private int sellqty;
	private int sunits;
	private double totalprice;
	private double purchaseprice;
	
	private String status;
	private String active;
	private String category;
	private int quantity;
	private String code;
	private int totalPrdStks;
	private int fromBranchId;
	private Date receivedDate;
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getAutoid() {
		return autoid;
	}
	public void setAutoid(int autoid) {
		this.autoid = autoid;
	}
	public Date getExpirydate() {
		return expirydate;
	}
	public void setExpirydate(Date expirydate) {
		this.expirydate = expirydate;
	}
	public int getCurrentstock() {
		return currentstock;
	}
	public void setCurrentstock(int currentstock) {
		this.currentstock = currentstock;
	}
	public String getMpack() {
		return mpack;
	}
	public void setMpack(String mpack) {
		this.mpack = mpack;
	}
	public int getMpsize() {
		return mpsize;
	}
	public void setMpsize(int mpsize) {
		this.mpsize = mpsize;
	}
	public float getCp() {
		return cp;
	}
	public void setCp(float cp) {
		this.cp = cp;
	}
	public int getPurchaseqty() {
		return purchaseqty;
	}
	public void setPurchaseqty(int purchaseqty) {
		this.purchaseqty = purchaseqty;
	}
	public String getSudesc() {
		return sudesc;
	}
	public void setSudesc(String sudesc) {
		this.sudesc = sudesc;
	}
	public double getStockprice() {
		return stockprice;
	}
	public void setStockprice(double stockprice) {
		this.stockprice = stockprice;
	}
	public float getMarkup() {
		return markup;
	}
	public void setMarkup(float markup) {
		this.markup = markup;
	}
	public float getSp() {
		return sp;
	}
	public void setSp(float sp) {
		this.sp = sp;
	}
	public String getSpdesc() {
		return spdesc;
	}
	public void setSpdesc(String spdesc) {
		this.spdesc = spdesc;
	}
	public int getSpsize() {
		return spsize;
	}
	public void setSpsize(int spsize) {
		this.spsize = spsize;
	}
	public float getStksp() {
		return stksp;
	}
	public void setStksp(float stksp) {
		this.stksp = stksp;
	}
	public int getSellqty() {
		return sellqty;
	}
	public void setSellqty(int sellqty) {
		this.sellqty = sellqty;
	}
	public int getSunits() {
		return sunits;
	}
	public void setSunits(int sunits) {
		this.sunits = sunits;
	}
	public double getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}
	public double getPurchaseprice() {
		return purchaseprice;
	}
	public void setPurchaseprice(double purchaseprice) {
		this.purchaseprice = purchaseprice;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getTotalPrdStks() {
		return totalPrdStks;
	}
	public void setTotalPrdStks(int totalPrdStks) {
		this.totalPrdStks = totalPrdStks;
	}
	public int getFromBranchId() {
		return fromBranchId;
	}
	public void setFromBranchId(int fromBranchId) {
		this.fromBranchId = fromBranchId;
	}
	public Date getReceivedDate() {
		return receivedDate;
	}
	public void setReceivedDate(Date receivedDate) {
		this.receivedDate = receivedDate;
	}
	
	
}
