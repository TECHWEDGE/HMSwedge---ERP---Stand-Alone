package ERPHO.dao.impl;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringJoiner;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hms.helper.QueryHelper;
import com.itextpdf.text.pdf.hyphenation.TernaryTree.Iterator;
import com.sharedmodules.model.Patient;

import ERPHO.model.Customer;
import ERPHO.model.IncomeByDoctor;
import ERPHO.model.Order;
import ERPHO.model.OrderDetails;
import ERPHO.model.Product;
import ERPHO.model.ProductStocks;
import ERPHO.model.Purchase;
import ERPHO.model.PurchaseDetails;
import ERPHO.model.Purchases;
import ERPHO.model.Sale;
import ERPHO.model.SaleDetails;
import ERPHO.model.Sales;
import ERPHO.model.Supply;
import ERPHO.report.ClientReport;
import ERPHO.utils.Utils;

@Repository
public class ReportDaoImpl extends QueryHelper implements ReportDao {
	
	private static final Logger logger = LoggerFactory.getLogger(ReportDaoImpl.class);
	
	@Autowired
	private ClientReport reportGen;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public static String QUERY_PATH = "report-controller";
	
	protected ReportDaoImpl() {
		super("/queries/" + QUERY_PATH + ".yml");
	}
	
	public byte[] generateReportAndStream(Long id, int types, String reportTemplate,
			HashMap<String, Object> mapParamaters, String outputPath) {
		logger.debug("generateReport id:" + id + " types:" + types + " reportYemplates:" + " mapParams " + mapParamaters);
		byte[] bytes = null;
		try {
			
			Connection con = jdbcTemplate.getDataSource().getConnection();
			bytes = reportGen.generateAndStream(reportTemplate, con, mapParamaters, outputPath);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bytes;
	}
	
	@Override
	public List<ProductStocks> getAllStocks(String fromDate, String toDate) {
		String sql = getQuery("getAllStocks");
		return jdbcTemplate.query(sql,new Object[] {fromDate, toDate},stockValidationMapping());
	}

	@Override
	public List<ProductStocks> getCurrentStocks(String fromDate, String toDate) {
		String sql = getQuery("getCurrentStocks");
		return jdbcTemplate.query(sql,new Object[] {fromDate, toDate},stockValidationMapping());
	}
	
	@Override
	public List<ProductStocks> getZeroStocks(String fromDate, String toDate) {
		String sql = getQuery("getZeroStocks");
		return jdbcTemplate.query(sql,new Object[] {fromDate, toDate},stockValidationMapping());
	}

	@Override
	public List<ProductStocks> getExpiredStocks(String fromDate, String toDate) {
		String sql = getQuery("getExpiredStocks");
		return jdbcTemplate.query(sql,new Object[] {fromDate, toDate},stockValidationMapping());
	}
	
	private RowMapper<ProductStocks> stockValidationMapping(){
		return new RowMapper<ProductStocks>(){  
	        public ProductStocks mapRow(ResultSet rs, int row) throws SQLException {   
				ProductStocks ps = new ProductStocks();
				ps.setCode(rs.getString("code"));
				ps.setName(rs.getString("name"));
				ps.setBatch(rs.getString("batch"));
				ps.setCurrentstock(rs.getInt("currentstock"));
				ps.setExpirydate(rs.getDate("expdate"));
				ps.setCategory(rs.getString("category"));
				ps.setMpack(rs.getString("mpack"));
				ps.setMpsize(rs.getInt("mpsize"));
				ps.setCp(rs.getFloat("cp"));
				ps.setPurchaseqty(rs.getInt("prqty"));
				ps.setSudesc(rs.getString("sudesc"));
				ps.setStockprice(rs.getInt("stkpr"));
				ps.setMarkup(rs.getFloat("markup"));
				ps.setSp(rs.getInt("sp"));
				ps.setSpdesc(rs.getString("spdesc"));
				ps.setSpsize(rs.getInt("spsize"));
				ps.setStksp(rs.getInt("stksp"));
				ps.setSellqty(rs.getInt("sellqty"));
				ps.setSunits(rs.getInt("sunits"));
				ps.setTotalprice(rs.getDouble("tprice"));
				ps.setPurchaseprice(rs.getDouble("prprice"));
				ps.setPid(rs.getInt("pid"));
				ps.setStatus(rs.getString("active"));
				ps.setAutoid(rs.getInt("autoid"));
				return ps;
	        }
		};
	};
	
	@Override
	public List<Purchases> getPurchaseBySupplier(String fromDate, String toDate, Integer supplierid) {
		String sql = getQuery("getPurchasesBySupplier");
		return jdbcTemplate.query(sql,new Object[] {supplierid, fromDate, toDate},purchasesMapping());
	}
	
	@Override
	public List<Purchases> getAllPurchasedProducts(String fromDate, String toDate){
		String sql = getQuery("getAllPurchases");
		return jdbcTemplate.query(sql,new Object[] {fromDate, toDate},purchasesMapping());
	}
	
	@Override
	public List<Purchases> getPurchasedById(Integer purchasesid){
		String sql = getQuery("getPurchasesById");
		return jdbcTemplate.query(sql,new Object[] {purchasesid},purchaseDetailsMapping());
	}
	
	private RowMapper<Purchases> purchaseDetailsMapping(){
		return new RowMapper<Purchases>(){  
	        public Purchases mapRow(ResultSet rs, int row) throws SQLException {   
	        	
	        	Purchases p = new Purchases();
	        	p.setAutoid(rs.getInt("autoid"));
	        	p.setAllocationid(rs.getString("allocationid"));
	        	p.setReceiveddate(rs.getTimestamp("receiveddate"));
	        	p.setSupplierid(rs.getInt("supplierid"));
	        	p.setSupplier(rs.getString("supplier"));
	        	p.setSupplierinvoice(rs.getString("supplierInvoice"));
	        	p.setGrandtotal(rs.getDouble("grandTotal"));
	        	p.setName(rs.getString("productcode"));
	        	
	        	PurchaseDetails pd = new PurchaseDetails();
	        	List<PurchaseDetails> lpd = new ArrayList<PurchaseDetails>();
	        	pd.setPurchasesid(rs.getInt("purchasesid"));
	        	pd.setBatch(rs.getString("batch"));
	        	pd.setPackdesc(rs.getString("packdesc"));
	        	pd.setPacksize(rs.getInt("packsize"));
	        	pd.setSingleunitdesc(rs.getString("singleunitdesc"));
	        	pd.setPurchaseqty(rs.getInt("purchaseqty"));
	        	pd.setTotalpurchaseprice(rs.getDouble("totalpurchaseprice"));
	        	pd.setUnitcp(rs.getFloat("unitcp"));
	        	pd.setStocknumber(rs.getInt("stocknumber"));
	        	pd.setStockvaluepurchase(rs.getDouble("stockvaluepurchase"));
	        	pd.setExpirydate(rs.getDate("expirydate"));
	        	pd.setName(rs.getString("productname"));
	        	lpd.add(pd);
	        	p.setPurchaseDetailsList(lpd);
				return p;
	        }
		};
	};
	
	private RowMapper<Purchases> purchasesMapping(){
		return new RowMapper<Purchases>(){  
	        public Purchases mapRow(ResultSet rs, int row) throws SQLException {   
	        	Purchases p = new Purchases();
	        	p.setAutoid(rs.getInt("autoid"));
	        	p.setAllocationid(rs.getString("allocationid"));
	        	p.setReceiveddate(rs.getTimestamp("receiveddate"));
	        	p.setSupplierid(rs.getInt("supplierid"));
	        	p.setSupplier(rs.getString("supplier"));
	        	p.setSupplierinvoice(rs.getString("supplierInvoice"));
	        	p.setGrandtotal(rs.getDouble("grandTotal"));
				return p;
	        }
		};
	};
	
	@Override
	public List<Order> getOrdersBySupplier(String fromDate, String toDate, Integer supplierid) {
		String sql = getQuery("getOrdersBySupplier");
		return jdbcTemplate.query(sql,new Object[] {supplierid, fromDate, toDate},ordersMapping());
	}
	
	@Override
	public List<Order> getAllOrders(String fromDate, String toDate){
		String sql = getQuery("getAllOrders");
		return jdbcTemplate.query(sql,new Object[] {fromDate, toDate},ordersMapping());
	}
	
	@Override
	public List<Order> getOrdersById(String orderid){
		String sql = getQuery("getOrdersById");
		return jdbcTemplate.query(sql,new Object[] {orderid},orderDetailsMapping());
	}
	
	private RowMapper<Order> orderDetailsMapping(){
		return new RowMapper<Order>(){  
	        public Order mapRow(ResultSet rs, int row) throws SQLException {   
	        	
	        	Order o = new Order();
	        	o.setAutoid(rs.getInt("autoid"));
	        	o.setOrderid(rs.getString("orderid"));
	        	o.setOrderDate(rs.getDate("orderDate"));
	        	o.setSupplierid(rs.getInt("supplierid"));
	        	o.setSupplier(rs.getString("supplierName"));
	        	o.setDelivery(rs.getString("delivery"));
	        	o.setCount(rs.getInt("count"));
	        	o.setBranchid(rs.getInt("branchid"));
	        	o.setAuthor(rs.getString("author"));
	        	
	        	OrderDetails od = new OrderDetails();
	        	List<OrderDetails> lod = new ArrayList<OrderDetails>();
	        	
	        	od.setEan(rs.getString("productCode"));
	        	od.setProductName(rs.getString("productName"));
	        	od.setUnit(rs.getString("unit"));
	        	od.setQuantity(rs.getInt("quantity"));
	        	lod.add(od);
	        	o.setOrderDetailsList(lod);
				return o;
	        }
		};
	};
	
	private RowMapper<Order> ordersMapping(){
		return new RowMapper<Order>(){  
	        public Order mapRow(ResultSet rs, int row) throws SQLException {   
	        	Order o = new Order();
	        	o.setAutoid(rs.getInt("autoid"));
	        	o.setOrderid(rs.getString("orderid"));
	        	o.setOrderDate(rs.getDate("orderDate"));
	        	o.setSupplierid(rs.getInt("supplierid"));
	        	o.setSupplier(rs.getString("supplierName"));
	        	o.setDelivery(rs.getString("delivery"));
	        	o.setCount(rs.getInt("count"));
	        	o.setBranchid(rs.getInt("branchid"));
	        	o.setAuthor(rs.getString("author"));
				return o;
	        }
		};
	};
	
	@Override
	public List<Product> getProductCategory() {
		String sql = getQuery("getAllProductCategories");
		return jdbcTemplate.query(sql, new Object[] { }, new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product p = new Product();
				p.setPc(rs.getString("pc"));
				return p;
			}
		});
	}
	
	@Override
	public List<Product> getProductsByCategory(String productCode, String product) {
		String sql = getQuery("getProductsByCategory");
		
		if(productCode.equals("All")) {
			sql = sql.replace("pr.pc = ? and", "");
			return jdbcTemplate.query(sql, new Object[] {Utils.getLikeParamValue(product, false), 20 }, new RowMapper<Product>() {
				public Product mapRow(ResultSet rs, int row) throws SQLException {
					Product p = new Product();
					p.setPid(rs.getInt("pid"));
					p.setName(rs.getString("name"));
					return p;
				}
			});
		}
		else {
			return jdbcTemplate.query(sql, new Object[] { productCode,Utils.getLikeParamValue(product, false),20 }, new RowMapper<Product>() {
				public Product mapRow(ResultSet rs, int row) throws SQLException {
					Product p = new Product();
					p.setPid(rs.getInt("pid"));
					p.setName(rs.getString("name"));
					return p;
				}
			});
		}
	}
	
	@Override
	public List<Sales> getSalesByProduct(String fromDate, String toDate, String productCategory, String[] products) {
		//String sql = getQuery("getSalesByProduct");

		String productIds = Stream.of(products).collect(Collectors.joining(",", "", ""));
		String sql ="select s.autoid, sd.pid productCode, p.name productName, s.invoice, sd.spack packaging, sd.batch, "
				+ "sd.quantitysold, sd.unitprice, s.subt subtotal, s.tax, s.gtotal, sd.expirydate from sale s "
				+ "join saledetails sd on sd.salesautoid = s.autoid join product p on p.pid = sd.pid "
				+ "where p.pc = '"+productCategory+"' and p.pid in ("+productIds+") and s.invoicedate between '"+fromDate+"' and '"+toDate+"'";
		
		if(productCategory.equals("All")) {
			sql = sql.replace("p.pc = '"+productCategory+"' and", "");
		}
		/*	String result = IntStream.of(products)
                .mapToObj(Integer::toString)
                .collect(Collectors.joining(","));*/
		/*List<Integer> s = new ArrayList<Integer>();
		for(int var:products){
			s.add(var);
		}*/
		
		return jdbcTemplate.query(sql, new Object[] {},salesMapping());
	}
	
	@Override
	public List<Sales> getSalesByCategory(String fromDate, String toDate, String productCategory) {
		String sql = getQuery("getSalesByCategory");
		return jdbcTemplate.query(sql, new Object[] { productCategory, fromDate, toDate }, salesMapping());
	}
	
	@Override
	public List<Sales> getAllSales(String fromDate, String toDate) {
		String sql = getQuery("getAllSales");
		try {
		return jdbcTemplate.query(sql, new Object[] { fromDate, toDate }, new RowMapper<Sales>() {
			public Sales mapRow(ResultSet rs, int row) throws SQLException {
				Sales s= new Sales();
				s.setAutoid(rs.getInt("autoid"));
	        	s.setInvoice(rs.getString("invoice"));
	        	s.setSubt(rs.getDouble("subtotal"));
	        	s.setTax(rs.getFloat("tax"));
	        	s.setGtotal(rs.getDouble("gtotal"));
	        	s.setIsPatient(rs.getString("isPatient"));
	        	Customer c = new Customer();
	        	c.setName(rs.getString("customerName"));
	        	c.setCustomer(rs.getString("patientName"));
	        	s.setCustomer(c);
				return s;
			}
		});
		}
		catch(Exception e) {
			return getAllSalesErp(fromDate,toDate);
		}
	}
	
	@Override
	public List<Sales> getAllSalesErp(String fromDate, String toDate) {
		String sql = getQuery("getAllSalesErp");
		return jdbcTemplate.query(sql, new Object[] { fromDate, toDate }, new RowMapper<Sales>() {
			public Sales mapRow(ResultSet rs, int row) throws SQLException {
				Sales s= new Sales();
				s.setAutoid(rs.getInt("autoid"));
	        	s.setInvoice(rs.getString("invoice"));
	        	s.setSubt(rs.getDouble("subtotal"));
	        	s.setTax(rs.getFloat("tax"));
	        	s.setGtotal(rs.getDouble("gtotal"));
	        	s.setIsPatient(rs.getString("isPatient"));
	        	Customer c = new Customer();
	        	c.setName(rs.getString("customerName"));
	        	c.setCustomer(rs.getString(null));
	        	s.setCustomer(c);
				return s;
			}
			
		});
	}
	
	@Override
	public List<Sales> getAllSalesByCustomer(String fromDate, String toDate) {
		String sql = getQuery("getAllSalesByCustomer");
		return jdbcTemplate.query(sql, new Object[] { fromDate, toDate }, new RowMapper<Sales>() {
			public Sales mapRow(ResultSet rs, int row) throws SQLException {
				Sales s= new Sales();
				s.setAutoid(rs.getInt("autoid"));
	        	s.setInvoice(rs.getString("invoice"));
	        	s.setSubt(rs.getDouble("subtotal"));
	        	s.setTax(rs.getFloat("tax"));
	        	s.setGtotal(rs.getDouble("gtotal"));
	        	s.setIsPatient(rs.getString("isPatient"));
	        	Customer c = new Customer();
	        	c.setName(rs.getString("customerName"));
	        	s.setCustomer(c);
				return s;
			}
			
		});
	}
	
	@Override
	public List<Sales> getAllSalesByPatient(String fromDate, String toDate) {
		String sql = getQuery("getAllSalesByPatient");
		return jdbcTemplate.query(sql, new Object[] { fromDate, toDate }, new RowMapper<Sales>() {
			public Sales mapRow(ResultSet rs, int row) throws SQLException {
				Sales s= new Sales();
				s.setAutoid(rs.getInt("autoid"));
	        	s.setInvoice(rs.getString("invoice"));
	        	s.setSubt(rs.getDouble("subtotal"));
	        	s.setTax(rs.getFloat("tax"));
	        	s.setGtotal(rs.getDouble("gtotal"));
	        	s.setIsPatient(rs.getString("isPatient"));
	        	Customer c = new Customer();
	        	c.setName(rs.getString("customerName"));
	        	s.setCustomer(c);
				return s;
			}
			
		});
	}
	
	@Override
	public List<Sales> getSalesByCustomer(String fromDate, String toDate, Integer customerid) {
		String sql = getQuery("getSalesByCustomer");
		return jdbcTemplate.query(sql, new Object[] { fromDate, toDate , customerid}, new RowMapper<Sales>() {
			public Sales mapRow(ResultSet rs, int row) throws SQLException {
				Sales s= new Sales();
				s.setAutoid(rs.getInt("autoid"));
	        	s.setInvoice(rs.getString("invoice"));
	        	s.setSubt(rs.getDouble("subtotal"));
	        	s.setTax(rs.getFloat("tax"));
	        	s.setGtotal(rs.getDouble("gtotal"));
	        	Customer c = new Customer();
	        	c.setName(rs.getString("customerName"));
	        	s.setCustomer(c);
				return s;
			}
			
		});
	}
	
	@Override
	public List<Sales> getSalesByPatient(String fromDate, String toDate, Integer patientid) {
		String sql = getQuery("getSalesByPatient");
		return jdbcTemplate.query(sql, new Object[] { fromDate, toDate , patientid}, new RowMapper<Sales>() {
			public Sales mapRow(ResultSet rs, int row) throws SQLException {
				Sales s= new Sales();
				s.setAutoid(rs.getInt("autoid"));
	        	s.setInvoice(rs.getString("invoice"));
	        	s.setSubt(rs.getDouble("subtotal"));
	        	s.setTax(rs.getFloat("tax"));
	        	s.setGtotal(rs.getDouble("gtotal"));
	        	Customer c = new Customer();
	        	c.setName(rs.getString("customerName"));
	        	s.setCustomer(c);
				return s;
			}
			
		});
	}
	
	@Override
	public List<Sales> getAllSalesDetails(String fromDate, String toDate) {
		String sql = getQuery("getAllSalesDetails");
		return jdbcTemplate.query(sql, new Object[] { fromDate, toDate },salesMapping());
	}
	
	private RowMapper<Sales> salesMapping(){
		return new RowMapper<Sales>(){  
	        public Sales mapRow(ResultSet rs, int row) throws SQLException {   
	        	Sales s= new Sales();
	        	SaleDetails sd= new SaleDetails();
	        	Product p= new Product();
	        	List<SaleDetails> lsd = new ArrayList<SaleDetails>();
	        	
	        	p.setPid(rs.getInt("productCode"));
	        	p.setName(rs.getString("productName"));
	        	
	        	sd.setSpack(rs.getString("packaging"));
	        	sd.setBatch(rs.getString("batch"));
	        	sd.setQuantitysold(rs.getInt("quantitysold"));
	        	sd.setUnitprice(rs.getFloat("unitprice"));
	        	sd.setExpirydate(rs.getDate("expirydate"));
	        	sd.setProduct(p);
	        	lsd.add(sd);
	        	
	        	s.setAutoid(rs.getInt("autoid"));
	        	s.setInvoice(rs.getString("invoice"));
	        	s.setSubt(rs.getDouble("subtotal"));
	        	s.setTax(rs.getFloat("tax"));
	        	s.setGtotal(rs.getDouble("gtotal"));
	        	s.setSaledetailsList(lsd);
	        	
				return s;
	        }
		};
	};
	
	@Override
	public List<Sales> getSalesDetailsByInvoice(Integer invoice) {
		String sql = getQuery("getSalesDetailsByInvoice");
		return jdbcTemplate.query(sql, new Object[] {invoice}, salesMapping());
	}
	
	@Override
	public List<Customer> getAllCustomers() {
		String sql = getQuery("getAllCustomers");
		return jdbcTemplate.query(sql, new Object[] {}, new RowMapper<Customer>() {
			public Customer mapRow(ResultSet rs, int row) throws SQLException {
				Customer c = new Customer();
				c.setCid(rs.getInt("cid"));
				c.setCustomer(rs.getString("customer"));
				c.setName(rs.getString("name"));
				return c;
			}
		});
	}
	
	@Override
	public List<IncomeByDoctor> incomeByDoctor(String fromDate, String toDate,String doctorid){
		String sql = getQuery("incomeByDoctor");
		return jdbcTemplate.query(sql,new Object[] {fromDate, toDate, doctorid}, new RowMapper<IncomeByDoctor>() {
			public IncomeByDoctor mapRow(ResultSet rs, int row) throws SQLException {
				IncomeByDoctor doc = new IncomeByDoctor();
				doc.setAutoid(rs.getInt("autoid"));
				doc.setInvoice(rs.getString("invoice"));
				doc.setFileno(rs.getString("fileno"));
				doc.setTitems(rs.getString("titems"));
				doc.setGtotal(rs.getString("gtotal"));
				doc.setPid(rs.getString("pid"));
				doc.setDocid(rs.getString("docid"));
				return doc;
			}
		});
	}
	
	@Override
	public List<IncomeByDoctor> incomeByAllDoctor(String fromDate, String toDate){
		String sql = getQuery("incomeByAllDoctor");
		return jdbcTemplate.query(sql,new Object[] {fromDate,toDate}, new RowMapper<IncomeByDoctor>() {
			public IncomeByDoctor mapRow(ResultSet rs, int row) throws SQLException {
				IncomeByDoctor doc = new IncomeByDoctor();
				doc.setAutoid(rs.getInt("autoid"));
				doc.setInvoice(rs.getString("invoice"));
				doc.setFileno(rs.getString("fileno"));
				doc.setTitems(rs.getString("titems"));
				doc.setGtotal(rs.getString("gtotal"));
				doc.setPid(rs.getString("pid"));
				doc.setDocid(rs.getString("docid"));
				return doc;
			}
		});
	}
	
	@Override
	public List<SaleDetails> getSalesDetailsById(Integer salesId){
		String sql = getQuery("getSalesDetailsById");
		return jdbcTemplate.query(sql,new Object[] {salesId}, new RowMapper<SaleDetails>() {
			public SaleDetails mapRow(ResultSet rs, int row) throws SQLException {
				SaleDetails doc = new SaleDetails();
				/*
				 * doc.setAutoid(rs.getInt("autoid")); doc.setInvoice(rs.getString("invoice"));
				 * doc.setFileno(rs.getString("fileno")); doc.setTitems(rs.getString("titems"));
				 * doc.setGtotal(rs.getString("gtotal")); doc.setPid(rs.getString("pid"));
				 * doc.setDocid(rs.getString("docid"));
				 */
				return doc;
			}
		});
	}
	
	@Override
	public List<Sale> branchWiseSalesData(String fromDate, String toDate, String branchid){
		String sql = getQuery("branchWiseSales");
		if(!branchid.equals("All")) {
			sql = sql.concat(" and b.id="+branchid);
		}
		return jdbcTemplate.query(sql,new Object[] {fromDate,toDate}, new RowMapper<Sale>() {
			public Sale mapRow(ResultSet rs, int row) throws SQLException {
				Sale sale = new Sale();
				sale.setGender(rs.getString("branch"));
				sale.setInvoice(rs.getString("invoice"));
				if(rs.getString("isPatient")=="true")
					sale.setCustName(rs.getString("patient"));
				else
					sale.setCustName(rs.getString("customer"));
				sale.setSubt(rs.getString("total"));
				sale.setDiscount(rs.getString("discount"));
				sale.setTax(rs.getString("tax"));
				sale.setGtotal(rs.getString("gtotal"));
				return sale;
			}
		});
	}
	
	@Override
	public List<ProductStocks> elapsedStocksData(String toDate){
		String sql = getQuery("elapsedStocks");
		return jdbcTemplate.query(sql,new Object[] {toDate}, new RowMapper<ProductStocks>() {
			public ProductStocks mapRow(ResultSet rs, int row) throws SQLException {
				ProductStocks ps = new ProductStocks();
				ps.setBatch(rs.getString("batch"));
				ps.setExpirydate(rs.getDate("expdate"));
				ps.setStockprice(rs.getDouble("stkpr"));
				return ps;
			}
		});
	}
	
	@Override
	public List<ProductStocks> elapsedStocksByProduct(String toDate){
		String sql = getQuery("elapsedStocksByProduct");
		return jdbcTemplate.query(sql,new Object[] {toDate}, new RowMapper<ProductStocks>() {
			public ProductStocks mapRow(ResultSet rs, int row) throws SQLException {
				ProductStocks ps = new ProductStocks();
				ps.setPid(rs.getInt("pid"));
				ps.setName(rs.getString("name"));
				ps.setCode(rs.getString("prc"));
				ps.setExpirydate(rs.getDate("expdate"));
				ps.setStockprice(rs.getDouble("stkpr"));
				ps.setMpsize(rs.getInt("mpsize"));
				ps.setCurrentstock(rs.getInt("currentstock"));
				ps.setCp(rs.getFloat("cp"));
				ps.setSp(rs.getFloat("sp"));
				ps.setBatch(rs.getString("batch"));
				return ps;
			}
		});
	}
	
	@Override
	public List<ProductStocks> productWisePurchaseData(Integer productId){
		String sql = getQuery("productWisePurchase");
		if(productId==0) 
			sql = sql + " group by pd.pid";
		else
			sql = "select pr.pid,pr.name,pr.prc,s.name supplier,p.autoid purchaseId,pd.batch,pd.packsize mpack,pd.purchaseqty prqty,pd.unitcp unitprice,pd.totalpurchaseprice totalPrice," + 
					"  p.receiveddate from purchasedetails pd join purchases p on p.autoid=pd.purchasesid " + 
					"  join product pr on pr.pid = pd.pid join supply s on s.sid = p.supplierid where pd.pid="+productId;
		return jdbcTemplate.query(sql,new Object[] {}, new RowMapper<ProductStocks>() {
			public ProductStocks mapRow(ResultSet rs, int row) throws SQLException {
				ProductStocks ps = new ProductStocks();
				ps.setPid(rs.getInt("pid"));
				ps.setName(rs.getString("name"));
				ps.setCode(rs.getString("prc"));
				ps.setSudesc(rs.getString("supplier"));
				ps.setBatch(rs.getString("batch"));
				ps.setMpack(rs.getString("mpack"));
				ps.setQuantity(rs.getInt("prqty"));
				ps.setStockprice(rs.getDouble("unitprice"));
				ps.setTotalprice(rs.getDouble("totalPrice"));
				ps.setReceivedDate(rs.getDate("receiveddate"));
				return ps;
			}
		});
	}
	
	@Override
	public List<Purchase> purchaseData(String fromDate,String toDate){
		String sql = getQuery("purchase");;
		return jdbcTemplate.query(sql,new Object[] {fromDate,toDate}, new RowMapper<Purchase>() {
			public Purchase mapRow(ResultSet rs, int row) throws SQLException {
				Purchase p = new Purchase();
				p.setAllocationid(rs.getString("allocationid"));
				p.setSupplier(rs.getString("supplier"));
				p.setProductCode(rs.getString("prc"));
				p.setProductName(rs.getString("productName"));
				p.setBatch(rs.getString("batch"));
				p.setMpack(rs.getString("packsize"));
				p.setExpDate(rs.getString("expirydate"));
				p.setUnitPrice(rs.getString("unitcp"));
				p.setQuantity(rs.getString("purchaseqty"));
				p.setTotal(rs.getString("total"));
				return p;
			}
		});
	}
	
	@Override
	public List<Purchase> supplierWiseDetailsData(String supplierId){
		String sql = getQuery("supplierWiseDetails");
		if(supplierId.equals("All"))
			sql = sql+ " group by pd.pid";
		else
			sql = sql+" where s.sid = "+supplierId+" group by pd.pid";
		return jdbcTemplate.query(sql,new Object[] {}, new RowMapper<Purchase>() {
			public Purchase mapRow(ResultSet rs, int row) throws SQLException {
				Purchase p = new Purchase();
				p.setSupplier(rs.getString("supplier"));
				p.setAllocationid(rs.getString("allocationid"));
				p.setReceiveddate(rs.getString("receiveddate"));
				p.setProductName(rs.getString("productName"));
				p.setMpack(rs.getString("packsize"));
				p.setProductCode(rs.getString("prc"));
				p.setBatch(rs.getString("batch"));
				p.setQuantity(rs.getString("purchaseqty"));
				p.setTotal(rs.getString("total"));
				return p;
			}
		});
	}
}
