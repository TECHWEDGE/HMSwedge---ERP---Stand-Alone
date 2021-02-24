package ERPHO.viewcontroller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.hms.utils.Utils;

import ERPHO.dao.impl.controllerDao;
import ERPHO.model.Customer;
import ERPHO.model.Distribute;
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
import ERPHO.model.SaleDetails;
import ERPHO.model.Sales;
import ERPHO.model.Spdiscount;
import ERPHO.model.Supply;
import ERPHO.model.TaxB;
import ERPHO.model.custDisc;
import ERPHO.model.quotation;
import com.sharedmodules.model.*;
import ERPHO.model.Branch;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Controller
public class econtroller {

	private @Value("${limitf}") String limitf;
	private @Value("${restBaseUrl}") String restBaseUrl;

	@Autowired
	controllerDao hodao;

	// ManufactDao dao;
	@Autowired
	ServletContext context;
	@Autowired
	private ERPHO.model.Session session;

	public String getLimitf() {
		return limitf;
	}

	public void setLimitf(String limitf) {
		this.limitf = limitf;
	}

	// redirection to manufacture master
	private JasperReport jr;

	@RequestMapping(value = "/hmspharma", method = RequestMethod.GET)
	public ModelAndView HMSpharma(@ModelAttribute("m") Manufacture m) {
		return new ModelAndView("hmspharma");
	}

	@RequestMapping(value = "/hmspharma1", method = RequestMethod.GET)
	public ModelAndView HMSpharma1(@ModelAttribute("m") Manufacture m) {

		return new ModelAndView("hmspharma1");
	}

	@RequestMapping(value = "/manufactureho", method = RequestMethod.GET)
	// values that may not be required because of autoincrement PK column
	// in this method
	// List<Manufacture> list1=hodao.getM(); returns the max ID. I am assuming UI is
	// incrementing the mid and sending it to save Manufacture
	public ModelAndView manufacture(@ModelAttribute("m") Manufacture m) {
		List<Manufacture> list = hodao.getManufacturename();
		//List<Manufacture> list1 = hodao.getM();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		//model.put("list1", list1);

		return new ModelAndView("Manufactentry", "model", model);
	}

	// redirection to supplier master
	@RequestMapping("/supplierho")
	public ModelAndView viewemp() {
		List<Manufacture> list = hodao.getManufacturename1();
		List<Supply> list1 = hodao.getSupplyname1();
		List<Supply> list2 = hodao.getS();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("list1", list1);
		model.put("list2", list2);
		return new ModelAndView("supplyentry", "model", model);
	}

	// saving manufacture masters
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("s") Manufacture s) {
		int savem = 0;
		savem = s.getMid() > 0 ? hodao.updateManufacture(s) : hodao.save(s);
		ModelAndView mav = new ModelAndView();
		if (savem > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:manufactureho.html");

		}

		else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:manufactureho.html");
		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/manufactureho.html");
		return mav;// will redirect to viewemp request mapping
	}

	// updating manufacture masters
	@RequestMapping(value = "/updateManufacture", method = RequestMethod.POST)
	public ModelAndView updateManufacture(@ModelAttribute("s") Manufacture s) {
		int savem = 0;
		savem = hodao.updateManufacture(s);
		ModelAndView mav = new ModelAndView();
		if (savem > 0) {
			mav.addObject("message", "The record has been updated sucessfully");
			mav.setViewName("redirect:manufactureho.html");

		}

		else {
			mav.addObject("message", "Record could not be updated successfully ");
			mav.setViewName("redirect:manufactureho.html");
		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/manufactureho.html");
		return mav;// will redirect to viewemp request mapping
	}

	// save to manufacturer masters
	@RequestMapping(value = "/checkmname", method = RequestMethod.GET)
	public @ResponseBody String checkmname(@ModelAttribute("m") Manufacture m) {
		// List<Order> list1 = hodao.getOrderid();
		String jsonFormatData = "";

		List<Manufacture> list1 = hodao.getcheckmname1(m.getName());
		Map<String, Object> model = new HashMap<String, Object>();
		// model.put("list1",list1);
		model.put("list1", list1);

		Gson gson = new Gson();

		jsonFormatData = gson.toJson(list1);

		return jsonFormatData;
	}

	// saving supplier masters
	@RequestMapping(value = "/savesupply", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("s") Supply s) {
		int saves = 0;
		saves = s.getSid() > 0 ? hodao.updatesupply(s) : hodao.saves(s);
		ModelAndView mav = new ModelAndView();
		if (saves > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:supplierho.html");

		}

		else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:supplierho.html");
		}

		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/supplierho.html");
		return mav;// will redirect to viewemp request mapping
	}

	// updating supplier masters
	@RequestMapping(value = "/updatesupply", method = RequestMethod.POST)
	public ModelAndView updateSupply(@ModelAttribute("s") Supply s) {
		int saves = 0;
		saves = hodao.updatesupply(s);
		ModelAndView mav = new ModelAndView();
		if (saves > 0) {
			mav.addObject("message", "The record has been updated sucessfully");
			mav.setViewName("redirect:supplierho.html");

		}

		else {
			mav.addObject("message", "Record could not be updatedsuccessfully ");
			mav.setViewName("redirect:supplierho.html");
		}

		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/supplierho.html");
		return mav;// will redirect to viewemp request mapping
	}

	// save to supplier masters
	@RequestMapping(value = "/checksname", method = RequestMethod.GET)
	public @ResponseBody String checksname(@ModelAttribute("s") Supply s) {
		// List<Order> list1 = hodao.getOrderid();
		String jsonFormatData = "";

		List<Supply> list2 = hodao.getchecksname1(s.getName());
		Map<String, Object> model = new HashMap<String, Object>();
		// model.put("list1",list1);
		model.put("list2", list2);

		Gson gson = new Gson();

		jsonFormatData = gson.toJson(list2);

		return jsonFormatData;
	}
	// redirection to customermasters

	@RequestMapping(value = "/customerho", method = RequestMethod.GET)
	public ModelAndView customer(@ModelAttribute("c") Customer c) {
		List<Customer> list = hodao.getCustomername1("customer");
		List<Customer> list2 = hodao.getCustomerId("customer");
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("list2", list2);
		return new ModelAndView("customerho", "model", model);
	}

	// saving customer masters
	@RequestMapping(value = "/savecustomerho", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("c") Customer c, HttpServletRequest request) {
		int savec = 0;

		savec = c.getCid() > 0 ? hodao.updateCustomer(c, "customer") : hodao.savec(c, "customer");
		ModelAndView mav = new ModelAndView();
		if (savec > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:customerho.html");

		}

		else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:customerho.html");
		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/customerho.html");
		return mav;// will redirect to viewemp request mapping
	}

	// saving customer masters
	@RequestMapping(value = "/updatecustomer", method = RequestMethod.POST)
	public ModelAndView updateCustomerHo(@ModelAttribute("c") Customer c, HttpServletRequest request) {
		int savec = 0;

		savec = hodao.updateCustomer(c, "customer");
		ModelAndView mav = new ModelAndView();
		if (savec > 0) {
			mav.addObject("message", "The record has been updated sucessfully");
			mav.setViewName("redirect:customerho.html");

		}

		else {
			mav.addObject("message", "Record could not be updated successfully ");
			mav.setViewName("redirect:customerho.html");
		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/customerho.html");
		return mav;// will redirect to viewemp request mapping
	}

	// for dispensary

	@RequestMapping(value = "/dcustomerho", method = RequestMethod.GET)
	public ModelAndView dcustomer(@ModelAttribute("c") Customer c) {
		List<Customer> list = hodao.getCustomername1d("dcustomer");
		List<Customer> list2 = hodao.getCustomerIdd("dcustomer");
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("list2", list2);
		return new ModelAndView("dcustomerho", "model", model);
	}

	// saving customer masters
	@RequestMapping(value = "/dsavecustomerho", method = RequestMethod.POST)
	public ModelAndView dsave(@ModelAttribute("c") Customer c, HttpServletRequest request) {
		int savec = 0;
		savec = c.getCid() > 0 ? hodao.updateCustomerd(c, "dcustomer"): hodao.savecd(c, "dcustomer");
		ModelAndView mav = new ModelAndView();
		if (savec > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:dcustomerho.html");

		}

		else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:dcustomerho.html");
		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/customerho.html");
		return mav;// will redirect to viewemp request mapping
	}

	// saving customer masters
	@RequestMapping(value = "/dupdatecustomerho", method = RequestMethod.POST)
	public ModelAndView dupdatecustomer(@ModelAttribute("c") Customer c, HttpServletRequest request) {
		int savec = 0;

		savec = hodao.updateCustomerd(c, "dcustomer");
		ModelAndView mav = new ModelAndView();
		if (savec > 0) {
			mav.addObject("message", "The record has been updated sucessfully");
			mav.setViewName("redirect:dcustomerho.html");

		}

		else {
			mav.addObject("message", "Record could not be updated successfully ");
			mav.setViewName("redirect:dcustomerho.html");
		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/customerho.html");
		return mav;// will redirect to viewemp request mapping
	}

	// update customermasters
	@RequestMapping(value = "/csupdateho", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("c") Customer c, HttpServletRequest request,
			HttpServletResponse response) {
		hodao.updateCustomer(c, "customer");
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/customerho.html");
		return new ModelAndView(redirectView);// will redirect to viewemp request mapping
	}

	// redirection to product masters
	@RequestMapping("/productho")
	public ModelAndView viewproduct(@ModelAttribute("p") Product p) {
		List<Manufacture> list = hodao.getManufacturename1();
		List<Supply> list1 = hodao.getSupplyname();
		//List<Product> list2 = hodao.getP();
		// List<Purchase>list2 = hodao.getCurrentstks();
		List<Product> list3 = hodao.search1();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("list1", list1);
		//model.put("list2", list2);
		model.put("list3", list3);
		return new ModelAndView("productho", "model", model);

	}
	
	@RequestMapping(value = "/productSearch", method = RequestMethod.GET)
	public @ResponseBody String searchProduct(@ModelAttribute("product") Product product) {
		List<Product> productList = hodao.searchProducts(product.getName(), product.getPrc());
		Gson gson = new Gson();
		return gson.toJson(productList);
	}
	// to get product details based on name

	@RequestMapping(value = "/checkpcode", method = RequestMethod.GET)
	public @ResponseBody String checkpcode(@ModelAttribute("p") Product p) {
		// List<Order> list1 = hodao.getOrderid();
		String jsonFormatData = "";

		List<Product> list2 = hodao.getcheckpcode(p.getPrc());
		Map<String, Object> model = new HashMap<String, Object>();
		// model.put("list1",list1);
		model.put("list2", list2);

		Gson gson = new Gson();

		jsonFormatData = gson.toJson(list2);

		return jsonFormatData;
	}

	// save product masters
	@RequestMapping(value = "/checkpname", method = RequestMethod.GET)
	public @ResponseBody String checkpname(@ModelAttribute("p") Product p) {
		// List<Order> list1 = hodao.getOrderid();
		String jsonFormatData = "";

		List<Product> list2 = hodao.getcheckpname(p.getName());
		Map<String, Object> model = new HashMap<String, Object>();
		// model.put("list1",list1);
		model.put("list2", list2);

		Gson gson = new Gson();

		jsonFormatData = gson.toJson(list2);

		return jsonFormatData;
	}
	// save product masters

	@RequestMapping(value = "/saveproductho", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("p") Product p, HttpServletRequest req) {
		// String supply[] = p.getSupplier().split("/");
		// for(int i =0;i<supply.length;i++){
		// hodao.savep(p,supply[i]);
		// }
		int savep = 0;
		if (req.getParameter("saup").contentEquals("create")) {
			savep = hodao.savep(p);
		} else {
			savep = hodao.updatesavep(p);
		}

		ModelAndView mav = new ModelAndView();
		if (savep > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:productho.html");

		}

		else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:productho.html");
		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/productho.html");
		return mav;// will redirect to viewemp request mapping //will redirect to viewemp request
					// mapping
	}

	@RequestMapping(value = "/updateproductho", method = RequestMethod.POST)
	public ModelAndView updateProduct(@ModelAttribute("p") Product p, HttpServletRequest req) {
		int savep = 0;
		savep = hodao.updateProduct(p);
		ModelAndView mav = new ModelAndView();
		if (savep > 0) {
			mav.addObject("message", "The record has been updated sucessfully");
			mav.setViewName("redirect:productho.html");
		}
		else {
			mav.addObject("message", "Record could not be updated successfully ");
			mav.setViewName("redirect:productho.html");
		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/productho.html");
		return mav;// will redirect to viewemp request mapping //will redirect to viewemp request
					// mapping
	}

	@RequestMapping(value = "/orderho")
	public ModelAndView search(@ModelAttribute("p") Product p) {

		List<Product> list = hodao.searchProduct(limitf);
		List<Product> list5 = hodao.Reorder();

		List<Order> list1 = hodao.getorderDetails(session.getSsid(), limitf);
		List<Product> list3 = hodao.searchRq();
		List<Supply> list6 = hodao.getSupplyname();
		List<Branch> listb = hodao.getBranch(session.getSsid());

		String realName = listb.get(0).getName();
		String realAddress = listb.get(0).getAddress();
		String realLogo = listb.get(0).getLogo();
		String realIname = listb.get(0).getIop();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("list1", list1);
		model.put("list3", list3);
		// model.put("list4",list4);
		model.put("list5", list5);
		model.put("list6", list6);
		model.put("realName", realName);
		model.put("realAddress", realAddress);
		model.put("realLogo", realLogo);
		model.put("realIname", realIname);

		return new ModelAndView("order", "model", model);// will redirect to viewemp request mapping
	}

	@RequestMapping(value = "/orderhoFilter", method = RequestMethod.GET)
	public @ResponseBody String orderhoFilter(@ModelAttribute("p") Product p, HttpServletRequest req,
			HttpServletResponse res) {

		String srch = req.getParameter("srch");
		String srch2 = req.getParameter("srch2");
		String srch3 = req.getParameter("srch3");


		List<Product> list = hodao.searchProductFilter(srch, srch2, limitf);
		List<Order> list1 = hodao.getorderDetailsFilter(session.getSsid(), srch3, limitf);

		List<Branch> listb = hodao.getBranch(session.getSsid());
		String realName = listb.get(0).getName();
		String realAddress = listb.get(0).getAddress();
		String realLogo = listb.get(0).getLogo();
		String realIname = listb.get(0).getIop();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list1", list1);
		model.put("list", list);
		model.put("realName", realName);
		model.put("realAddress", realAddress);
		model.put("realLogo", realLogo);
		model.put("realIname", realIname);

		String jsonFormatData = "";

		Gson gson = new Gson();

		jsonFormatData = gson.toJson(model);
		return jsonFormatData;
	}

	// save order
/*	@RequestMapping(value = "/saveOrderho", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("d") Order d, HttpServletRequest request, HttpServletResponse response) {
		int saveo = 0;
		String name[] = request.getParameterValues("productName");
		// String supplier[] = request.getParameterValues("Supplier");
		String pack[] = request.getParameterValues("unit");
		String quantity[] = request.getParameterValues("quantity");
		String stock[] = request.getParameterValues("stks");

		String prccode[] = request.getParameterValues("ean");
		String pid[] = request.getParameterValues("pida");
		List<Order> list4 = hodao.getorderId(session.getSsid(), "orderho", d);

		for (int i = 0; i < name.length; i++) {
			if (request.getParameter("sa").contentEquals("cr")) {
				d.setOrderid(list4.get(0).getOrderid());
				saveo = hodao.saveo(d, name[i], pack[i], quantity[i], stock[i], prccode[i], session.getSsid(),
						Integer.parseInt(pid[i]));// up[i],total[i],);

			} else {
				saveo = hodao.Updsaveo(d, name[i], pack[i], quantity[i], stock[i], prccode[i], session.getSsid(),
						Integer.parseInt(pid[i]));// up[i],total[i],);

			}
			// products below reorder level will not be listed after product ordered
			hodao.updateActive(name[i]);
			hodao.updateorpr(name[i], "off", session.getSsid());

		}

		ModelAndView mav = new ModelAndView();
		if (saveo > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:orderho.html");

		}

		else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:orderho.html");
		}
		return mav;
	}
*/
	// active order details

	@RequestMapping(value = "/getDetailsho.html")
	public @ResponseBody String orderDetails1(@RequestParam Integer autoid) {
		String jsonFormatData = "";
		//List<Order> list1 = hodao.getorderDetails(session.getSsid(), limitf);
		List<OrderDetails> listact = hodao.getorderDetails1("", autoid);
		//List<Product> list = hodao.searchProduct(limitf);

		Map<String, Object> model = new HashMap<String, Object>();
		// model.put("list1",list1);
		model.put("listact", listact);
		// model.put("list",list);
		Gson gson = new Gson();

		jsonFormatData = gson.toJson(listact);
		return jsonFormatData;
	}

	// sale screen redirection

	@RequestMapping("/saleho")
	public ModelAndView viewCustomer1(@ModelAttribute("c") Customer c) {
		List<Customer> list = hodao.getCustomername("customer", limitf);
        List<Product> list10 = hodao.search3(limitf);
		List<Sales> list9 = hodao.getinvId1("saleho", session.getSsid(), limitf);
		/*List<TaxB> list6 = hodao.getTax();
		List<custDisc> list7 = hodao.getCustDis();
		List<Spdiscount> list8 = hodao.getSpdis();*/
		String uri = restBaseUrl + "/HMS/patient/getPatientsByBranch?branchid=" + session.getSsid() + "&limit="
				+ limitf;
		List<Patient> list11 = makeRestCall(uri);
		List<Branch> listb = hodao.getBranch(session.getSsid());

		String realName = listb.get(0).getName();
		String realAddress = listb.get(0).getAddress();
		String realLogo = listb.get(0).getLogo();
		String realIname = listb.get(0).getIop();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);

		// model.put("list1",list1);
		// model.put("list2",list2);
		// model.put("list3",list3);
//		model.put("list4", list4);
		// model.put("list5",list5);
		//model.put("list6", list6);
		//model.put("list7", list7);
		//model.put("list8", list8);
		model.put("list9", list9);
		model.put("list10", list10);
		model.put("list11", list11);
		model.put("realName", realName);
		model.put("realAddress", realAddress);
		model.put("realLogo", realLogo);
		model.put("realIname", realIname);
		return new ModelAndView("sales", "model", model);

	}

	@RequestMapping(value = "/salehoFilter", method = RequestMethod.GET)
	public @ResponseBody String salehoFilter(@ModelAttribute("c") Customer c, HttpServletRequest req,
			HttpServletResponse res) {

		String srch = req.getParameter("srch");
		String srch2 = req.getParameter("srch2");
		String srch3 = req.getParameter("srch3");
		String srch4 = req.getParameter("srch4");
		String srch5 = req.getParameter("srch5");

		List<Sales> list9a = hodao.getinvId1Filter("saleho", session.getSsid(), srch, limitf);
		List<Product> list10a = hodao.search3Filter(srch2, srch3, limitf);
		List<Customer> lista = hodao.getCustomernameFilter("customer", srch4, srch5, limitf);
		String uri = restBaseUrl + "/HMS/patient/getPatientsByFilters?branchid=" + session.getSsid() + "&name=" + srch4
				+ "&pid=" + srch5 + "&limit=" + limitf;
		List<Patient> list11a = makeRestCall(uri);

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list9a", list9a);
		model.put("list10a", list10a);
		model.put("lista", lista);
		model.put("list11a", list11a);

		String jsonFormatData = "";

		Gson gson = new Gson();

		jsonFormatData = gson.toJson(model);
		return jsonFormatData;
	}

	@RequestMapping(value = "/gtinvoice", method = RequestMethod.GET)
	public @ResponseBody String getInvoice(@ModelAttribute("p") Sales p) {
		String jsonFormatData = "";
		List<Sales> list2 = hodao.fetchSaleRecords(p.getAutoid(), "sale", "saledetails","productstock");
		if(list2.get(0).getIsPatient() != null && list2.get(0).getIsPatient().equalsIgnoreCase("true")) {
		  String uri = restBaseUrl + "/HMS/patient/getPatientById/"+list2.get(0).getCustomer().getCid();
		  Patient patient = makeRestCallForSingleRow(uri);
		  Customer customer = list2.get(0).getCustomer();
		  customer.setName(patient.getFname());
		  customer.setCustomer(patient.getPid());
		  customer.setPhone(patient.getMobile());
          customer.setSex(patient.getGender());
          customer.setAge(patient.getAge());
          customer.setCid(patient.getAutoid());
          list2.get(0).setCustomer(customer);
		}
		
		Gson gson = new Gson();
		jsonFormatData = gson.toJson(list2);
		return jsonFormatData;
	}

	/*
	 * @RequestMapping("/pentry") public ModelAndView
	 * savePurchase(@ModelAttribute("p") Purchase p ){ dao.savepe(p);
	 * 
	 * return new ModelAndView("purchase");//will redirect to viewemp request
	 * mapping }
	 */

	@RequestMapping(value = "/getinvprds", method = RequestMethod.GET)
	public @ResponseBody String getInvoiceprds(@ModelAttribute("p") Sales p) {
		String jsonFormatData = "";
		List<ProductStocks> list1b = hodao.getinvprods(p.getPid(), "productstock", "", session.getSsid());
        Gson gson = new Gson();
        jsonFormatData = gson.toJson(list1b);
        return jsonFormatData;

		// will redirect to viewemp request mapping

	}

	// sales submission
	/*
	 * @RequestMapping("/saleho2") public ModelAndView
	 * viewCustomer2(@ModelAttribute("s") Sale s,HttpServletRequest
	 * request,HttpServletResponse response ){ System.out.println("code reacg");
	 * if((s.getCustName().equalsIgnoreCase("new"))||(s.getCustId().equalsIgnoreCase
	 * ("new"))){ dao.savecs(s); } else{
	 * 
	 * int savess = 0; int updsass = 0; System.out.println("inelse"); String name[]
	 * = request.getParameterValues("pname"); String batch[] =
	 * request.getParameterValues("batch"); String expdate[] =
	 * request.getParameterValues("expDate"); String mpack[] =
	 * request.getParameterValues("spack"); String mdesc[] =
	 * request.getParameterValues("spsize"); String sudesc[] =
	 * request.getParameterValues("sudesc"); String stk1[] =
	 * request.getParameterValues("stk[]"); String unit[] =
	 * request.getParameterValues("unit"); String qty1[] =
	 * request.getParameterValues("qty[]"); String up[] =
	 * request.getParameterValues("unitprice"); String price1[] =
	 * request.getParameterValues("price[]"); String ean[] =
	 * request.getParameterValues("ean"); String pid[] =
	 * request.getParameterValues("pida");
	 * 
	 * List<Sale>list5 = hodao.getinvId(s,"saleho",session.getSsid());
	 * s.setInvoice(list5.get(0).getInvoice()); for(int i=0;i<qty1.length;i++){
	 * savess =
	 * hodao.savess(s,name[i],batch[i],expdate[i],unit[i],up[i],qty1[i],stk1[i],
	 * price1[i],mpack[i],mdesc[i],sudesc[i],ean[i],"saleho",session.getSsid(),
	 * Integer.parseInt(pid[i])); updsass =
	 * hodao.update(Integer.parseInt(pid[i]),qty1[i],batch[i],"productstock",session
	 * .getSsid()); hodao.updatereord(name[i],"on",session.getSsid()); }
	 * ModelAndView mav = new ModelAndView(); if(savess > 0 && updsass > 0){
	 * mav.addObject("message", "The record has been saved sucessfully");
	 * mav.setViewName("redirect:saleho.html");
	 * 
	 * }
	 * 
	 * else{ mav.addObject("message", "Record could not be saved successfully ");
	 * mav.setViewName("redirect:saleho.html"); } RedirectView redirectView = new
	 * RedirectView(); redirectView.setUrl("/ERP/saleho.html"); return mav;//will
	 * redirect to viewemp request mapping
	 * 
	 * 
	 * }
	 */
/*
	@RequestMapping("/saleho2")
	public @ResponseBody String viewCustomer2(@ModelAttribute("s") Sale s, HttpServletRequest request,
			HttpServletResponse response) {
		/*
		 * if((s.getCustName().equalsIgnoreCase("new"))||(s.getCustId().equalsIgnoreCase
		 * ("new"))){ dao.savecs(s); } else{
		 

		String jsonFormatData = "";
		int savess = 0;
		int updsass = 0;
		String name[] = request.getParameterValues("pname");
		String batch[] = request.getParameterValues("batch");
		String expdate[] = request.getParameterValues("expDate");
		String mpack[] = request.getParameterValues("spack");
		String mdesc[] = request.getParameterValues("spsize");
		String sudesc[] = request.getParameterValues("sudesc");
		String stk1[] = request.getParameterValues("stk[]");
		String unit[] = request.getParameterValues("unit");
		String qty1[] = request.getParameterValues("qty[]");
		String up[] = request.getParameterValues("unitprice");
		String price1[] = request.getParameterValues("price[]");
		String ean[] = request.getParameterValues("ean");
		String pid[] = request.getParameterValues("pida");

		List<Sale> list5 = hodao.getinvId(s, "saleho", session.getSsid()); // generating inv id

		// List<Sale>list92 = hodao.getinvId1("saleho",session.getSsid(),limitf); //
		// fetching inv id
		s.setInvoice(list5.get(0).getInvoice());
		for (int i = 0; i < qty1.length; i++) {
			savess = hodao.savess(s, name[i], batch[i], expdate[i], unit[i], up[i], qty1[i], stk1[i], price1[i],
					mpack[i], mdesc[i], sudesc[i], ean[i], "saleho", session.getSsid(), Integer.parseInt(pid[i]));
			updsass = hodao.update(Integer.parseInt(pid[i]), qty1[i], batch[i], "productstock", session.getSsid());
			hodao.updatereord(name[i], "on", session.getSsid());
		}
		ModelAndView mav = new ModelAndView();

		if (savess > 0 && updsass > 0) {
			jsonFormatData = "Success";
			jsonFormatData = s.getInvoice();
		} else {
			jsonFormatData = "Failure";
		}
		// mav.put("list5",list5);
		mav.addObject("list5", s.getInvoice());
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/saleho.html");
		return jsonFormatData;

	}
*/
	// distribute screen

	@RequestMapping(value = "/distribute", method = RequestMethod.GET)
	public ModelAndView distribute(@ModelAttribute("d") Distribute d) {
		List<Distribute> list = hodao.getBranchProducts();
		List<Distribute> list1 = hodao.getAllocation();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("list1", list1);
		return new ModelAndView("distribute", "model", model);
	}

	// get details based on id

	@RequestMapping(value = "/getbrdetails", method = RequestMethod.GET)
	public ModelAndView distribute2(@ModelAttribute("d") Distribute d) {
		List<Distribute> list = hodao.getBranchProducts();
		List<Distribute> list1 = hodao.getAllocation();
		List<Distribute> list2 = hodao.getBrdetails(d);

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("list1", list1);
		model.put("list2", list2);
		return new ModelAndView("distribute", "model", model);
	}

//saving distribute orders

	@RequestMapping(value = "/saveallc", method = RequestMethod.POST)
	public ModelAndView distribute1(@ModelAttribute("d") Distribute d) {
		hodao.saved(d);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/distribute.html");
		return new ModelAndView(redirectView);// will redirect to viewemp request mapping

	}
	// allocation id auto generation

//quotation generation

	/*
	 * @RequestMapping(value="/quotation",method = RequestMethod.GET) public
	 * ModelAndView proforma(@ModelAttribute("q") quotation q,HttpServletRequest
	 * request,HttpServletResponse response){
	 * 
	 * List<Customer> list=hodao.getCustomername();
	 * 
	 * 
	 * // List<Purchase> list4=hodao.getProducts(); // List<Sale>list5 =
	 * hodao.getinvId(); // List<TaxB>list6 = hodao.getTax(); List<custDisc>list7 =
	 * hodao.getCustDis(); List<Spdiscount>list8 = hodao.getSpdis();
	 * 
	 * List<quotation>list9 = hodao.getquotation(); List<quotation>list11 =
	 * hodao.getquotationid();
	 * 
	 * List<quotation>list13 = hodao.updhistory();
	 * 
	 * 
	 * Map<String, Object> model = new HashMap<String, Object>();
	 * model.put("list",list);
	 * 
	 * // model.put("list1",list1); // model.put("list2",list2); //
	 * model.put("list3",list3); // model.put("list4",list4); //
	 * model.put("list5",list5); // model.put("list6",list6);
	 * model.put("list7",list7); model.put("list8",list8); model.put("list9",
	 * list9); model.put("list11",list11); model.put("list13",list13);
	 * 
	 * return new ModelAndView("quotation","model",model);//will redirect to viewemp
	 * request mapping }
	 */
	// quotation save

	@RequestMapping(value = "/saveq", method = RequestMethod.POST)
	public ModelAndView quotation(@ModelAttribute("s") quotation s, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("code reacg");
		/*
		 * if((s.getCustName().equalsIgnoreCase("new"))||(s.getCustId().equalsIgnoreCase
		 * ("new"))){ dao.savecs(s); } else{
		 */

		System.out.println("inelse");
		String name[] = request.getParameterValues("pname");

		String unit[] = request.getParameterValues("unit");
		String up[] = request.getParameterValues("up2[]");
		String qty1[] = request.getParameterValues("qty[]");

		String stk1[] = request.getParameterValues("stk[]");
		String price1[] = request.getParameterValues("price[]");

		System.out.println(name.length);

		System.out.println(unit.length);
		System.out.println(up.length);
		System.out.println(qty1.length);
		System.out.println(stk1.length);
		System.out.println(price1.length);

		for (int i = 0; i < qty1.length; i++) {
			hodao.savequotation(s, name[i], unit[i], up[i], qty1[i], stk1[i], price1[i]);
			// hodao.update(name[i],stk1[i]);
		}

		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/quotation.html");
		return new ModelAndView(redirectView);// will redirect to viewemp request mapping

	}

	@RequestMapping(value = "/checkstat", method = RequestMethod.POST)
	public ModelAndView checkstat(@ModelAttribute("s") quotation s, HttpServletRequest request,
			HttpServletResponse response) {
		hodao.updatestat(s);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/quotation.html");
		return new ModelAndView(redirectView);// will redirect to viewemp request mapping

	}

	/*
	 * @RequestMapping(value="/getcust",method = RequestMethod.GET) public
	 * ModelAndView cust(@ModelAttribute("q") quotation q,HttpServletRequest
	 * request,HttpServletResponse response){
	 * 
	 * List<Customer> list=hodao.getCustomername();
	 * 
	 * 
	 * List<Purchase> list4=hodao.getProducts(); List<Sale>list5 = hodao.getinvId();
	 * List<TaxB>list6 = hodao.getTax(); List<custDisc>list7 = hodao.getCustDis();
	 * List<Spdiscount>list8 = hodao.getSpdis();
	 * 
	 * List<quotation>list9 = hodao.getquotation();
	 * 
	 * List<quotation>list10 = hodao.proformacust(q); List<quotation>list11 =
	 * hodao.getquotationid(); List<quotation>list13 = hodao.updhistory();
	 * 
	 * 
	 * Map<String, Object> model = new HashMap<String, Object>();
	 * model.put("list",list);
	 * 
	 * // model.put("list1",list1); // model.put("list2",list2); //
	 * model.put("list3",list3); model.put("list4",list4); model.put("list5",list5);
	 * model.put("list6",list6); model.put("list7",list7); model.put("list8",list8);
	 * model.put("list9", list9); model.put("list10",list10); model.put("list11",
	 * list11); model.put("list13",list13); return new
	 * ModelAndView("quotation","model",model);//will redirect to viewemp request
	 * mapping }
	 * 
	 * @RequestMapping(value="/getcust1",method = RequestMethod.GET) public
	 * ModelAndView cust1(@ModelAttribute("q") quotation q,HttpServletRequest
	 * request,HttpServletResponse response){
	 * 
	 * List<Customer> list=hodao.getCustomername();
	 * 
	 * 
	 * List<Purchase> list4=hodao.getProducts(); List<Sale>list5 = hodao.getinvId();
	 * List<TaxB>list6 = hodao.getTax(); List<custDisc>list7 = hodao.getCustDis();
	 * List<Spdiscount>list8 = hodao.getSpdis();
	 * 
	 * List<quotation>list9 = hodao.getquotation();
	 * 
	 * List<quotation>list10 = hodao.proformacust(q); List<quotation>list11 =
	 * hodao.getquotationid(); List<quotation>list12 = hodao.updproforma(q);
	 * List<quotation>list13 = hodao.updhistory();
	 * 
	 * Map<String, Object> model = new HashMap<String, Object>();
	 * model.put("list",list);
	 * 
	 * // model.put("list1",list1); // model.put("list2",list2); //
	 * model.put("list3",list3); model.put("list4",list4); model.put("list5",list5);
	 * model.put("list6",list6); model.put("list7",list7); model.put("list8",list8);
	 * model.put("list9", list9); model.put("list10",list10); model.put("list11",
	 * list11); model.put("list12",list12); model.put("list13",list13); return new
	 * ModelAndView("quotation","model",model);//will redirect to viewemp request
	 * mapping }
	 */
	// purchase entry load

	@RequestMapping(value = "/purchaseho", method = RequestMethod.GET)
	public ModelAndView checkstat(@ModelAttribute("s") Purchase s, HttpServletRequest request,
			HttpServletResponse response) {
		List<Supply> list1 = hodao.getAllSuppliers();

		List<Purchases> list2a = hodao.getAllocationid1a("purchase", session.getSsid(), limitf);
		Map<String, Object> model = new HashMap<String, Object>();
  
		model.put("list1", list1);
		// model.put("list2",list2);
		model.put("list2a", list2a);
		return new ModelAndView("purchase", "model", model);// will redirect to viewemp request mapping

	}

	@RequestMapping(value = "/purchaseFilter", method = RequestMethod.GET)
	public @ResponseBody String purchasehoFilter(@ModelAttribute("p") Product p, HttpServletRequest req,
			HttpServletResponse res) {

		System.out.println("purchase filter");
		String srch = req.getParameter("srch");
		String srch2 = req.getParameter("srch2");
		String srch3 = req.getParameter("srch3");
		String supplier = req.getParameter("supplier");

		System.out.println("srch = " + srch);
		System.out.println("srch2 = " + srch2);
		System.out.println("srch3 = " + srch3);
		System.out.println("limit = " + limitf);
		System.out.println("Supplier = " + supplier);

		/*
		 * List<Purchase> list2 =
		 * hodao.getsupplyorderFilter(p.getSupplier(),srch,srch2,limitf);
		 */

		
		System.out.println("srch = "+srch);
		System.out.println("srch2 = "+srch2);
		System.out.println("srch3 = "+srch3);
		System.out.println("supplier"+supplier);
		List<Purchase> list2 = hodao.getsupplyorderFilter(supplier, srch, srch2, limitf);
		List<Purchase> list2a = hodao.getAllocationid1aFilter("purchase", session.getSsid(), srch3, limitf);
		System.out.println("purchase list2 = " + list2);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list2", list2);
		model.put("list2a", list2a);

		String jsonFormatData = "";

		Gson gson = new Gson();

		jsonFormatData = gson.toJson(model);
		return jsonFormatData;
	}

	// load dispensary purchaseho
	@RequestMapping(value = "/dpurchaseho", method = RequestMethod.GET)
	public ModelAndView dcheckstat(@ModelAttribute("s") Purchase s, HttpServletRequest request,
			HttpServletResponse response) {
		List<Supply> list1 = hodao.getAllSuppliers();
		List<Purchase> list2 = hodao.getAllocationid(s, "dpurchase", session.getSsid());
		List<Purchase> list2a = hodao.getAllocationid1ad("dpurchase", session.getSsid(), limitf);
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("list1", list1);
		model.put("list2", list2);
		model.put("list2a", list2a);
		return new ModelAndView("dpurchase", "model", model);// will redirect to viewemp request mapping

	}

	@RequestMapping(value = "/getsupplyorder", method = RequestMethod.GET)
	public @ResponseBody String Supply(@RequestParam String supplier) {
		// List<Order> list1 = hodao.getOrderid();
		String jsonFormatData = "";

		List<Purchase> list2 = hodao.getsupplyorder(supplier, limitf);
		Map<String, Object> model = new HashMap<String, Object>();
		// model.put("list1",list1);
		model.put("list2", list2);

		Gson gson = new Gson();

		jsonFormatData = gson.toJson(model);

		return jsonFormatData;

		// will redirect to viewemp request mapping

	}

	// for dispensary

	@RequestMapping(value = "/purchaseSaveho")
	public ModelAndView purchase(@ModelAttribute("p") Purchase p, HttpServletRequest request,
			HttpServletResponse response) {
		int pur1 = 0;
		int pur2 = 0;
		int pur3 = 0;

		String ean1[] = request.getParameterValues("ean1");
		String name[] = request.getParameterValues("pname1");
		String batch[] = request.getParameterValues("Batch1");
		// String mdate[] = request.getParameterValues("mDate1");
		String exp[] = request.getParameterValues("expDate1");
		String mpack[] = request.getParameterValues("mpack");
		String mdesc[] = request.getParameterValues("mdesc");
		String sudesc[] = request.getParameterValues("sudesc");
		String qty1[] = request.getParameterValues("qty[]");
		String discount1[] = request.getParameterValues("discount1[]");
		String up[] = request.getParameterValues("up2[]");
		String free[] = request.getParameterValues("free");
		String price1[] = request.getParameterValues("price[]");
		String pid[] = request.getParameterValues("pida");

		// String unit[] = request.getParameterValues("unitp");
		// String tax1[] = request.getParameterValues("tax1[]");

		List<Purchase> list2 = hodao.getAllocationid(p, "purchase", session.getSsid());
		p.setAllocationid(list2.get(0).getAllocationid());

		for (int i = 0; i < name.length; i++) {

			pur1 = hodao.savepurchase(p, name[i], batch[i], exp[i], qty1[i], up[i], discount1[i], free[i], price1[i],
					ean1[i], mpack[i], mdesc[i], sudesc[i], session.getSsid(), Integer.parseInt(pid[i]));
			pur2 = hodao.saveproductpriceho(p, name[i], batch[i], up[i], free[i]);
			hodao.updatecatho(name[i], session.getSsid(), Integer.parseInt(pid[i]));
			hodao.updateean(name[i]);
			hodao.updatecatho1(name[i]);

			pur3 = hodao.saveproductstockho(ean1[i], name[i], batch[i], exp[i], mpack[i], mdesc[i], up[i], qty1[i],
					discount1[i], free[i], sudesc[i], price1[i], "70", "0", "NA", "0", "0", "0", "0", "0.00",
					session.getSsid(), Integer.parseInt(pid[i]));
			hodao.updatecatho2(name[i], session.getSsid(), Integer.parseInt(pid[i]));
			hodao.updatereord(name[i], "on", session.getSsid());

			// hodao.update(name[i],stk1[i]);
		}

		ModelAndView mav = new ModelAndView();
		if (pur1 > 0 && pur2 > 0 && pur3 > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:purchaseho.html");

		}

		else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:purchaseho.html");
		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/purchaseho.html");
		return mav;// will redirect to viewemp request mapping

	}

//save dispensary purchase 
	@RequestMapping(value = "/dpurchaseSaveho")
	public ModelAndView dpurchase(@ModelAttribute("p") Purchase p, HttpServletRequest request,
			HttpServletResponse response) {
		int pur1 = 0;
		int pur2 = 0;
		int pur3 = 0;

		String ean1[] = request.getParameterValues("ean1");
		String name[] = request.getParameterValues("pname1");
		String batch[] = request.getParameterValues("Batch1");
		// String mdate[] = request.getParameterValues("mDate1");
		String exp[] = request.getParameterValues("expDate1");
		String mpack[] = request.getParameterValues("mpack");
		String mdesc[] = request.getParameterValues("mdesc");
		String sudesc[] = request.getParameterValues("sudesc");
		String qty1[] = request.getParameterValues("qty[]");
		String discount1[] = request.getParameterValues("discount1[]");
		String up[] = request.getParameterValues("up2[]");
		String free[] = request.getParameterValues("free");
		String price1[] = request.getParameterValues("price[]");

		// String unit[] = request.getParameterValues("unitp");
		// String tax1[] = request.getParameterValues("tax1[]");

		for (int i = 0; i < name.length; i++) {

			pur1 = hodao.dsavepurchase(p, name[i], batch[i], exp[i], qty1[i], up[i], discount1[i], free[i], price1[i],
					ean1[i], mpack[i], mdesc[i], sudesc[i], session.getSsid());
			// pur2 = hodao.dsaveproductpriceho(p,name[i],batch[i],up[i],free[i]);
			hodao.dupdatecatho(name[i], session.getSsid());
			// hodao.dupdateean(name[i]);
			// hodao.dupdatecatho1(name[i]);

			pur3 = hodao.dsaveproductstockho(ean1[i], name[i], batch[i], exp[i], mpack[i], mdesc[i], up[i], qty1[i],
					discount1[i], free[i], sudesc[i], price1[i], "70", "0", "NA", "0", "0", "0", "0", "0.00",
					session.getSsid());
			hodao.dupdatecatho2(name[i], session.getSsid());

			// hodao.update(name[i],stk1[i]);
		}

		ModelAndView mav = new ModelAndView();
		if (pur1 > 0 && pur3 > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:dpurchaseho.html");

		}

		else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:dpurchaseho.html");
		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/purchaseho.html");
		return mav;// will redirect to viewemp request mapping

	}

	// get order based on id
	@RequestMapping(value = "/pentryho", method = RequestMethod.GET)
	public ModelAndView checkstat(@ModelAttribute("o") Order o, HttpServletRequest request,
			HttpServletResponse response) {
		// List<Order> list1 = hodao.getOrderid();
		List<Order> listact = hodao.getorderDetails(session.getSsid(), limitf);
		// List<Order> list2 = hodao.getsupplyorder(o);

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listact", listact);
		// model.put("list1", list1);
		// model.put("list2",list2);
		return new ModelAndView("purchaseho", "model", model);// will redirect to viewemp request mapping

	}

	// product price
	@RequestMapping(value = "/propriceho", method = RequestMethod.GET)
	public ModelAndView propricing(HttpServletRequest request, HttpServletResponse response) {
		List<Productprice> list = hodao.getInfoSearch();
		List<Product> list1 = hodao.getInfoSearch1(limitf);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("list1", list1);
		// model.put("list2",list2);
		return new ModelAndView("productpriceho", "model", model);
	}

	@RequestMapping(value = "/psearchho", method = RequestMethod.GET)
	public ModelAndView prosearchp(@ModelAttribute("ps") Productprice ps) {
		System.out.println("category is" + ps.getCategory());
		List<Productprice> list = hodao.getproSearch(ps);
		List<Product> list1 = hodao.getInfoSearch1(limitf);

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("list1", list1);
		return new ModelAndView("productpriceho", "model", model);
	}

	// product stocks
	@RequestMapping(value = "/stopriceho", method = RequestMethod.GET)
	public ModelAndView stopricing(HttpServletRequest request, HttpServletResponse response) {
		List<ProductStocks> list = hodao.getInfoStkSearch1("productstock", session.getSsid());
		List<Product> list1 = hodao.getInfoSearch1(limitf);
		ProductStocksWrapper wrapper = new ProductStocksWrapper();
		wrapper.setProductStockList(new ArrayList<>(list));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", wrapper);
		model.put("list1", list1);
		
		// model.put("list2",list2);
		return new ModelAndView("productstocks", "model", model);
	}

	@RequestMapping(value = "/stopricehoFilter", method = RequestMethod.GET)
	public @ResponseBody String stopricingFilter(HttpServletRequest req, HttpServletResponse res) {

		System.out.println("product stock filter");
		String srch = req.getParameter("srch");

		System.out.println("srch = " + srch);
		System.out.println("limit = " + limitf);

		List<Product> list1a = hodao.getInfoSearch1Filter(srch, limitf);

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list1a", list1a);

		String jsonFormatData = "";

		Gson gson = new Gson();

		jsonFormatData = gson.toJson(model);
		return jsonFormatData;
	}

	@RequestMapping(value = "/pssearchho", method = RequestMethod.GET)
	public ModelAndView prosearch(@ModelAttribute("ps") Productstock ps) {

		List<Productstock> list = hodao.getstockSearch(ps, "productstock", session.getSsid());
		List<Product> list1 = hodao.getInfoSearch1(limitf);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("list1", list1);
		model.put("name", ps.getName());
		model.put("code", ps.getCode());
		model.put("category", ps.getCategory());
		model.put("exp", ps.getExpDate());
		model.put("to", ps.getToDate());
		model.put("limit", ps.getRecords());
		model.put("batch", ps.getBatch());
		return new ModelAndView("productstocks", "model", model);
	}

	// product stocks edit
	@RequestMapping("/pssaveho")
	public ModelAndView saveprStks(@ModelAttribute("ps") Productstock ps, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("Batch " + ps.getBatch());
		int pssave = 0;
		int pur3 = 0;
		String ean1[] = request.getParameterValues("code");
		String name[] = request.getParameterValues("name");
		String batch[] = request.getParameterValues("batch");
		// String mdate[] = request.getParameterValues("mDate1");
		String exp[] = request.getParameterValues("expDate");
		String mpack[] = request.getParameterValues("mpack");
		String mpsize[] = request.getParameterValues("mpsize");
		String cp[] = request.getParameterValues("cp");
		String prqty[] = request.getParameterValues("prqty");
		String prprice[] = request.getParameterValues("prprice");
		String qty1[] = request.getParameterValues("quantity");
		String sudesc[] = request.getParameterValues("sudesc");
		String stkpr[] = request.getParameterValues("stkpr");
		String markup[] = request.getParameterValues("markup");
		String sp[] = request.getParameterValues("sp");
		String spdesc[] = request.getParameterValues("spdesc");
		String spsize[] = request.getParameterValues("spsize");
		String stksp[] = request.getParameterValues("stksp");
		String sellqty[] = request.getParameterValues("sellqty");
		String sunits[] = request.getParameterValues("sunits");
		String tprice[] = request.getParameterValues("tprice");
		String pid[] = request.getParameterValues("pida");

		for (int i = 0; i < name.length; i++) {

			pssave = hodao.saveproductstockho1(ean1[i], name[i], batch[i], exp[i], mpack[i], mpsize[i], cp[i], prqty[i],
					prprice[i], qty1[i], sudesc[i], stkpr[i], markup[i], sp[i], spdesc[i], spsize[i], stksp[i],
					sellqty[i], sunits[i], tprice[i], "productstock", session.getSsid(), Integer.parseInt(pid[i]));
		}

		// pssave = hodao.saveprStks(ps);
		ModelAndView mav = new ModelAndView();
		if (pssave > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:stopriceho.html");

		}

		else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:stopriceho.html");
		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/stopriceho.html");
		return mav;// will redirect to viewemp request mapping
	}

	@RequestMapping(value = "/psstatus", method = RequestMethod.GET)
	public @ResponseBody String psStatus(@ModelAttribute("p") Branch p, HttpServletRequest req,
			HttpServletResponse res) {

		String uqkval = req.getParameter("uqkval");
		int list1 = hodao.psStatus(Integer.parseInt(uqkval));

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list1", list1);

		String jsonFormatData = "";
		Gson gson = new Gson();
		jsonFormatData = gson.toJson(model);
		return jsonFormatData;
	}

	@RequestMapping(value = "/psstatus2", method = RequestMethod.GET)
	public @ResponseBody String psStatus2(@ModelAttribute("p") Branch p, HttpServletRequest req,
			HttpServletResponse res) {

		String uqkval = req.getParameter("uqkval");
		int list1 = hodao.psStatus2(Integer.parseInt(uqkval));

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list1", list1);

		String jsonFormatData = "";
		Gson gson = new Gson();
		jsonFormatData = gson.toJson(model);
		return jsonFormatData;
	}

	@RequestMapping("/prsaveho")
	public ModelAndView saveprPr(@ModelAttribute("ps") Productprice pr) {
		int prsave = 0;
		prsave = hodao.saveprPr(pr);

		ModelAndView mav = new ModelAndView();
		if (prsave > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:propriceho.html");

		}

		else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:propriceho.html");
		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/propriceho.html");
		return mav;// will redirect to viewemp request mapping
	}

//save to customer  masters
	@RequestMapping(value = "/checkcphone", method = RequestMethod.GET)
	public @ResponseBody String checkcphone(@ModelAttribute("c") Customer c) {
//		  List<Order> list1 = hodao.getOrderid();
		String jsonFormatData = "";

		List<Customer> list2 = hodao.getcheckcphone(c.getPhone(), "customer");
		Map<String, Object> model = new HashMap<String, Object>();
		// model.put("list1",list1);
		model.put("list2", list2);

		Gson gson = new Gson();

		jsonFormatData = gson.toJson(list2);

		return jsonFormatData;
	}

//for dispensary customer

//save to customer  masters
	@RequestMapping(value = "/dcheckcphone", method = RequestMethod.GET)
	public @ResponseBody String dcheckcphone(@ModelAttribute("c") Customer c) {
//		  List<Order> list1 = hodao.getOrderid();
		String jsonFormatData = "";

		List<Customer> list2 = hodao.getcheckcphoned(c.getPhone(), "dcustomer");
		Map<String, Object> model = new HashMap<String, Object>();
		// model.put("list1",list1);
		model.put("list2", list2);

		Gson gson = new Gson();

		jsonFormatData = gson.toJson(list2);

		return jsonFormatData;
	}

	@RequestMapping(value = "/delor/{ordautoid}/{autoid}")
	public @ResponseBody String deleteOrderDetails(@PathVariable int ordautoid,@PathVariable int autoid) {
		int bsave = 0;
		String jsonFormatData = "";
		String result;
		bsave = hodao.deletepr(autoid);
        if(ordautoid != 0) {
        	hodao.deleteOrder(ordautoid);
        }
		if (bsave > 0) {
			result = "success";

		}

		else {
			result = "failure";
		}
		Gson gson = new Gson();
		jsonFormatData = gson.toJson(result);

		return jsonFormatData;
	}

//to print sales reports

	@RequestMapping(value = "/salespdf", method = RequestMethod.GET)
	public void billpdf(@ModelAttribute("s") Sale s, ModelAndView modelAndView, HttpServletRequest req,
			HttpServletResponse response) throws JRException, IOException {

		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "inline");

		List<Sale> list2 = hodao.getsaleReports(req.getParameter("location"), req.getParameter("location1"), "saleho");
		List<Branch> listb = hodao.getBranch(session.getSsid());

		String realName = listb.get(0).getName();
		String realAddress = listb.get(0).getAddress();
		String realLogo = listb.get(0).getLogo();

		JasperReport report = getReport("/invoice.jrxml");
		// fill the report with data source objects
		String realPath = context.getRealPath("/");
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("realPath", realPath);
		parameterMap.put("realName", realName);
		parameterMap.put("realAddress", realAddress);
		parameterMap.put("realLogo", realLogo);

		JRDataSource JRdataSource = new JRBeanCollectionDataSource(list2);
		JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameterMap, JRdataSource);

		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, out);// export PDF directly

	}

	public JasperReport getReport(String op) throws JRException {

		InputStream stream = getClass().getResourceAsStream(op);
		jr = JasperCompileManager.compileReport(stream);

		return jr;
	}

//dispensary
	@RequestMapping(value = "/dsalespdf", method = RequestMethod.GET)
	public void dbillpdf(@ModelAttribute("s") Sale s, ModelAndView modelAndView, HttpServletRequest req,
			HttpServletResponse response) throws JRException, IOException {

		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "inline");

		List<Sale> list2 = hodao.getsaleReportsd(req.getParameter("location"), req.getParameter("location1"),
				"dsaleho");

		JasperReport report = getReport("/invoice.jrxml");
		// fill the report with data source objects
		String realPath = context.getRealPath("/");
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("realPath", realPath);

		JRDataSource JRdataSource = new JRBeanCollectionDataSource(list2);
		JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameterMap, JRdataSource);

		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, out);// export PDF directly

	}

	@RequestMapping(value = "/salespdf1", method = RequestMethod.GET)
	public void salespdf(@ModelAttribute("s") Sale s, ModelAndView modelAndView, HttpServletRequest req,
			HttpServletResponse response) throws JRException, IOException {

		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "inline");

		List<Sale> list2 = hodao.getsaleInv(req.getParameter("invoice"), "saleho", "productstock", session.getSsid());
		List<Branch> listb = hodao.getBranch(session.getSsid());

		String realName = listb.get(0).getName();
		String realAddress = listb.get(0).getAddress();
		String realLogo = listb.get(0).getLogo();

		JasperReport report = getReport("/invoice1.jrxml");
		// fill the report with data source objects
		String realPath = context.getRealPath("/");
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("realPath", realPath);
		parameterMap.put("realName", realName);
		parameterMap.put("realAddress", realAddress);
		parameterMap.put("realLogo", realLogo);

		JRDataSource JRdataSource = new JRBeanCollectionDataSource(list2);
		JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameterMap, JRdataSource);

		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, out);// export PDF directly

	}

	@RequestMapping(value = "/dsalespdf1", method = RequestMethod.GET)
	public void dsalespdf(@ModelAttribute("s") Sale s, ModelAndView modelAndView, HttpServletRequest req,
			HttpServletResponse response) throws JRException, IOException {

		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "inline");

		List<Sale> list2 = hodao.getsaleInv(req.getParameter("invoice"), "dsaleho", "dproductstock", session.getSsid());
		List<Branch> listb = hodao.getBranch(session.getSsid());

		String realName = listb.get(0).getName();
		String realAddress = listb.get(0).getAddress();
		String realLogo = listb.get(0).getLogo();

		JasperReport report = getReport("/invoice1.jrxml");
		// fill the report with data source objects
		String realPath = context.getRealPath("/");
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("realPath", realPath);

		parameterMap.put("realName", realName);
		parameterMap.put("realAddress", realAddress);
		parameterMap.put("realLogo", realLogo);

		JRDataSource JRdataSource = new JRBeanCollectionDataSource(list2);
		JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameterMap, JRdataSource);

		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, out);// export PDF directly

	}

	@RequestMapping(value = "/prpur", method = RequestMethod.GET)
	public void prpdf(@ModelAttribute("s") Purchase s, ModelAndView modelAndView, HttpServletRequest req,
			HttpServletResponse response) throws JRException, IOException {

		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "inline");

		List<Purchase> list2 = hodao.getPrpur(req.getParameter("allo"), "purchase");
		JasperReport report = getReport("/prpurchase.jrxml");
		List<Branch> listb = hodao.getBranch(session.getSsid());

		String realName = listb.get(0).getName();
		String realAddress = listb.get(0).getAddress();
		String realLogo = listb.get(0).getLogo();

		// fill the report with data source objects
		String realPath = context.getRealPath("/");
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("realPath", realPath);
		parameterMap.put("realName", realName);
		parameterMap.put("realAddress", realAddress);
		parameterMap.put("realLogo", realLogo);

		JRDataSource JRdataSource = new JRBeanCollectionDataSource(list2);
		JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameterMap, JRdataSource);

		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, out);// export PDF directly

	}

	@RequestMapping(value = "/dprpur", method = RequestMethod.GET)
	public void dprpdf(@ModelAttribute("s") Purchase s, ModelAndView modelAndView, HttpServletRequest req,
			HttpServletResponse response) throws JRException, IOException {

		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "inline");

		List<Purchase> list2 = hodao.getPrpurd(req.getParameter("allo"), "dpurchase");
		List<Branch> listb = hodao.getBranch(session.getSsid());

		String realName = listb.get(0).getName();
		String realAddress = listb.get(0).getAddress();
		String realLogo = listb.get(0).getLogo();

		JasperReport report = getReport("/prpurchase.jrxml");
		// fill the report with data source objects
		String realPath = context.getRealPath("/");
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("realPath", realPath);
		parameterMap.put("realName", realName);
		parameterMap.put("realAddress", realAddress);
		parameterMap.put("realLogo", realLogo);

		JRDataSource JRdataSource = new JRBeanCollectionDataSource(list2);
		JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameterMap, JRdataSource);

		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, out);// export PDF directly

	}

//order screen print

	@RequestMapping(value = "/orderpr", method = RequestMethod.GET)
	public void orderpr(ModelAndView modelAndView, HttpServletRequest req, HttpServletResponse response)
			throws JRException, IOException {

		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "inline");

		List<OrderDetails> list1 = hodao.getorderDetails1(req.getParameter("location"), session.getSsid());
		List<Branch> listb = hodao.getBranch(session.getSsid());

		String realName = listb.get(0).getName();
		String realAddress = listb.get(0).getAddress();
		String realLogo = listb.get(0).getLogo();

		JasperReport report = getReport("/order.jrxml");
		// fill the report with data source objects
		String realPath = context.getRealPath("/");
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("realPath", realPath);
		parameterMap.put("realName", realName);
		parameterMap.put("realAddress", realAddress);
		parameterMap.put("realLogo", realLogo);

		JRDataSource JRdataSource = new JRBeanCollectionDataSource(list1);
		JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameterMap, JRdataSource);

		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, out);// export PDF directly

	}

//get Batch details in purchase entry

//save to customer  masters
	@RequestMapping(value = "/getBatdet", method = RequestMethod.GET)
	public @ResponseBody String batchdet(HttpServletRequest req, HttpServletResponse response) {
//		  List<Order> list1 = hodao.getOrderid();
		String jsonFormatData = "";

		List<ProductStocks> list2 = hodao.getBatdet(req.getParameter("location"), "productstock",
				Integer.parseInt(req.getParameter("location1")), session.getSsid());
		Map<String, Object> model = new HashMap<String, Object>();
		// model.put("list1",list1);
		model.put("list2", list2);

		Gson gson = new Gson();

		jsonFormatData = gson.toJson(list2);

		return jsonFormatData;
	}

	@RequestMapping(value = "/dgetBatdet", method = RequestMethod.GET)
	public @ResponseBody String dbatchdet(HttpServletRequest req, HttpServletResponse response) {
//		  List<Order> list1 = hodao.getOrderid();
		String jsonFormatData = "";

		List<Productstock> list2 = hodao.getBatdetd(req.getParameter("location"), "dproductstock",
				req.getParameter("location1"), session.getSsid());
		Map<String, Object> model = new HashMap<String, Object>();
		// model.put("list1",list1);
		model.put("list2", list2);

		Gson gson = new Gson();

		jsonFormatData = gson.toJson(list2);

		return jsonFormatData;
	}

//product stocks
	@RequestMapping(value = "/dstopriceho", method = RequestMethod.GET)
	public ModelAndView dstopricing(HttpServletRequest request, HttpServletResponse response) {
		List<ProductStocks> list = hodao.getInfoStkSearchd("dproductstock", session.getSsid());
		List<Product> list1 = hodao.getInfoSearch1(limitf);
		ProductStocksWrapper wrapper = new ProductStocksWrapper();
		wrapper.setProductStockList(new ArrayList<>(list));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", wrapper);
		model.put("list1", list1);
		return new ModelAndView("dproductstocks", "model", model);
	}

	@RequestMapping(value = "/dpssearchho", method = RequestMethod.GET)
	public ModelAndView dprosearch(@ModelAttribute("ps") Productstock ps) {

		List<Productstock> list = hodao.getstockSearch(ps, "dproductstock", session.getSsid());
		List<Product> list1 = hodao.getInfoSearch1(limitf);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("list1", list1);
		model.put("name", ps.getName());
		model.put("code", ps.getCode());
		model.put("category", ps.getCategory());
		model.put("exp", ps.getExpDate());
		model.put("to", ps.getToDate());
		model.put("limit", ps.getRecords());
		model.put("batch", ps.getBatch());
		return new ModelAndView("dproductstocks", "model", model);
	}

	// product stocks edit
	@RequestMapping("/dpssaveho")
	public ModelAndView dsaveprStks(@ModelAttribute("ps") Productstock ps, HttpServletRequest request,
			HttpServletResponse response) {

		int pssave = 0;
		int pur3 = 0;
		String ean1[] = request.getParameterValues("code");
		String name[] = request.getParameterValues("name");
		String batch[] = request.getParameterValues("batch");
// String mdate[] = request.getParameterValues("mDate1");
		String exp[] = request.getParameterValues("expdate");
		String mpack[] = request.getParameterValues("mpack");
		String mpsize[] = request.getParameterValues("mpsize");
		String cp[] = request.getParameterValues("cp");
		String prqty[] = request.getParameterValues("prqty");
		String prprice[] = request.getParameterValues("prprice");
		String qty1[] = request.getParameterValues("quantity");
		String sudesc[] = request.getParameterValues("sudesc");
		String stkpr[] = request.getParameterValues("stkpr");
		String markup[] = request.getParameterValues("markup");
		String sp[] = request.getParameterValues("sp");
		String spdesc[] = request.getParameterValues("spdesc");
		String spsize[] = request.getParameterValues("spsize");
		String stksp[] = request.getParameterValues("stksp");
		String sellqty[] = request.getParameterValues("sellqty");
		String sunits[] = request.getParameterValues("sunits");
		String tprice[] = request.getParameterValues("tprice");
		String pid[] = request.getParameterValues("pida");
		for (int i = 0; i < name.length; i++) {

			pssave = hodao.saveproductstockho1d(ean1[i], name[i], batch[i], exp[i], mpack[i], mpsize[i], cp[i],
					prqty[i], prprice[i], qty1[i], sudesc[i], stkpr[i], markup[i], sp[i], spdesc[i], spsize[i],
					stksp[i], sellqty[i], sunits[i], tprice[i], "dproductstock", session.getSsid(),
					Integer.parseInt(pid[i]));
		}

//pssave = hodao.saveprStks(ps);  
		ModelAndView mav = new ModelAndView();
		if (pssave > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:dstopriceho.html");

		}

		else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:dstopriceho.html");
		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/stopriceho.html");
		return mav;// will redirect to viewemp request mapping
	}

// dispensary sales screen redirection

// sale screen redirection

	@RequestMapping("/dsaleho")
	public ModelAndView dviewCustomer1(@ModelAttribute("c") Customer c) {
		//List<Customer> list = hodao.getCustomernamed("dcustomer", limitf);

		/*
		 * List<Customer> list1=dao.getCustomername1(c);
		 * 
		 * List<Customer> list3=dao.getCustomername3(c);
		 */
		//List<Purchase> list4 = hodao.getProductsd("dpurchase", session.getSsid());
		List<Product> list10 = hodao.search3(limitf);
		// List<Sale>list5 = hodao.getinvId("dsaleho");
		List<Sales> list9 = hodao.getinvId1d("dsaleho", session.getSsid(), limitf);
	//	List<TaxB> list6 = hodao.getTax();
	//	List<custDisc> list7 = hodao.getCustDis();
	//	List<Spdiscount> list8 = hodao.getSpdis();
		String uri = restBaseUrl + "/HMS/patient/getPatientsByBranch?branchid=" + session.getSsid() + "&limit="
				+ limitf;
		List<Patient> list11 = makeRestCall(uri);
		List<Branch> listb = hodao.getBranch(session.getSsid());

		String realName = listb.get(0).getName();
		String realAddress = listb.get(0).getAddress();
		String realLogo = listb.get(0).getLogo();
		String realIname = listb.get(0).getIop();

		Map<String, Object> model = new HashMap<String, Object>();
		//model.put("list", list);

		model.put("list9", list9);
		model.put("list10", list10);
		model.put("list11", list11);
		model.put("realName", realName);
		model.put("realAddress", realAddress);
		model.put("realLogo", realLogo);
		model.put("realIname", realIname);
		return new ModelAndView("dsales", "model", model);

	}

	@RequestMapping(value = "/dsalehoFilter", method = RequestMethod.GET)
	public @ResponseBody String dsalehoFilter(@ModelAttribute("c") Customer c, HttpServletRequest req,
			HttpServletResponse res) {

		String srch = req.getParameter("srch");
		String srch2 = req.getParameter("srch2");
		String srch3 = req.getParameter("srch3");
		String srch4 = req.getParameter("srch4");
		String srch5 = req.getParameter("srch5");


		List<Sales> list9a = hodao.getinvId1Filterd("saleho", session.getSsid(), srch, limitf);
		List<Product> list10a = hodao.search3Filter(srch2, srch3, limitf);
		// List<Customer>
		// lista=hodao.getCustomernameFilter("customer",srch4,srch5,limitf);
		String uri = restBaseUrl + "/HMS/patient/getPatientsByFilters?branchid=" + session.getSsid() + "&name="
				+ srch4 + "&pid=" + srch5 + "&limit=" + limitf;
		List<Patient> list11a = makeRestCall(uri);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list9a", list9a);
		model.put("list10a", list10a);
		// model.put("lista", lista);
		model.put("list11a", list11a);

		String jsonFormatData = "";

		Gson gson = new Gson();

		jsonFormatData = gson.toJson(model);
		return jsonFormatData;
	}

	@RequestMapping(value = "/dgtinvoice", method = RequestMethod.GET)
	public @ResponseBody String dgetInvoice(@ModelAttribute("p") Sales p) {
		 
		String jsonFormatData = "";
		List<Sales> list2 = hodao.fetchSaleRecords(p.getAutoid(), "dispensarysale", "dispensarysaledetails","dproductstock");
		if(list2.get(0).getIsPatient() != null && list2.get(0).getIsPatient().equalsIgnoreCase("true")) {
	       String uri = restBaseUrl + "/HMS/patient/getPatientById/"+list2.get(0).getCustomer().getCid();
		   Patient patient = makeRestCallForSingleRow(uri);
		      Customer customer = list2.get(0).getCustomer();
			  customer.setName(patient.getFname());
			  customer.setCustomer(patient.getPid());
			  customer.setPhone(patient.getMobile());
	          customer.setSex(patient.getGender());
	          customer.setAge(patient.getAge());
	          customer.setCid(patient.getAutoid());
	          list2.get(0).setCustomer(customer);
		}
		Gson gson = new Gson();
		jsonFormatData = gson.toJson(list2);		
		return jsonFormatData;
	}

	/*
	 * @RequestMapping("/pentry") public ModelAndView
	 * savePurchase(@ModelAttribute("p") Purchase p ){ dao.savepe(p);
	 * 
	 * return new ModelAndView("purchase");//will redirect to viewemp request
	 * mapping }
	 */

	@RequestMapping(value = "/dgetinvprds", method = RequestMethod.GET)
	public @ResponseBody String dgetInvoiceprds(@ModelAttribute("p") Sales p) {
		String jsonFormatData = "";
		List<ProductStocks> list1b = hodao.getinvprods(p.getPid(), "dproductstock", "", session.getSsid());
        Gson gson = new Gson();
		jsonFormatData = gson.toJson(list1b);
		return jsonFormatData;
	}

//sales submission
	@RequestMapping("/dsaleho2")
	public ModelAndView dviewCustomer2(@ModelAttribute("s") Sale s, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("code reacg");
		/*
		 * if((s.getCustName().equalsIgnoreCase("new"))||(s.getCustId().equalsIgnoreCase
		 * ("new"))){ dao.savecs(s); } else{
		 */
		int savess = 0;
		int updsass = 0;
		System.out.println("inelse");
		String name[] = request.getParameterValues("pname");
		String batch[] = request.getParameterValues("batch");
		String expdate[] = request.getParameterValues("expDate");
		String mpack[] = request.getParameterValues("spack");
		String mdesc[] = request.getParameterValues("spsize");
		String sudesc[] = request.getParameterValues("sudesc");
		String stk1[] = request.getParameterValues("stk[]");
		String unit[] = request.getParameterValues("unit");
		String qty1[] = request.getParameterValues("qty[]");
		String up[] = request.getParameterValues("unitprice");
		String price1[] = request.getParameterValues("price[]");
		String ean[] = request.getParameterValues("ean");
		String pid[] = request.getParameterValues("pida");
		List<Sales> list5 = hodao.getinvIdd(s, "dsaleho", session.getSsid());
		s.setInvoice(list5.get(0).getInvoice());
		for (int i = 0; i < qty1.length; i++) {
			savess = hodao.savessd(s, name[i], batch[i], expdate[i], unit[i], up[i], qty1[i], stk1[i], price1[i],
					mpack[i], mdesc[i], sudesc[i], ean[i], "dsaleho", session.getSsid(), Integer.parseInt(pid[i]));
			updsass = hodao.updated(Integer.parseInt(pid[i]), qty1[i], batch[i], "dproductstock", session.getSsid());

		}
		ModelAndView mav = new ModelAndView();
		if (savess > 0 && updsass > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:dsaleho.html");

		}

		else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:dsaleho.html");
		}
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/ERP/saleho.html");
		return mav;// will redirect to viewemp request mapping

	}

//Transfer Branch
	@RequestMapping(value = "/branchtransfer", method = RequestMethod.GET)
	public ModelAndView branchtrans() {
		List<Branch> list2 = hodao.getOtherBranch(session.getSsid());
		List<ProductStocks> list = hodao.getInfoStkSearch1("productstock", session.getSsid());
		List<Product> list1 = hodao.getInfoSearch1(limitf);
		ProductStocksWrapper wrapper = new ProductStocksWrapper();
		wrapper.setProductStockList(new ArrayList<>(list));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", wrapper);
		model.put("list2", list2);
		model.put("list1", list1);
		return new ModelAndView("TransferToBranch", "model", model);
	}

	@RequestMapping(value = "/transtks", method = RequestMethod.POST)
	public ModelAndView transtks(HttpServletRequest request, HttpServletResponse response) {

		int pssave = 0;

		String pid[] = request.getParameterValues("pid");
		String batch[] = request.getParameterValues("batch");
		// String mdate[] = request.getParameterValues("mDate1");
		String exp[] = request.getParameterValues("expdate");
		String cp[] = request.getParameterValues("cp");
		String sp[] = request.getParameterValues("sp");
		String stkstrans[] = request.getParameterValues("stkstrans");
		String fid[] = request.getParameterValues("fid");
		String ean1[] = request.getParameterValues("code");
		String name[] = request.getParameterValues("name");

		String mpack[] = request.getParameterValues("mpack");
		String mpsize[] = request.getParameterValues("mpsize");

		String prqty[] = request.getParameterValues("prqty");
		String prprice[] = request.getParameterValues("prprice");
		// String qty1[] = request.getParameterValues("quantity");
		String sudesc[] = request.getParameterValues("sudesc");
		String stkpr[] = request.getParameterValues("stkpr");
		String markup[] = request.getParameterValues("markup");

		String spdesc[] = request.getParameterValues("spdesc");
		String spsize[] = request.getParameterValues("spsize");
		String stksp[] = request.getParameterValues("stksp");
		String sellqty[] = request.getParameterValues("sellqty");
		String sunits[] = request.getParameterValues("sunits");
		String tprice[] = request.getParameterValues("tprice");

		for (int i = 0; i < name.length; i++) {
			if (session.getSsid() == Integer.parseInt(fid[i])) {
				// TODO review table d
				pssave = hodao.saveproductstockho2(ean1[i], name[i], batch[i], exp[i], mpack[i], mpsize[i], cp[i],
						prqty[i], prprice[i], stkstrans[i], sudesc[i], stkpr[i], markup[i], sp[i], spdesc[i], spsize[i],
						stksp[i], sellqty[i], sunits[i], tprice[i], "dproductstock", Integer.parseInt(fid[i]),
						Integer.parseInt(pid[i]));

			} else {
				pssave = hodao.saveproductstockho2(ean1[i], name[i], batch[i], exp[i], mpack[i], mpsize[i], cp[i],
						prqty[i], prprice[i], stkstrans[i], sudesc[i], stkpr[i], markup[i], sp[i], spdesc[i], spsize[i],
						stksp[i], sellqty[i], sunits[i], tprice[i], "productstock", Integer.parseInt(fid[i]),
						Integer.parseInt(pid[i]));

			}
			hodao.updBranchdet(Integer.parseInt(pid[i]), session.getSsid(), Integer.parseInt(fid[i]), "branchtransfer");
			hodao.updTransfer(Integer.parseInt(pid[i]), batch[i], exp[i], cp[i], sp[i], stkstrans[i],
					"transferdetails");
			hodao.updstkinbr(Integer.parseInt(pid[i]), session.getSsid(), stkstrans[i], batch[i], "productstock");
		}

		// pssave = hodao.saveprStks(ps);
		ModelAndView mav = new ModelAndView();
		if (pssave > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:branchtransfer.html");

		}

		else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:branchtransfer.html");
		}

		return mav;// will redirect to viewemp request mapping
	}

//search in transfer stocks 
	@RequestMapping(value = "/tbsearch", method = RequestMethod.GET)
	public ModelAndView brsearch(@ModelAttribute("ps") Productstock ps) {

		List<Productstock> list = hodao.getstockSearch(ps, "productstock", session.getSsid());
		List<Product> list1 = hodao.getInfoSearch1(limitf);
		List<Branch> list2 = hodao.getBranch();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		model.put("list1", list1);
		model.put("list2", list2);
		model.put("name", ps.getName());
		model.put("code", ps.getCode());
		model.put("category", ps.getCategory());
		model.put("exp", ps.getExpDate());
		model.put("to", ps.getToDate());
		model.put("limit", ps.getRecords());
		model.put("batch", ps.getBatch());
		return new ModelAndView("TransferToBranch", "model", model);
	}

	@RequestMapping(value = "/getStks", method = RequestMethod.GET)
	public @ResponseBody String getStks(HttpServletRequest req, HttpServletResponse resp) {
//	  List<Order> list1 = hodao.getOrderid();
		String jsonFormatData = "";

		List<Productstock> list1b = hodao.getBranchPRS(Integer.parseInt(req.getParameter("location1")),
				Integer.parseInt(req.getParameter("location2")));
		Map<String, Object> model = new HashMap<String, Object>();
		// model.put("list1",list1);
		model.put("list1b", list1b);

		Gson gson = new Gson();

		jsonFormatData = gson.toJson(list1b);

		return jsonFormatData;

		// will redirect to viewemp request mapping

	}

	public List<Patient> makeRestCall(String url) {
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
		ResponseEntity<List<Patient>> result = restTemplate.exchange(url, HttpMethod.GET, entity,
				new ParameterizedTypeReference<List<Patient>>() {
				});
		return result.getBody();
	}
	
	public List<Doctor> makeRestCallDoctorList(String url) {
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
		ResponseEntity<List<Doctor>> result = restTemplate.exchange(url, HttpMethod.GET, entity,
				new ParameterizedTypeReference<List<Doctor>>() {
				});
		return result.getBody();
	}
	
	public Patient makeRestCallForSingleRow(String url) {
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
		ResponseEntity<Patient> result = restTemplate.exchange(url, HttpMethod.GET, entity,
				new ParameterizedTypeReference<Patient>() {
		});
		return result.getBody();
	}

	@RequestMapping(value = "/crsess")
	public @ResponseBody String crsess(HttpServletRequest req, HttpSession session1) {
		session.setSsid(Integer.parseInt(req.getParameter("location")));
		Gson gson = new Gson();
		String jsonFormatData = gson.toJson("success");
		return jsonFormatData;
	}
	
	
	// Methods for REPORTS
	
	@GetMapping(path= {"/getAllSuppliers"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Supply>> getAllSuppliers() {
		return new ResponseEntity<List<Supply>>(hodao.getAllSuppliers(), HttpStatus.OK);
	}

	@RequestMapping(value = "/saveOrderho", method = RequestMethod.POST)
	public ModelAndView saveOrder(@ModelAttribute("d") Order d, HttpServletRequest request, HttpServletResponse response) {
		int saveo = 0;
		int generatedKey = 0;
		int[] batchsave = null;
		int[] batchupdate = null;
		String pack[] = request.getParameterValues("unit");
		String quantity[] = request.getParameterValues("quantity");
	    String pid[] = request.getParameterValues("pida");
        String orderdetailsid[] = request.getParameterValues("orderdetailsid");
        d.setBranchid(session.getSsid());
         if(d.getAutoid() == 0) {
        	generatedKey = hodao.saveorder(d);
            saveo = generatedKey;
         }else {
            saveo = hodao.updateorder(d);	 
         }
 
        List<OrderDetails> insertList = new ArrayList<>();
        List<OrderDetails> updateList = new ArrayList<>();
        Set<Integer> productSet = new HashSet<>();
        List<Integer> productList = null;
        
		for(int i=0; i<orderdetailsid.length; i++) {
			OrderDetails details = new OrderDetails();
			details.setPid(Integer.parseInt(pid[i]));
			details.setUnit(pack[i]);
			details.setQuantity(Integer.parseInt(quantity[i]));
			details.setOrderautoid(generatedKey == 0 ? d.getAutoid() : generatedKey);
			details.setAutoid(Integer.parseInt(orderdetailsid[i]));
			
			if(details.getAutoid() > 0) {
				updateList.add(details);
			}else {
				insertList.add(details);
			}
			productSet.add(Integer.parseInt(pid[i]));
			productList = productSet.stream().collect(Collectors.toList());
		}
		
		batchsave = hodao.saveorderdetails(insertList);
		batchupdate = hodao.updateorderdetails(updateList);
		
		if(batchsave.length > 0 || batchupdate.length > 0) {
			hodao.updateorpr(productList, session.getSsid());
		}

		ModelAndView mav = new ModelAndView();
		if (saveo > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:orderho.html");
        
		}
		
	   else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:orderho.html");
		}
		return mav;
	}
	@RequestMapping(value = "/savePurchases", method = RequestMethod.POST)
	public ModelAndView savePurchases(@ModelAttribute("purchases") Purchases purchases, HttpServletRequest request, HttpServletResponse response) {
		int saveo = 0;
		purchases.setBranchid(session.getSsid());
		List<PurchaseDetails> purchaseDetails = purchases.getPurchaseDetailsList();
		Iterator<PurchaseDetails> iterator = purchaseDetails.iterator();
		
		while(iterator.hasNext()) {
			if(Utils.isEmpty(iterator.next().getBatch())) {
				iterator.remove();
			}
		}
		saveo = hodao.savePurchases(purchases);
		
		List<ProductStocks> insertList = new ArrayList<>();
		List<Integer> reorderLevelList = new ArrayList<>();
		Set<Integer> productIds = new HashSet<>();
		
		for(PurchaseDetails details : purchases.getPurchaseDetailsList()) {
			ProductStocks productStks = new ProductStocks();
			productStks.setPid(details.getPid());
			productStks.setBatch(details.getBatch());
			productStks.setMpack(details.getPackdesc());
			productStks.setMpsize(details.getPacksize());
			productStks.setSudesc(details.getSingleunitdesc());
			productStks.setCp(details.getUnitcp());
			productStks.setExpirydate(details.getExpirydate());
			productStks.setPurchaseqty(details.getPurchaseqty());
			productStks.setPurchaseprice(details.getTotalpurchaseprice());
			productStks.setCurrentstock(details.getStocknumber());
			productStks.setStockprice(details.getStockvaluepurchase());
			productStks.setBranchid(session.getSsid());
			
			insertList.add(productStks);
			productIds.add(details.getPid());
		}
		reorderLevelList = productIds.stream().collect(Collectors.toList());
		int savePs[] = hodao.savePurchaseStocks(insertList) ;
		
		if(savePs.length > 0) {
			hodao.updateReorderFlag(reorderLevelList);
		}
		
		ModelAndView mav = new ModelAndView();
		if (saveo > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:purchaseho.html");
        
		}
		
	   else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:purchaseho.html");
		}
		return mav;	
	}
	@RequestMapping(value = "/saveProductStocks", method = RequestMethod.POST)
	public ModelAndView saveProductStocks(@ModelAttribute("productStocks") ProductStocksWrapper productStocks) {
		int savepr[] = null;
		productStocks.setBranchid(session.getSsid());
		savepr = hodao.updateProductStocks(productStocks.getProductStockList(), "productstock");
		ModelAndView mav = new ModelAndView();
		if (savepr.length > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:stopriceho.html");
        
		}
		
	   else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:stopriceho.html");
		}
		return mav;	
	}
	@RequestMapping(value = "/searchProductStocks", method = RequestMethod.GET)
	public ModelAndView fetchSearchResults(@ModelAttribute("wrapper") ProductStocksWrapper wrapper) {
		wrapper.setBranchid(session.getSsid());
		ProductStocksWrapper wrapperData = new ProductStocksWrapper();
		wrapperData.setProductStockList(new ArrayList<>(hodao.fetchSearchResults(wrapper, "productstock")));
		System.out.println(wrapperData.getProductStockList().size());
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", wrapperData);
		
		return new ModelAndView("ProductStockTableComponent","model",model) ;
	}
	
	@RequestMapping(value = "/dispsearchProductStocks", method = RequestMethod.GET)
	public ModelAndView dispfetchSearchResults(@ModelAttribute("wrapper") ProductStocksWrapper wrapper) {
		wrapper.setBranchid(session.getSsid());
		ProductStocksWrapper wrapperData = new ProductStocksWrapper();
		wrapperData.setProductStockList(new ArrayList<>(hodao.fetchSearchResults(wrapper, "dproductstock")));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", wrapperData);
		
		return new ModelAndView("DispProductStockTableComponent","model",model) ;
	}
	
	@RequestMapping(value = "/searchTransferStocks", method = RequestMethod.GET)
	public ModelAndView searchTransferStocks(@ModelAttribute("wrapper") ProductStocksWrapper wrapper) {
		wrapper.setBranchid(session.getSsid());
		ProductStocksWrapper wrapperData = new ProductStocksWrapper();
		wrapperData.setProductStockList(new ArrayList<>(hodao.fetchSearchResults(wrapper, "productstock")));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", wrapperData);
		return new ModelAndView("TransferTableComponent","model",model) ;
	}
	
	@RequestMapping(value = "/saveSales", method = RequestMethod.POST)
	public @ResponseBody String saveSalesInfo(@ModelAttribute("sales") Sales sale) {
		int saves = 0;
		int savesales[] = null;
		sale.setBranchid(session.getSsid());
		List<SaleDetails> saleDetails = sale.getSaledetailsList();
		Iterator<SaleDetails> iterator = saleDetails.iterator();
		filterRemovedRowsFromList(iterator);
		saves = hodao.saveSaleDetails(sale, "sale","saledetails");
		List<ProductStocks> updateList = new ArrayList<>();
		List<Integer> reorderLevelList = new ArrayList<>();
		Set<Integer> productIds = new HashSet<>();
		
		for(SaleDetails sales : sale.getSaledetailsList()) {
			ProductStocks stks = new ProductStocks();
			stks.setBatch(sales.getBatch());
			stks.setBranchid(session.getSsid());
			stks.setPid(sales.getProduct().getPid());
			stks.setQuantity(sales.getQuantitysold());
			updateList.add(stks);
			productIds.add(sales.getProduct().getPid());
		}
		reorderLevelList = productIds.stream().collect(Collectors.toList());
		
		savesales = hodao.updateCurrentStocks(updateList, "productstock");
		if(savesales.length > 0) {
			hodao.updateReorderFlag(reorderLevelList);
		}
		
		if (saves > 0  && savesales.length > 0) {
			return sale.getInvoice()+","+saves;
		} else {
			return "Failure";
		}	
	}
	
	private void filterRemovedRowsFromList(Iterator<SaleDetails> iterator){
		while(iterator.hasNext()) {
			if(Utils.isEmpty(iterator.next().getBatch())) {
				iterator.remove();
			}
		}
	}
	
	@RequestMapping(value = "/dispsaveSales", method = RequestMethod.POST)
	public @ResponseBody String saveDispSales(@ModelAttribute("sales") Sales sale) {
		int saves = 0;
		int savesales[] = null;
		sale.setBranchid(session.getSsid());
		List<SaleDetails> saleDetails = sale.getSaledetailsList();
		Iterator<SaleDetails> iterator = saleDetails.iterator();
		filterRemovedRowsFromList(iterator);
		saves = hodao.saveSaleDetails(sale, "dispensarysale","dispensarysaledetails");
		List<ProductStocks> updateList = new ArrayList<>();
		for(SaleDetails sales : sale.getSaledetailsList()) {
			ProductStocks stks = new ProductStocks();
			stks.setBatch(sales.getBatch());
			stks.setBranchid(session.getSsid());
			stks.setPid(sales.getProduct().getPid());
			stks.setQuantity(sales.getQuantitysold());
			updateList.add(stks);
		}
		
		savesales = hodao.updateCurrentStocks(updateList, "dproductstock");
	
		
		if (saves > 0  && savesales.length > 0) {
			return sale.getInvoice();
		} else {
			return "Failure";
		}	
	}
	
	@RequestMapping(value = "/saveDispProductStocks", method = RequestMethod.POST)
	public ModelAndView saveDispProductStocks(@ModelAttribute("productStocks") ProductStocksWrapper productStocks) {
		int savepr[] = null;
		productStocks.setBranchid(session.getSsid());
		savepr = hodao.updateProductStocks(productStocks.getProductStockList(), "dproductstock");
		ModelAndView mav = new ModelAndView();
		if (savepr.length > 0) {
			mav.addObject("message", "The record has been saved sucessfully");
			mav.setViewName("redirect:dstopriceho.html");
        
		}
		
	   else {
			mav.addObject("message", "Record could not be saved successfully ");
			mav.setViewName("redirect:dstopriceho.html");
		}
		return mav;	
	}
	
	@RequestMapping(value = "/transferStocks", method = RequestMethod.POST)
	public ModelAndView transferStocks(@ModelAttribute("productStocks") ProductStocksWrapper productStocks){
		int pssave = 0;
		List<ProductStocks> stocksList = productStocks.getProductStockList().stream().filter(stkData -> !Utils.isEmpty(stkData.getStatus()) && stkData.getStatus().equalsIgnoreCase("on")).map(stkData -> {stkData.setBranchid(session.getSsid());return stkData;}).collect(Collectors.toList());
		try {
			pssave = hodao.transferStocks(stocksList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mav = new ModelAndView();
		if (pssave > 0) {
			mav.addObject("message", "The stocks has been transferred sucessfully");
			mav.setViewName("redirect:branchtransfer.html");
		}
		else {
			mav.addObject("message", "Stocks could not be transferred. Please check with Techwedge team to know more about this issue.");
			mav.setViewName("redirect:branchtransfer.html");
		}
		return mav;
	}
	
	@RequestMapping("/incomeByDoctor")
	public ModelAndView allDoctors(@ModelAttribute("c") Customer c) {
		String uri = restBaseUrl + "/HMS/doctor/allDoctors";
		List<Doctor> doctorList = makeRestCallDoctorList(uri);
		List<Branch> listb = hodao.getBranch(session.getSsid());

		String realName = listb.get(0).getName();
		String realAddress = listb.get(0).getAddress();
		String realLogo = listb.get(0).getLogo();
		String realIname = listb.get(0).getIop();

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("doctorList", doctorList);
		model.put("realName", realName);
		model.put("realAddress", realAddress);
		model.put("realLogo", realLogo);
		model.put("realIname", realIname);
		return new ModelAndView("incomeByDoctor", "model", model);

	}
	
	@GetMapping(path= {"/getAllBranch"},produces={MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Branch>> getAllBranch() {
		return new ResponseEntity<List<Branch>>(hodao.getAllBranch(), HttpStatus.OK);
	}
}
