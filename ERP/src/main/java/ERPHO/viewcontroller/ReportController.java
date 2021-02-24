package ERPHO.viewcontroller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import ERPHO.dao.impl.ReportDao;
import ERPHO.service.ReportService;
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

@RestController
@RequestMapping("/reports")
@EnableWebMvc
public class ReportController{
	
	private @Value("${limitf}") String limitf;
	
	@Autowired
	private ReportDao reportDao;
	
	class dates{
		Date fromDate;
		Date toDate;
		String show;
	}
	
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	@Autowired
	ReportService reportService;
	
	@GetMapping(path= {"/getAllStocks"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ProductStocks>> getAllStocks(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate) {
		return new ResponseEntity<List<ProductStocks>>(reportDao.getAllStocks(fromDate,toDate), HttpStatus.OK);
	}
	
	@GetMapping(path={"/getCurrentStocks"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ProductStocks>> getCurrentStocks(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate) {
		return new ResponseEntity<List<ProductStocks>>(reportDao.getCurrentStocks(fromDate,toDate), HttpStatus.OK);
	}
	
	@GetMapping(path={"/getZeroStocks"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ProductStocks>> getZeroStocks(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate) {
		return new ResponseEntity<List<ProductStocks>>(reportDao.getZeroStocks(fromDate,toDate), HttpStatus.OK);
	}
	
	@GetMapping(path={"/getExpiredStocks"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ProductStocks>> getExpiredStocks(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate) {
		return new ResponseEntity<List<ProductStocks>>(reportDao.getExpiredStocks(fromDate,toDate), HttpStatus.OK);
	}

	@GetMapping(path = "/getStockValidationReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getStockValidationReport(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, HttpServletResponse response) {
		logger.debug("getStockValidationReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getStockValidationReport(fromDate,toDate);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/getCurrentStockValidationReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getCurrentStockValidationReport(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, HttpServletResponse response) {
		logger.debug("getCurrentStockValidationReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getCurrentStockValidationReport(fromDate,toDate);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/getExpiredStockValidationReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getExpiredStockValidationReport(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, HttpServletResponse response) {
		logger.debug("getExpiredStockValidationReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getExpiredStockValidationReport(fromDate,toDate);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/getZeroStockValidationReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getZeroStockValidationReport(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, HttpServletResponse response) {
		logger.debug("getZeroStockValidationReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getZeroStockValidationReport(fromDate,toDate);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path= {"/getPurchaseBySupplier"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Purchases>> getPurchaseBySupplier(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, @RequestParam("supplierid") Integer supplierid) {
		return new ResponseEntity<List<Purchases>>(reportDao.getPurchaseBySupplier(fromDate,toDate,supplierid), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getAllPurchasedProducts"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Purchases>> getAllPurchasedProducts(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate) {
		return new ResponseEntity<List<Purchases>>(reportDao.getAllPurchasedProducts(fromDate,toDate), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getPurchasedById"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Purchases>> getPurchasedById(@RequestParam("purchasesid") Integer purchasesid) {
		return new ResponseEntity<List<Purchases>>(reportDao.getPurchasedById(purchasesid), HttpStatus.OK);
	}
	
	@GetMapping(path = "/getPurchaseByInvoiceReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getPurchaseByInvoiceReport(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, @RequestParam("supplierid") String supplierid, HttpServletResponse response) {
		logger.debug("getPurchaseByInvoiceReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getPurchaseByInvoiceReport(fromDate,toDate,supplierid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/getPurchasedByIdReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getPurchasedByIdReport(@RequestParam("purchasesid") String purchasesid, HttpServletResponse response) {
		logger.debug("getPurchasedByIdReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getPurchasedByIdReport(purchasesid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}

	@GetMapping(path= {"/getOrdersBySupplier"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Order>> getOrdersBySupplier(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, @RequestParam("supplierid") Integer supplierid) {
		return new ResponseEntity<List<Order>>(reportDao.getOrdersBySupplier(fromDate,toDate,supplierid), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getAllOrders"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Order>> getAllOrders(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate) {
		return new ResponseEntity<List<Order>>(reportDao.getAllOrders(fromDate,toDate), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getOrdersById"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Order>> getOrdersById(@RequestParam("orderid") String orderid) {
		return new ResponseEntity<List<Order>>(reportDao.getOrdersById(orderid), HttpStatus.OK);
	}
	
	@GetMapping(path = "/getOrdersByInvoiceReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getOrdersByInvoiceReport(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, @RequestParam("supplierid") String supplierid, HttpServletResponse response) {
		logger.debug("getOrdersByInvoiceReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getOrdersByInvoiceReport(fromDate,toDate,supplierid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/getOrdersByIdReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getOrdersByIdReport(@RequestParam("orderid") String orderid, HttpServletResponse response) {
		logger.debug("getOrdersByIdReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getOrdersByIdReport(orderid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path= {"/getProductCategory"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Product>> getProductCategory() {
		return new ResponseEntity<List<Product>>(reportDao.getProductCategory(), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getProductsByCategory"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Product>> getProductsByCategory(@RequestParam("productCode") String productCode,@RequestParam("product") String product) {
		return new ResponseEntity<List<Product>>(reportDao.getProductsByCategory(productCode,product), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getSalesByProduct"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Sales>> getSalesByProduct(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, @RequestParam("productCategory") String productCategory,  @RequestParam("products[]") String[] products) {
		return new ResponseEntity<List<Sales>>(reportDao.getSalesByProduct(fromDate, toDate, productCategory, products), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getSalesByCategory"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Sales>> getSalesByCategory(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, @RequestParam("productCategory") String productCategory) {
		return new ResponseEntity<List<Sales>>(reportDao.getSalesByCategory(fromDate, toDate, productCategory), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getAllSales"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Sales>> getAllSales(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate) {
		return new ResponseEntity<List<Sales>>(reportDao.getAllSales(fromDate, toDate), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getAllSalesByCustomer"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Sales>> getAllSalesByCustomer(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate) {
		return new ResponseEntity<List<Sales>>(reportDao.getAllSalesByCustomer(fromDate, toDate), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getAllSalesByPatient"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Sales>> getAllSalesByPatient(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate) {
		return new ResponseEntity<List<Sales>>(reportDao.getAllSalesByPatient(fromDate, toDate), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getSalesByInvoice"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Sales>> getSalesDetailsByInvoice(@RequestParam("autoid") Integer autoid) {
		return new ResponseEntity<List<Sales>>(reportDao.getSalesDetailsByInvoice(autoid), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getAllCustomers"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Customer>> getAllCustomers() {
		return new ResponseEntity<List<Customer>>(reportDao.getAllCustomers(), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getAllSalesDetails"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Sales>> getAllSalesDetails(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate) {
		return new ResponseEntity<List<Sales>>(reportDao.getAllSalesDetails(fromDate, toDate), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getSalesByCustomer"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Sales>> getSalesByCustomer(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, @RequestParam("customerid") Integer customerid) {
		return new ResponseEntity<List<Sales>>(reportDao.getSalesByCustomer(fromDate, toDate, customerid), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getSalesByPatient"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Sales>> getSalesByPatient(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, @RequestParam("patientid") Integer patientid) {
		return new ResponseEntity<List<Sales>>(reportDao.getSalesByPatient(fromDate, toDate, patientid), HttpStatus.OK);
	}
	
	@GetMapping(path = "/getSalesByInvoiceReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getSalesByInvoiceReport(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, HttpServletResponse response) {
		logger.debug("getSalesByInvoiceReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getSalesByInvoiceReport(fromDate,toDate);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/getSalesByCustomerReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getSalesByCustomerReport(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, @RequestParam("customerid") String customerid, HttpServletResponse response) {
		logger.debug("getSalesByCustomerReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getSalesByCustomerReport(fromDate,toDate,customerid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/getSalesByPatientReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getSalesByPatientReport(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, @RequestParam("patientid") String patientid, HttpServletResponse response) {
		logger.debug("getSalesByPatientReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getSalesByPatientReport(fromDate,toDate,patientid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/getSalesByIdReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getSalesByIdReport(@RequestParam("autoid") Integer autoid, HttpServletResponse response) {
		logger.debug("getSalesdByIdReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getSalesByIdReport(autoid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/getSalesByProductReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getSalesByProduct(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, HttpServletResponse response) {
		logger.debug("getSalesdByIdReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getSalesByProduct(fromDate, toDate);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/getSalesByProductCategoryReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getSalesByProductCategory(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, @RequestParam("productCategory") String productCategory, HttpServletResponse response) {
		logger.debug("getSalesByProductCategoryReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getSalesByProductCategory(fromDate, toDate, productCategory);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/getSalesByProductsReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getSalesByProductsReport(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, @RequestParam("autoid") List<String> autoid, HttpServletResponse response) {
		logger.debug("getSalesByProductCategoryReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getSalesByProductsReport(fromDate, toDate, autoid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/getSalesByProductsandCatgegoryReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getSalesByProductsandCatgegoryReport(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, String productCategory, @RequestParam("autoid") List<String> autoid, HttpServletResponse response) {
		logger.debug("getSalesByProductCategoryReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getSalesByProductsandCatgegoryReport(fromDate, toDate,productCategory, autoid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/orderReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void orderReport(@RequestParam("autoid") Integer autoid, HttpServletResponse response) {
		logger.debug("orderReport");
		byte[] bytes = null;
		try {
			bytes = reportService.orderReport(autoid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/purchaseEntryReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void purchaseEntryReport(@RequestParam("autoid") Integer autoid, HttpServletResponse response) {
		logger.debug("purchaseEntryReport");
		byte[] bytes = null;
		try {
			bytes = reportService.purchaseEntryReport(autoid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/salesReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void salesReport(@RequestParam("autoid") Integer autoid, HttpServletResponse response) {
		logger.debug("purchaseEntryReport");
		byte[] bytes = null;
		try {
			bytes = reportService.salesReport(autoid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/dsalesReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void dsalesReport(@RequestParam("autoid") Integer autoid, HttpServletResponse response) {
		logger.debug("dsalesReport");
		byte[] bytes = null;
		try {
			bytes = reportService.dsalesReport(autoid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	private void streamResponse(HttpServletResponse response, byte[] bytes) {
		HttpHeaders headers = new HttpHeaders();

	    headers.add("Cache-Control", "no-cache, no-store, must-revalidate");

	    headers.add("Pragma", "no-cache");

	    headers.add("Expires", "0");
	    response.setContentType(MediaType.APPLICATION_PDF_VALUE);

	    try {
			OutputStream out = response.getOutputStream();
			out.write(bytes);
            out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/stockvaluation", method = RequestMethod.GET)
	public ModelAndView stopricing(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("stockvaluationreport");
	}
	
	@RequestMapping(value = "/purchasebyinvoice", method = RequestMethod.GET)
	public ModelAndView purchasebyinvoice(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("purchasebyinvoice");
	}
	
	@RequestMapping(value = "/orderreport", method = RequestMethod.GET)
	public ModelAndView orderreport(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("orderreport");
	}
	
	@RequestMapping(value = "/salesbyproduct", method = RequestMethod.GET)
	public ModelAndView salesbyproduct(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("salesbyproduct");
	}
	
	@RequestMapping(value = "/salesbyinvoice", method = RequestMethod.GET)
	public ModelAndView salesbyinvoice(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("salesbyinvoice");
	}
	
	@GetMapping(path= {"/incomeByDoctor"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<IncomeByDoctor>> incomeByDoctor(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate,@RequestParam("doctorid") String doctorid) {
		return new ResponseEntity<List<IncomeByDoctor>>(reportDao.incomeByDoctor(fromDate,toDate,doctorid), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/incomeByAllDoctor"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<IncomeByDoctor>> incomeByAllDoctor(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate) {
		return new ResponseEntity<List<IncomeByDoctor>>(reportDao.incomeByAllDoctor(fromDate,toDate), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/getSalesDetailsById"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<SaleDetails>> getSalesDetailsById(@RequestParam("salesid") Integer salesid) {
		return new ResponseEntity<List<SaleDetails>>(reportDao.getSalesDetailsById(salesid), HttpStatus.OK);
	}
	
	@GetMapping(path = "/getIncomeByDoctorReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getIncomeByDoctorReport(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, @RequestParam("doctorid") String doctorid, HttpServletResponse response) {
		logger.debug("getIncomeByDoctorReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getIncomeByDoctorReport(fromDate,toDate,doctorid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/getSalesDetailsByIdReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void getSalesDetailsByIdReport(@RequestParam("autoid") Integer autoid, HttpServletResponse response) {
		logger.debug("getSalesDetailsByIdReport");
		byte[] bytes = null;
		try {
			bytes = reportService.getSalesDetailsByIdReport(autoid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@GetMapping(path = "/branchWiseSalesReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void branchWiseSalesReport(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate, @RequestParam("branchid") String branchid, HttpServletResponse response) {
		logger.debug("branchWiseSalesReport");
		byte[] bytes = null;
		try {
			bytes = reportService.branchWiseSalesReport(fromDate,toDate,branchid);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@RequestMapping(value = "/branchWiseSales", method = RequestMethod.GET)
	public ModelAndView branchWiseSales(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("branchWiseSales");
	}
	
	@GetMapping(path= {"/branchWiseSalesData"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Sale>> branchWiseSalesData(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate,  @RequestParam("branchid") String branchid) {
		return new ResponseEntity<List<Sale>>(reportDao.branchWiseSalesData(fromDate,toDate,branchid), HttpStatus.OK);
	}
	
	@GetMapping(path = "/elapsedStocksReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void elapsedStocksReport(@RequestParam("toDate") String toDate, HttpServletResponse response) {
		logger.debug("elapsedStocksReport");
		byte[] bytes = null;
		try {
			bytes = reportService.elapsedStocksReport(toDate);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@RequestMapping(value = "/elapsedStocks", method = RequestMethod.GET)
	public ModelAndView elapsedStocks(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("elapsedStocks");
	}
	
	@GetMapping(path= {"/elapsedStocksData"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ProductStocks>> elapsedStocksData(@RequestParam("toDate") String toDate) {
		return new ResponseEntity<List<ProductStocks>>(reportDao.elapsedStocksData(toDate), HttpStatus.OK);
	}
	
	@GetMapping(path= {"/elapsedStocksByProduct"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ProductStocks>> elapsedStocksByProduct(@RequestParam("toDate") String toDate) {
		return new ResponseEntity<List<ProductStocks>>(reportDao.elapsedStocksByProduct(toDate), HttpStatus.OK);
	}
	
	@GetMapping(path = "/elapsedStocksByProductReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void elapsedStocksByProductReport(@RequestParam("toDate") String toDate, HttpServletResponse response) {
		logger.debug("elapsedStocksByProductReport");
		byte[] bytes = null;
		try {
			bytes = reportService.elapsedStocksByProductReport(toDate);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@RequestMapping(value = "/productWisePurchase", method = RequestMethod.GET)
	public ModelAndView productWisePurchase(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("productWisePurchase");
	}
	
	@GetMapping(path= {"/productWisePurchaseData"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ProductStocks>> productWisePurchaseData(@RequestParam("productId") Integer productId) {
		return new ResponseEntity<List<ProductStocks>>(reportDao.productWisePurchaseData(productId), HttpStatus.OK);
	}
	
	@GetMapping(path = "/productWisePurchaseReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void productWisePurchaseReport(@RequestParam("productId") Integer productId, HttpServletResponse response) {
		logger.debug("productWisePurchaseReport");
		byte[] bytes = null;
		try {
			bytes = reportService.productWisePurchaseReport(productId);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@RequestMapping(value = "/purchase", method = RequestMethod.GET)
	public ModelAndView purchase(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("purchaseReport");
	}
	
	@GetMapping(path= {"/purchaseData"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Purchase>> purchaseData(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate) {
		return new ResponseEntity<List<Purchase>>(reportDao.purchaseData(fromDate,toDate), HttpStatus.OK);
	}
	
	@GetMapping(path = "/purchaseReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void purchaseReport(@RequestParam("fromDate") String fromDate, @RequestParam("toDate") String toDate,HttpServletResponse response) {
		logger.debug("purchaseReport");
		byte[] bytes = null;
		try {
			bytes = reportService.purchaseReport(fromDate,toDate);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
	@RequestMapping(value = "/supplierWiseDetails", method = RequestMethod.GET)
	public ModelAndView supplierWiseDetails(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("supplierWiseDetails");
	}
	
	@GetMapping(path= {"/supplierWiseDetailsData"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Purchase>> supplierWiseDetailsData(@RequestParam("supplierid") String supplierId) {
		return new ResponseEntity<List<Purchase>>(reportDao.supplierWiseDetailsData(supplierId), HttpStatus.OK);
	}
	
	@GetMapping(path = "/supplierWiseDetailsReport", produces = {MediaType.APPLICATION_PDF_VALUE})
	public @ResponseBody void supplierWiseDetailsReport(@RequestParam("supplierid") Integer supplierId,HttpServletResponse response) {
		logger.debug("supplierWiseDetailsReport");
		byte[] bytes = null;
		try {
			bytes = reportService.supplierWiseDetailsReport(supplierId);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		streamResponse(response, bytes);
	}
	
}
