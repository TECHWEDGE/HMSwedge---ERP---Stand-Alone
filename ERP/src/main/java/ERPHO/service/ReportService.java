package ERPHO.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import ERPHO.dao.impl.ReportDaoImpl;
import ERPHO.dao.impl.controllerDao;
import ERPHO.model.Branch;
import ERPHO.utils.Utils;

@Service
public class ReportService {

	private static final Logger logger = LoggerFactory.getLogger(ReportService.class);
	
	@Autowired
	private ReportDaoImpl reportImpl;
	
	@Autowired
	controllerDao hodao;
	
	@Autowired
	ServletContext context;
	
	@Autowired
	private ERPHO.model.Session session;
	
	private @Value("${reportPath}") String reportPath;
	private @Value("${restBaseUrl}") String restBaseUrl;
	
	private String getReportPath(String reportName) throws IOException {
		Resource resource = new ClassPathResource(reportName);
		return resource.getFile().getPath();
	}

	public byte[] getStockValidationReport(String fromDate, String toDate) throws Exception {
		logger.debug("getStockValidationReport service");
	    String reportTemplate = getReportPath("productstock.jrxml");
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getCurrentStockValidationReport(String fromDate, String toDate) throws Exception {
		logger.debug("getCurrentStockValidationReport service");
		String reportTemplate = getReportPath("productstock-current.jrxml");
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getExpiredStockValidationReport(String fromDate, String toDate) throws Exception {
		logger.debug("getExpiredStockValidationReport service");
		String reportTemplate = getReportPath("productstock-expired.jrxml");
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getZeroStockValidationReport(String fromDate, String toDate) throws Exception {
		logger.debug("getZeroStockValidationReport service");
		String reportTemplate = getReportPath("productstock-zero.jrxml");
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getPurchaseByInvoiceReport(String fromDate, String toDate, String supplierid) throws Exception {
		logger.debug("getPurchaseByInvoiceReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		if(supplierid.equals("All")) {
			reportTemplate = getReportPath("purchasebyinvoice-All.jrxml");
		}
		else {
			reportTemplate = getReportPath("purchasebyinvoice.jrxml");
			params.put("supplierid",supplierid);
		}
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getPurchasedByIdReport(String purchasesid) throws Exception {
		logger.debug("getPurchasedByIdReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("purchasesid",purchasesid);
		reportTemplate = getReportPath("purchasebyid.jrxml");
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getOrdersByInvoiceReport(String fromDate, String toDate, String supplierid) throws Exception {
		logger.debug("getOrdersByInvoiceReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		if(supplierid.equals("All")) {
			reportTemplate = getReportPath("ordersbyinvoice-All.jrxml");
		}
		else {
			params.put("supplierid",supplierid);
			reportTemplate = getReportPath("ordersbyinvoice.jrxml");
		}
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getOrdersByIdReport(String orderid) throws Exception {
		logger.debug("getOrdersByIdReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("orderid",orderid);
		reportTemplate = getReportPath("ordersbyid.jrxml");
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getSalesByInvoiceReport(String fromDate, String toDate) throws Exception {
		logger.debug("getSalesByInvoiceReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		reportTemplate = getReportPath("salesbyinvoice-All.jrxml");
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getSalesByCustomerReport(String fromDate, String toDate, String customerid) throws Exception {
		logger.debug("getSalesByCustomerReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		reportTemplate = getReportPath("salesbyinvoicecustomer.jrxml");
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		params.put("customerid",customerid);
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getSalesByPatientReport(String fromDate, String toDate, String patientid) throws Exception {
		logger.debug("getSalesByPatientReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		reportTemplate = getReportPath("salesbyinvoicepatient.jrxml");
		params.put("customerid",patientid);
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getSalesByIdReport(Integer autoid) throws Exception {
		logger.debug("getSalesByIdReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("autoid",autoid);
		reportTemplate = getReportPath("salesbyid.jrxml");
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getSalesByProduct(String fromDate, String toDate) throws Exception {
		logger.debug("getSalesByProduct service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		reportTemplate = getReportPath("salesbyproduct-All.jrxml");
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getSalesByProductCategory(String fromDate, String toDate, String productCategory) throws Exception {
		logger.debug("getSalesByProductCategory service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		params.put("productCategory",productCategory);
		reportTemplate = getReportPath("salesbyproductcategory.jrxml");
		
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getSalesByProductsReport(String fromDate, String toDate, List<String> autoid) throws Exception {
		logger.debug("getSalesByProductCategory service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		params.put("autoid",autoid);
		reportTemplate = getReportPath("salesbyproducts.jrxml");
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getSalesByProductsandCatgegoryReport(String fromDate, String toDate, String productCategory, List<String> autoid) throws Exception {
		logger.debug("getSalesByProductCategory service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		params.put("productCategory",productCategory);
		params.put("autoid",autoid);
		reportTemplate = getReportPath("salesbyproductsandcategory.jrxml");
		
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] orderReport(Integer autoid) throws Exception {
		logger.debug("orderReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("autoid",autoid);
		reportTemplate = getReportPath("orderreport.jrxml");
	//	reportTemplate = reportPath+ File.separator + "orderreport.jrxml";
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] purchaseEntryReport(Integer autoid) throws Exception {
		logger.debug("purchaseEntryReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("autoid",autoid);
		reportTemplate = getReportPath("purchaseentry.jrxml");
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] salesReport(Integer autoid) throws Exception {
		logger.debug("salesReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("autoid",autoid);
		reportTemplate = getReportPath("salesinvoice.jrxml");
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] dsalesReport(Integer autoid) throws Exception {
		logger.debug("salesReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("autoid",autoid);
		reportTemplate = getReportPath("dispensarysales.jrxml");
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public HashMap<String, Object> branchDetails(){
		List<Branch> listb = hodao.getBranch(session.getSsid());
		String realName = listb.get(0).getName();
		String realAddress = listb.get(0).getAddress();
		String realLogo = listb.get(0).getLogo();
		String realPath = context.getRealPath("/");
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("realPath",realPath);
		params.put("realName",realName);
		params.put("realAddress",realAddress);
		params.put("realLogo",realLogo);
		return params;
		
	}
	
	public byte[] getIncomeByDoctorReport(String fromDate, String toDate, String doctorid) throws Exception {
		logger.debug("getIncomeByDoctorReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		if(doctorid.equals("All")) {
			reportTemplate = getReportPath("incomebydoctor-All.jrxml");
		}
		else {
			params.put("doctorid",doctorid);
			reportTemplate = getReportPath("incomebydoctor.jrxml");
		}
		
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] getSalesDetailsByIdReport(Integer autoid) throws Exception {
		logger.debug("getSalesDetailsByIdReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("autoid",autoid);
		reportTemplate = getReportPath("salesDetailsByAutoid.jrxml");
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] branchWiseSalesReport(String fromDate, String toDate,String branchid) throws Exception {
		logger.debug("branchWiseSalesReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		params = branchDetails();
		if(branchid.equals("All")) 
			reportTemplate = getReportPath("AllBranchWiseSales.jrxml");
		else {
			params.put("branchid",branchid);
			reportTemplate = getReportPath("BranchWiseSales.jrxml");
		}
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] elapsedStocksReport(String toDate) throws Exception {
		logger.debug("elapsedStocksReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("toDate",toDate);
		reportTemplate = getReportPath("elapsedStocks.jrxml");
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] elapsedStocksByProductReport(String toDate) throws Exception {
		logger.debug("elapsedStocksByProductReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("toDate",toDate);
		reportTemplate = getReportPath("elapsedStocksByProduct.jrxml");
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] productWisePurchaseReport(Integer productId) throws Exception {
		logger.debug("branchWiseSalesReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		if(productId==0) 
			reportTemplate = getReportPath("productWisePurchase.jrxml");
		else {
			params.put("productId",productId);
			reportTemplate = getReportPath("productWisePurchaseById.jrxml");
		}
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] purchaseReport(String fromDate, String toDate) throws Exception {
		logger.debug("purchaseReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		params.put("fromDate",fromDate);
		params.put("toDate",toDate);
		reportTemplate = getReportPath("PurchaseReport.jrxml");
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
	public byte[] supplierWiseDetailsReport(Integer supplierId) throws Exception {
		logger.debug("supplierWiseDetailsReport service");
		String reportTemplate;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params = branchDetails();
		if(supplierId==0) {
			reportTemplate = getReportPath("SupplierWiseDetails.jrxml");
		}
		else {
			params.put("supplierId",supplierId);
			reportTemplate = getReportPath("SupplierWiseDetailsById.jrxml");
		}
		return reportImpl.generateReportAndStream(1L, 2, reportTemplate, params, reportPath+File.separator + "output"+File.separator + Utils.getAlphaNumericString(7)+".pdf");
	}
	
}
