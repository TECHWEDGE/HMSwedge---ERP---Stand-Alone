package ERPHO.dao.impl;

import java.util.List;

import ERPHO.model.Customer;
import ERPHO.model.IncomeByDoctor;
import ERPHO.model.Order;
import ERPHO.model.Product;
import ERPHO.model.ProductStocks;
import ERPHO.model.Purchase;
import ERPHO.model.Purchases;
import ERPHO.model.Sale;
import ERPHO.model.SaleDetails;
import ERPHO.model.Sales;

public interface ReportDao {
	
	List<ProductStocks> getAllStocks(String fromDate, String toDate);
	List<ProductStocks> getCurrentStocks(String fromDate, String toDate);
	List<ProductStocks> getExpiredStocks(String fromDate, String toDate);
	List<ProductStocks> getZeroStocks(String fromDate, String toDate);
	
	List<Purchases> getPurchaseBySupplier(String fromDate, String toDate, Integer supplierid);
	List<Purchases> getAllPurchasedProducts(String fromDate, String toDate);
	List<Purchases> getPurchasedById(Integer purchasesid);
	
	List<Order> getOrdersBySupplier(String fromDate, String toDate, Integer supplierid);
	List<Order> getAllOrders(String fromDate, String toDate);
	List<Order> getOrdersById(String orderid);
	
	List<Product> getProductCategory();
	List<Product> getProductsByCategory(String productCode,String product);
	List<Sales> getSalesByProduct(String fromDate, String toDate, String productCategory, String[] products);
	List<Sales> getSalesByCategory(String fromDate, String toDate, String productCategory);
	List<Sales> getAllSales(String fromDate, String toDate);
	List<Sales> getAllSalesErp(String fromDate, String toDate);
	List<Sales> getAllSalesByCustomer(String fromDate, String toDate);
	List<Sales> getAllSalesByPatient(String fromDate, String toDate);
	List<Sales> getAllSalesDetails(String fromDate, String toDate);
	List<Sales> getSalesByCustomer(String fromDate, String toDate, Integer customerid);
	List<Sales> getSalesByPatient(String fromDate, String toDate, Integer patientid);
	List<Sales> getSalesDetailsByInvoice(Integer autoid);
	
	List<Customer> getAllCustomers();
	List<IncomeByDoctor> incomeByDoctor(String fromDate, String toDate,String doctorid);
	List<SaleDetails> getSalesDetailsById(Integer salesId);
	List<IncomeByDoctor> incomeByAllDoctor(String fromDate, String toDate);
	List<Sale> branchWiseSalesData(String fromDate, String toDate, String branchid);
	List<ProductStocks> elapsedStocksData(String toDate);
	List<ProductStocks> elapsedStocksByProduct(String toDate);
	List<ProductStocks> productWisePurchaseData(Integer productId);
	List<Purchase> purchaseData(String fromDate,String toDate);
	List<Purchase> supplierWiseDetailsData(String supplierId);
}
