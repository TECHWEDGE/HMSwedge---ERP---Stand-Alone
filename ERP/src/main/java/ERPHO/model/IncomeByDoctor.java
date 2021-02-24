package ERPHO.model;

public class IncomeByDoctor {
	
	private Integer autoid;
	private String invoice;
	private String fileno;
	private String titems;
	private String gtotal;
	private String pid;
	private String docid;
	
	public Integer getAutoid() {
		return autoid;
	}
	public void setAutoid(Integer autoid) {
		this.autoid = autoid;
	}
	public String getInvoice() {
		return invoice;
	}
	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}
	public String getFileno() {
		return fileno;
	}
	public void setFileno(String fileno) {
		this.fileno = fileno;
	}
	public String getTitems() {
		return titems;
	}
	public void setTitems(String titems) {
		this.titems = titems;
	}
	public String getGtotal() {
		return gtotal;
	}
	public void setGtotal(String gtotal) {
		this.gtotal = gtotal;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getDocid() {
		return docid;
	}
	public void setDocid(String docid) {
		this.docid = docid;
	}
	
}
