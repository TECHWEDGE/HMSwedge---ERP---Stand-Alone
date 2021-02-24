package ERPHO.model;

import java.sql.Date;
import java.util.List;

public class Sales extends BaseModel {
	
    private int autoid;
	private String invoice;
	private Date invoicedate;
	private float cdiscount;
	private String fileno;
	private int titems;
	private double subt;
	private float tax;
	private float discount;
	private double gtotal;
	private Customer customer;
	private List<SaleDetails> saledetailsList;
	private String createdby;
	private String isPatient;
	
	public String getIsPatient() {
		return isPatient;
	}
	public void setIsPatient(String isPatient) {
		this.isPatient = isPatient;
	}
	public int getAutoid() {
		return autoid;
	}
	public void setAutoid(int autoid) {
		this.autoid = autoid;
	}
	public String getInvoice() {
		return invoice;
	}
	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}
	public Date getInvoicedate() {
		return invoicedate;
	}
	public void setInvoicedate(Date invoicedate) {
		this.invoicedate = invoicedate;
	}
	public float getCdiscount() {
		return cdiscount;
	}
	public void setCdiscount(float cdiscount) {
		this.cdiscount = cdiscount;
	}
	public String getFileno() {
		return fileno;
	}
	public void setFileno(String fileno) {
		this.fileno = fileno;
	}
	public int getTitems() {
		return titems;
	}
	public void setTitems(int titems) {
		this.titems = titems;
	}
	public double getSubt() {
		return subt;
	}
	public void setSubt(double subt) {
		this.subt = subt;
	}
	public float getTax() {
		return tax;
	}
	public void setTax(float tax) {
		this.tax = tax;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public double getGtotal() {
		return gtotal;
	}
	public void setGtotal(double gtotal) {
		this.gtotal = gtotal;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public List<SaleDetails> getSaledetailsList() {
		return saledetailsList;
	}
	public void setSaledetailsList(List<SaleDetails> saledetailsList) {
		this.saledetailsList = saledetailsList;
	}
	public String getCreatedby() {
		return createdby;
	}
	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}
	
	
}
