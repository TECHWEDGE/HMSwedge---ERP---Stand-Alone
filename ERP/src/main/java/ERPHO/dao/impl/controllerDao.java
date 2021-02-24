package ERPHO.dao.impl;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import ERPHO.model.Customer;
import ERPHO.model.Distribute;
import ERPHO.model.License;
import ERPHO.model.Manufacture;
import ERPHO.model.Order;
import ERPHO.model.OrderDetails;
import ERPHO.model.Product;
import ERPHO.model.ProductStocks;
import ERPHO.model.ProductStocksWrapper;
import ERPHO.model.Productprice;
import ERPHO.model.Productstock;
import ERPHO.model.Purchase;
import ERPHO.model.PurchaseDetails;
import ERPHO.model.Purchases;
import ERPHO.model.Sale;
import ERPHO.model.Sales;
import ERPHO.model.Spdiscount;
import ERPHO.model.Supply;
import ERPHO.model.TaxB;
import ERPHO.model.custDisc;
import ERPHO.model.quotation;
import ERPHO.model.Branch;

public interface controllerDao {

	void setTemplate(JdbcTemplate template);

	List<Manufacture> getM();

	//save manufacture
	int save(Manufacture m);
	public int updateManufacture(Manufacture m);

	// save supply master
	int saves(Supply s);
	
	public int updatesupply(Supply s);

	//To display manufacture list in supplier masters 
	List<Manufacture> getManufacturename();

	List<Manufacture> getManufacturename1();

	List<Manufacture> getcheckmname1(String name);

	//to display supplier list in supply
	List<Supply> getS();

	List<Supply> getSupplyname();

	List<Supply> getSupplyname1();

	List<Supply> getchecksname1(String name);

	// save customer
	int savec(Customer c, String table);
	public int updateCustomer(Customer c, String table);
	
	int savecd(Customer c, String table);
	int updateCustomerd(Customer c, String table);

	//getCustomer datails
	List<Customer> getCustomername(String table, String limitf);
	List<Customer> getCustomernamed(String table, String limitf);

	List<Customer> getCustomernameFilter(String table, String srch4, String srch5, String limitf);

	List<Customer> getCustomername1(String table);
	public List<Customer> getCustomername1d(String table);

	List<Customer> getCustomerId(String table);
	List<Customer> getCustomerIdd(String table);

	List<Customer> getcheckcphone(String phone, String table);
	List<Customer> getcheckcphoned(String phone, String table);

	//save product
	int savep(Product p);
	public int updateProduct(Product p) ;

	int updatesavep(Product p);

	//to display products on product master on page load
	List<Product> getP();

	List<Product> search();

	List<Product> search1();

	List<Product> search3(String limitf);

	List<Product> search3Filter(String srch2, String srch3, String limitf);

	List<Product> getcheckpcode(String code);

	List<Product> getcheckpname(String name);

	//,(select Batch from purchase where purchase.ean = product.prc),(select expDate from purchase where purchase.ean=product.prc),(select unit from purchase where purchase.ean=product.prc),(select unitprice from purchase where purchase.ean=product.prc),(select quantity from purchase where purchase.ean=product.prc),(select total from purchase where purchase.ean=product.prc)
	List<Product> searchProduct(String limitf);

	List<Product> searchProductFilter(String srch, String srch2, String limitf);

	List<Product> Reorder();

	// to display the products which are below re-order-level
	List<Product> searchRq();

	List<Purchase> getCurrentstks();

	List<Order> getorderId(int no, String table, Order o);

	List<Order> getorderDetails(int no, String limitf);

	List<Order> getorderDetailsFilter(int no, String srch3, String limitf);

	List<OrderDetails> getorderDetails1(String string, int no);

	//save order //
	/*int saveo(Order o, String name, String pack, String quantity, String stock, String ean, int no, int pid);

	int Updsaveo(Order o, String name, String pack, String quantity, String stock, String ean, int no, int pid);
   */
	void updateActive(String name);

	List<Sales> getinvId(Sale s, String table, int no);
	List<Sales> getinvIdd(Sale s, String table, int no);

	List<Sales> getinvId1(String table, int no, String limitf);
	List<Sales> getinvId1d(String table, int no, String limitf);

	List<Sales> getinvId1Filter(String table, int no, String srch, String limitf);

	List<Sales> getinvId1Filterd(String table, int no, String srch, String limitf);

	//list products in sale screen
	List<Purchase> getProducts(String table, int no);
	List<Purchase> getProductsd(String table, int no);
	//sales save 

	int savess(Sale s, String name, String batch, String expdate, String unit, String up, String qty1, String stk1,
			String price1, String mpack, String mdesc, String sudesc, String ean, String table, int no, int pid);

	List<TaxB> getTax();

	//special discounts
	List<Spdiscount> getSpdis();

	//display customer discounts
	List<custDisc> getCustDis();

	// to list branch orderid which have been ordered.
	List<Distribute> getBranchProducts();

	int saved(Distribute d);

	List<Distribute> getAllocation();

	List<Distribute> getBrdetails(Distribute d);

	int savequotation(quotation s, String name, String unit, String up, String qty1, String stk1, String price1);

	//get quotationid,customer on page load ;
	List<ERPHO.model.quotation> getquotation();

	//get corresponding quotations for each customer
	List<ERPHO.model.quotation> proformacust(quotation q);

	//get quotationid based on date
	List<ERPHO.model.quotation> getquotationid();

	List<ERPHO.model.quotation> updproforma(quotation q);

	//get history
	List<ERPHO.model.quotation> updhistory();

	// update status as mark complete or cancelled
	int updatestat(quotation s);

	List<Supply> getAllSuppliers();

	List<Order> getOrdersupplier(Order o);

	List<Purchase> getAllocationid(Purchase p, String table, int no);

	List<Purchases> getAllocationid1a(String table, int no, String limitf);
	List<Purchase> getAllocationid1ad(String table, int no, String limitf);

	List<Purchase> getAllocationid1aFilter(String table, int no, String srch3, String limitf);

	List<Purchase> getsupplyorder(String s, String limitf);

	List<Purchase> getsupplyorderFilter(String s, String srch, String srch2, String limitf);

	int savepurchase(Purchase p, String name, String batch, String expdate, String quantity, String unitprice,
			String discount, String free, String total, String ean1, String mpack, String mdesc, String sudesc, int no,
			int pid);

	int updateean(String name);

	int saveproductpriceho(Purchase p, String name, String batch, String unitprice, String sp);

	int updatecatho(String name, int no, int pid);
	// save product stocks

	int saveproductstockho(String ean1, String name, String batch, String expdate, String mpack, String mpsize,
			String cp, String prqty, String prprice, String qty, String sudesc, String stkpr, String markup, String sp,
			String spdesc, String spsize, String stksp, String sellqty, String sunits, String tprice, int no, int pid);

	int saveproductstockho1(String ean1, String name, String batch, String expdate, String mpack, String mpsize,
			String cp, String prqty, String prprice, String qty, String sudesc, String stkpr, String markup, String sp,
			String spdesc, String spsize, String stksp, String sellqty, String sunits, String tprice, String table,
			int no, int pid);
	int saveproductstockho1d(String ean1, String name, String batch, String expdate, String mpack, String mpsize,
			String cp, String prqty, String prprice, String qty, String sudesc, String stkpr, String markup, String sp,
			String spdesc, String spsize, String stksp, String sellqty, String sunits, String tprice, String table,
			int no, int pid);

	int updatecatho2(String name, int no, int pid);

	int updatecatho1(String name);

	int saveproductstockho2(String ean1, String name, String batch, String expdate, String mpack, String mpsize,
			String cp, String prqty, String prprice, String qty, String sudesc, String stkpr, String markup, String sp,
			String spdesc, String spsize, String stksp, String sellqty, String sunits, String tprice, String table,
			int no, int pid);

	// 898 to 950 product stocks for dispensary
	int dsavepurchase(Purchase p, String name, String batch, String expdate, String quantity, String unitprice,
			String discount, String free, String total, String ean1, String mpack, String mdesc, String sudesc, int no);

	int dupdateean(String name);

	int dupdatecatho(String name, int no);
	// save product stocks

	int dsaveproductstockho(String ean1, String name, String batch, String expdate, String mpack, String mpsize,
			String cp, String prqty, String prprice, String qty, String sudesc, String stkpr, String markup, String sp,
			String spdesc, String spsize, String stksp, String sellqty, String sunits, String tprice, int no);

	int dupdatecatho2(String name, int no);

	int dupdatecatho1(String name);

	List<Productprice> getInfoSearch();

	List<Product> getInfoSearch1(String limitf);

	List<Product> getInfoSearch1Filter(String srch, String limitf);

	List<Productprice> getproSearch(Productprice ps);

	int saveprPr(Productprice ps);

	List<Productstock> getstockSearch(Productstock ps, String table, int no);

	List<Productstock> getInfoStkSearch(String table, int no);
	List<ProductStocks> getInfoStkSearchd(String table, int no);

	List<ProductStocks> getInfoStkSearch1(String table, int no);

	int psStatus(int uqkval);

	int psStatus2(int uqkval);


	List<Sale> getsaleInv(String invoice, String table, String table1, int no);

	List<Purchase> getPrpur(String invoice, String table);
	List<Purchase> getPrpurd(String invoice, String table);

	//select pr.Batch,pr.expDate,unit,unitprice,(select sum(currentstock) from productstock where productstock.batch=purchase.Batch),total,(select sum(sp) from productprice where productprice.batch=purchase.Batch) from purchase where productName='"+user3+"' and quantity > 0
	List<ProductStocks> getinvprods(int pid, String table, String table1, int no);
	List<ProductStocks> getinvprodsd(int pid, String table, String table1, int no);

	//List<Sale> getinvprods1(String user3, String table);

	int[] updateCurrentStocks(List<ProductStocks> stocksList, String tablename);
	int updated(int pid, String stk, String batch, String table, int no);
	/*
	public List<Distribute> getBranchProductsDetails() {
		return template.query("select branchid,productName,unit,quantity from distribute",new RowMapper<Distribute>(){  
	        public Distribute mapRow(ResultSet rs, int row) throws SQLException {
	        	Distribute d = new Distribute();
	        	d.setBranchid(rs.getString(1));
	        	d.setAllocationid(rs.getString(2));
	        	/*d.setProductName(rs.getString(1));
	        	d.setBatch(rs.getString(2));
	        	d.setExpdate(rs.getString(3));
	        	d.setUnit(rs.getString(4));
	        	d.setUnitprice(rs.getString(5));
	        	d.setAllocationqty(rs.getString(6));
	        	d.setReqqty(rs.getString(7));
	
	        return d;
	        }
		});
	}
	
	*/
	int deletepr(int autoid);

	List<Sale> getsaleReports(String frdate, String edate, String table);
	
	List<Sale> getsaleReportsd(String frdate, String edate, String table);

	List<ProductStocks> getBatdet(String batch, String table, int pid, int id);
	List<Productstock> getBatdetd(String batch, String table, String pname, int id);
	int[] updateorpr(List<Integer> productList, int no);

	int updatereord(String name, String val, int no);



	List<Productstock> getBranchPRS(int no, int pid);

	int updBranchdet(int no, int ssid, int fid, String table);

	int updTransfer(int no, String batch, String expdate, String cp, String sp, String stkstrans, String table);

	int updstkinbr(int pid, int ssid, String string2, String batch, String table);

	int savessd(Sale s, String name, String batch, String expdate, String unit, String up, String qty1, String stk1,
			String price1, String mpack, String mdesc, String sudesc, String ean, String table, int no, int pid);

	List<Branch> getBranch();

	List<License> getLusers();

	List<Branch> getBranch(int no);
	
	int[] updateorderdetails(List<OrderDetails> updateList);

	int[] saveorderdetails(List<OrderDetails> insertList);

	int updateorder(Order o);

	int saveorder(Order o);

	int deleteOrder(int autoid);

	int[] savePurchaseDetails(List<PurchaseDetails> insertList);

	int savePurchases(Purchases purchase);

	int[] savePurchaseStocks(List<ProductStocks> insertList);

	int[] updateReorderFlag(List<Integer> reorderLevelList);

	int[] updateProductStocks(List<ProductStocks> udpateList, String tablename);

	List<ProductStocks> fetchSearchResults(ProductStocksWrapper wrapper, String tablename);
	
	int saveSaleDetails(Sales sale, String tablename, String subtablename);

	List<Sales> fetchSaleRecords(int autoid, String tablename, String subtablename, String subtablename2);

	int transferStocks(List<ProductStocks> stocksList) throws Exception;

	List<Product> searchProducts(String productName, String productCode);

	List<Branch> getAllBranch();

	List<Branch> getOtherBranch(int no);
	

}