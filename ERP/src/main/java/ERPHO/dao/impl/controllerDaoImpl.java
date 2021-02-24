package ERPHO.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jca.cci.InvalidResultSetAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hms.helper.QueryHelper;
import com.hms.utils.Utils;

import ERPHO.model.Branch;
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
import ERPHO.model.SaleDetails;
import ERPHO.model.Sales;
import ERPHO.model.Spdiscount;
import ERPHO.model.Supply;
import ERPHO.model.TaxB;
import ERPHO.model.custDisc;
import ERPHO.model.quotation;

public class controllerDaoImpl extends QueryHelper implements controllerDao {

	JdbcTemplate template;
	public static String QUERY_PATH = "erpho-controller";

	public controllerDaoImpl() {
		super("/queries/" + QUERY_PATH + ".yml");
	}

	@Override
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public List<Manufacture> getM() {
		return template.query(getQuery("getManufacturer"), new Object[] {}, new RowMapper<Manufacture>() {
			public Manufacture mapRow(ResultSet rs, int row) throws SQLException {
				Manufacture p = new Manufacture();
				p.setMid(rs.getInt("maxid"));
				return p;
			}
		});
	}

	// save manufacture
	@Override
	public int save(Manufacture m) {
		System.out.println("Manufacture is" + m.getMid());
		String sql = getQuery("saveManufacture");

		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {
				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, m.getName());
					ps.setString(2, m.getMedical());
					ps.setString(3, m.getAddress1());
					ps.setString(4, m.getAddress2());
					ps.setString(5, m.getCity());
					ps.setString(6, m.getState());
					ps.setString(7, m.getCountry());
					ps.setString(8, m.getPincode());
					ps.setString(9, m.getPhone());
					ps.setString(10, m.getMobile());
					ps.setString(11, m.getFax());
					ps.setString(12, m.getEmail());
					ps.setString(13, m.getComments());
		            ps.setString(14, m.getActive());
					return ps;
				}
			}, keyHolder);

		} catch (Exception e) {
			throw new RuntimeException("Manufacturer not Inserted", e);
		}
		return keyHolder.getKey().intValue();
	}

	@Override
	public int updateManufacture(Manufacture m) {
		System.out.println("Manufacture is update" + m.getMid());
		String sql = getQuery("updateManufacture");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, new Object[] { m.getName(), m.getMedical(), m.getAddress1(), m.getAddress2(), m.getCity(),
					m.getState(),m.getCountry(), m.getPincode(),m.getPhone(), m.getMobile(), m.getFax(), m.getEmail(), m.getComments(),m.getActive(),m.getMid()});
		} catch (InvalidResultSetAccessException e) {
			throw new RuntimeException("Manufacturer not Inserted", e);
		} catch (DataAccessException e) {
			throw new RuntimeException("Manufacturer not Inserted", e);
		}
		return returnVal;
	}

	// save supply master
	@Override
	public int saves(Supply s) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("saves");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, s.getName());
					ps.setString(2, s.getMedical());
					ps.setString(3, s.getAddress1());
					ps.setString(4, s.getAddress2());
					ps.setString(5, s.getCity());
					ps.setString(6, s.getState());
					ps.setString(7, s.getCountry());
					ps.setString(8, s.getPincode());
					ps.setString(9, s.getPhone());
					ps.setString(10, s.getMobile());
					ps.setString(11, s.getFax());
					ps.setString(12, s.getEmail());
					ps.setString(13, s.getPoc());
					ps.setString(14, s.getPc());
					ps.setString(15, s.getWebsite());
					ps.setString(16, s.getManufacturers());
					ps.setString(17, s.getComments());
					ps.setString(18, s.getActive());
					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}

		return keyHolder.getKey().intValue();
	}

	@Override
	public int updatesupply(Supply s) {

		String sql = getQuery("updates");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, new Object[] {s.getName(), s.getMedical(), s.getAddress1(), s.getAddress2(), s.getCity(),
					s.getState(), s.getCountry(), s.getPincode(), s.getPhone(), s.getMobile(), s.getFax(), s.getEmail(),
					s.getPoc(), s.getPc(), s.getWebsite(), s.getManufacturers(), s.getComments(), s.getActive(),s.getSid()});
		} catch (InvalidResultSetAccessException e) {
                    System.out.println(e);
		} catch (DataAccessException e) {
			        System.out.println(e);
		}
		return returnVal;
	}

	// To display manufacture list in supplier masters
	@Override
	public List<Manufacture> getManufacturename() {
		String sql = getQuery("getManufactureName");
		return template.query(sql, new RowMapper<Manufacture>() {
			public Manufacture mapRow(ResultSet rs, int row) throws SQLException {
				Manufacture man = new Manufacture();

				man.setName(rs.getString("name"));
				man.setMedical(rs.getString("type"));
				man.setAddress1(rs.getString("address1"));
				man.setAddress2(rs.getString("address2"));
				man.setCity(rs.getString("city"));
				man.setState(rs.getString("state"));
				man.setCountry(rs.getString("country"));
				man.setPincode(rs.getString("pincode"));
				man.setPhone(rs.getString("phone"));
				man.setMobile(rs.getString("mobile"));
				man.setFax(rs.getString("fax"));
				man.setEmail(rs.getString("email"));
				man.setComments(rs.getString("comment"));
				man.setMid(rs.getInt("mid"));
				man.setActive(rs.getString("active"));
				return man;
			}
		});
	}

	@Override
	public List<Manufacture> getManufacturename1() {
		String sql = getQuery("getManufacturename1");
		String active = "on";
		return template.query(sql, new Object[] { active }, new RowMapper<Manufacture>() {
			public Manufacture mapRow(ResultSet rs, int row) throws SQLException {
				Manufacture man = new Manufacture();

				man.setName(rs.getString("name"));
				man.setMedical(rs.getString("type"));
				man.setAddress1(rs.getString("address1"));
				man.setAddress2(rs.getString("address2"));
				man.setCity(rs.getString("city"));
				man.setState(rs.getString("state"));
				man.setCountry(rs.getString("country"));
				man.setPincode(rs.getString("pincode"));
				man.setPhone(rs.getString("phone"));
				man.setMobile(rs.getString("mobile"));
				man.setFax(rs.getString("fax"));
				man.setEmail(rs.getString("email"));
				man.setComments(rs.getString("comment"));
				man.setMid(rs.getInt("mid"));
				man.setActive(rs.getString("active"));
				return man;
			}
		});
	}

	@Override
	public List<Manufacture> getcheckmname1(String name) {
	String sql = getQuery("getcheckmname1");
		return template.query(sql, new Object[] { name }, new RowMapper<Manufacture>() {
			public Manufacture mapRow(ResultSet rs, int row) throws SQLException {
				Manufacture m = new Manufacture();
				m.setName(rs.getString("name"));
				return m;

			}
		});
	}

	// to display supplier list in supply
	@Override
	public List<Supply> getS() {
		String sql = getQuery("getS");
		return template.query(sql, new RowMapper<Supply>() {
			public Supply mapRow(ResultSet rs, int row) throws SQLException {
				Supply p = new Supply();
				p.setSid(rs.getInt("maxid"));
				return p;
			}
		});
	}

	@Override
	public List<Supply> getSupplyname() {
		String sql = getQuery("getSupplyname");
		String active = "on";
		return template.query(sql, new Object[] { active }, new RowMapper<Supply>() {
			public Supply mapRow(ResultSet rs, int row) throws SQLException {
				Supply supp = new Supply();
				supp.setName(rs.getString("name"));
				supp.setMedical(rs.getString("type"));
				supp.setAddress1(rs.getString("address1"));
				supp.setAddress2(rs.getString("address2"));
				supp.setCity(rs.getString("city"));
				supp.setState(rs.getString("state"));
				supp.setCountry(rs.getString("country"));
				supp.setPincode(rs.getString("pincode"));
				supp.setPhone(rs.getString("phone"));
				supp.setMobile(rs.getString("mobile"));
				supp.setFax(rs.getString("fax"));
				supp.setEmail(rs.getString("email"));
				supp.setPoc(rs.getString("poc"));
				supp.setPc(rs.getString("pc"));
				supp.setWebsite(rs.getString("website"));
				supp.setManufacturers(rs.getString("manufacturers"));
				supp.setComments(rs.getString("comment"));
				supp.setActive(rs.getString("active"));
				supp.setSid(rs.getInt("sid"));
				return supp;
			}
		});
	}

	@Override
	public List<Supply> getSupplyname1() {
		String sql = getQuery("getSuplyname1");
		return template.query(sql, new RowMapper<Supply>() {
			public Supply mapRow(ResultSet rs, int row) throws SQLException {
				Supply supp = new Supply();
				supp.setName(rs.getString("name"));
				supp.setMedical(rs.getString("type"));
				supp.setAddress1(rs.getString("address1"));
				supp.setAddress2(rs.getString("address2"));
				supp.setCity(rs.getString("city"));
				supp.setState(rs.getString("state"));
				supp.setCountry(rs.getString("country"));
				supp.setPincode(rs.getString("pincode"));
				supp.setPhone(rs.getString("phone"));
				supp.setMobile(rs.getString("mobile"));
				supp.setFax(rs.getString("fax"));
				supp.setEmail(rs.getString("email"));
				supp.setPoc(rs.getString("poc"));
				supp.setPc(rs.getString("pc"));
				supp.setWebsite(rs.getString("website"));
				supp.setManufacturers(rs.getString("manufacturers"));
				supp.setComments(rs.getString("comment"));
				supp.setActive(rs.getString("active"));
				supp.setSid(rs.getInt("sid"));
				return supp;
			}
		});
	}

	@Override
	public List<Supply> getchecksname1(String name) {
		String sql = getQuery("getchecksname1");
		return template.query(sql, new Object[] { name }, new RowMapper<Supply>() {
			public Supply mapRow(ResultSet rs, int row) throws SQLException {
				Supply s = new Supply();
				s.setName(rs.getString("name"));
				return s;

			}
		});
	}

	// save customer
	@Override
	public int savec(Customer c, String table) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("savec");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, c.getCustomer());
					ps.setString(2, c.getName());
					ps.setString(3, c.getMedical());
					ps.setString(4, c.getAge());
					ps.setString(5, c.getSex());
					ps.setString(6, c.getPhone());
					ps.setString(7, c.getAddress1());
					ps.setString(8, c.getAddress2());
					ps.setString(9, c.getMobile());
					ps.setString(10, c.getCity());
					ps.setString(11, c.getFax());
					ps.setString(12, c.getState());
					ps.setString(13, c.getEmail());
					ps.setString(14, c.getCountry());
					ps.setString(15, c.getComments());
					ps.setString(16, c.getPincode());
					ps.setString(17, c.getActive());
					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}
		return keyHolder.getKey().intValue();
	}

	// save customer
	@Override
	public int updateCustomer(Customer c, String table) {
		String sql = getQuery("updatec");
		int returnVal = 0;

		try {
			returnVal = template.update(sql, new Object[] {c.getName(), c.getMedical(), c.getAge(), c.getSex(), c.getPhone(),
					c.getAddress1(), c.getAddress2(), c.getMobile(), c.getCity(), c.getFax(), c.getState(),
					c.getEmail(), c.getCountry(), c.getComments(), c.getPincode(), c.getActive(),c.getCid()});
		} catch (InvalidResultSetAccessException e) {
			System.out.println(e);
		} catch (DataAccessException e) {
			System.out.println(e);
		}
		return returnVal;
	}
	

	@Override
	public int savecd(Customer c, String table) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("savecd");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, c.getCustomer());
					ps.setString(2, c.getName());
					ps.setString(3, c.getMedical());
					ps.setString(4, c.getAge());
					ps.setString(5, c.getSex());
					ps.setString(6, c.getPhone());
					ps.setString(7, c.getAddress1());
					ps.setString(8, c.getAddress2());
					ps.setString(9, c.getMobile());
					ps.setString(10, c.getCity());
					ps.setString(11, c.getFax());
					ps.setString(12, c.getState());
					ps.setString(13, c.getEmail());
					ps.setString(14, c.getCountry());
					ps.setString(15, c.getComments());
					ps.setString(16, c.getPincode());
					ps.setString(17, c.getActive());
					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}
		return keyHolder.getKey().intValue();
	}
	@Override
	public int updateCustomerd(Customer c, String table) {
		String sql = getQuery("updatecd");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, new Object[] {c.getName(), c.getMedical(), c.getAge(), c.getSex(), c.getPhone(),
					c.getAddress1(), c.getAddress2(), c.getMobile(), c.getCity(), c.getFax(), c.getState(),
					c.getEmail(), c.getCountry(), c.getComments(), c.getPincode(), c.getActive()});
		} catch (InvalidResultSetAccessException e) {
			System.out.println(e);
		} catch (DataAccessException e) {
			System.out.println(e);
		}
		return returnVal;
	}

	// getCustomer datails
	@Override
	public List<Customer> getCustomername(String table, String limit) {
		String sql = getQuery("getCustomername");
		String active = "active";
		return template.query(sql, new Object[] { active, Integer.parseInt(limit) }, new RowMapper<Customer>() {
			public Customer mapRow(ResultSet rs, int row) throws SQLException {
				Customer c = new Customer();
				c.setCustomer(rs.getString("customer"));
				c.setName(rs.getString("name"));
				c.setPhone(rs.getString("phone"));
				c.setAge(rs.getString("age"));
				c.setSex(rs.getString("sex"));
				c.setMedical(rs.getString("type"));
				c.setCid(rs.getInt("cid"));
				return c;
			}
		});
	}

	public List<Customer> getCustomernamed(String table, String limit) {
		String sql = getQuery("getCustomernamed");
		String active = "active";
		return template.query(sql, new Object[] { active, Integer.parseInt(limit) }, new RowMapper<Customer>() {
			public Customer mapRow(ResultSet rs, int row) throws SQLException {
				Customer c = new Customer();
				c.setCustomer(rs.getString("customer"));
				c.setName(rs.getString("name"));
				c.setPhone(rs.getString("phone"));
				c.setAge(rs.getString("age"));
				c.setSex(rs.getString("sex"));
				c.setMedical(rs.getString("type"));
				c.setCid(rs.getInt("cid"));
				return c;
			}
		});
	}

	@Override
	public List<Customer> getCustomernameFilter(String table, String srch4, String srch5, String limit) {
		String sql = getQuery("getCustomernameFilter");
		String active = "on";
		return template.query(sql, new Object[] { Utils.getLikeParamValue(srch4, false),
				Utils.getLikeParamValue(srch5, false), active, Integer.parseInt(limit) }, new RowMapper<Customer>() {
					public Customer mapRow(ResultSet rs, int row) throws SQLException {
						Customer c = new Customer();
						c.setCustomer(rs.getString("customer"));
						c.setName(rs.getString("name"));
						c.setPhone(rs.getString("phone"));
						c.setAge(rs.getString("age"));
						c.setSex(rs.getString("sex"));
						c.setMedical(rs.getString("type"));
						c.setCid(rs.getInt("cid"));
						return c;
					}
				});
	}

	@Override
	public List<Customer> getCustomername1(String table) {
		String sql = getQuery("getCustomername1");
		return template.query(sql, new RowMapper<Customer>() {
			public Customer mapRow(ResultSet rs, int row) throws SQLException {
				Customer c = new Customer();
				c.setCustomer(rs.getString("customer"));
				c.setName(rs.getString("name"));
				c.setCid(rs.getInt("cid"));
				c.setMedical(rs.getString("type"));
				c.setAge(rs.getString("age"));
				c.setSex(rs.getString("sex"));
				c.setPhone(rs.getString("phone"));
				c.setAddress1(rs.getString("address1"));
				c.setAddress2(rs.getString("address2"));
				c.setMobile(rs.getString("mobile"));
				c.setCity(rs.getString("city"));
				c.setFax(rs.getString("fax"));
				c.setState(rs.getString("state"));
				c.setEmail(rs.getString("email"));
				c.setCountry(rs.getString("country"));
				c.setComments(rs.getString("comment"));
				c.setPincode(rs.getString("pincode"));
				c.setActive(rs.getString("active"));
				return c;
			}
		});
	}

	@Override
	public List<Customer> getCustomername1d(String table) {
		String sql = getQuery("getCustomername1d");

		return template.query(sql, new RowMapper<Customer>() {
			public Customer mapRow(ResultSet rs, int row) throws SQLException {
				Customer c = new Customer();
				c.setCustomer(rs.getString("customer"));
				c.setName(rs.getString("name"));
                c.setCid(rs.getInt("cid"));
				c.setMedical(rs.getString("type"));
				c.setAge(rs.getString("age"));
				c.setSex(rs.getString("sex"));
				c.setPhone(rs.getString("phone"));
				c.setAddress1(rs.getString("address1"));
				c.setAddress2(rs.getString("address2"));
				c.setMobile(rs.getString("mobile"));
				c.setCity(rs.getString("city"));
				c.setFax(rs.getString("fax"));
				c.setState(rs.getString("state"));
				c.setEmail(rs.getString("email"));
				c.setCountry(rs.getString("country"));
				c.setComments(rs.getString("comment"));
				c.setPincode(rs.getString("pincode"));
				c.setActive(rs.getString("active"));
				return c;
			}
		});
	}

	@Override
	public List<Customer> getCustomerId(String table) {
		String sql = getQuery("getCustomerId");
		return template.query(sql, new RowMapper<Customer>() {
			public Customer mapRow(ResultSet rs, int row) throws SQLException {
				Customer c = new Customer();
				c.setCustomer(rs.getString("id"));
				return c;
			}
		});
	}

	@Override
	public List<Customer> getCustomerIdd(String table) {
		String sql = getQuery("getCustomerIdd");
		return template.query(sql, new RowMapper<Customer>() {
			public Customer mapRow(ResultSet rs, int row) throws SQLException {
				Customer c = new Customer();
				c.setCustomer(rs.getString("id"));
				return c;
			}
		});
	}

	@Override
	public List<Customer> getcheckcphone(String phone, String table) {
		String sql = getQuery("getcheckcphone");
		return template.query(sql, new Object[] { phone }, new RowMapper<Customer>() {
			public Customer mapRow(ResultSet rs, int row) throws SQLException {
				Customer c = new Customer();
				c.setPhone(rs.getString("phone"));
				return c;

			}
		});
	}

	@Override
	public List<Customer> getcheckcphoned(String phone, String table) {
		String sql = getQuery("getcheckcphoned");
		return template.query(sql, new RowMapper<Customer>() {
			public Customer mapRow(ResultSet rs, int row) throws SQLException {
				Customer c = new Customer();
				c.setPhone(rs.getString("phone"));
				return c;

			}
		});
	}

	// save product
	@Override
	public int savep(Product p) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("savep");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, p.getName());
					ps.setString(2, p.getDescr());
					ps.setString(3, p.getPc());
					ps.setString(4, p.getPrc());
					ps.setString(5, p.getManufacturer());
					ps.setString(6, p.getComposition());
					ps.setString(7, p.getSp());
					ps.setString(8, p.getBc());
					ps.setString(9, p.getMc());
					ps.setString(10, p.getRl());
					ps.setString(11, p.getRq());
					ps.setString(12, p.getDoc());
					ps.setString(13, p.getDsc());
					ps.setString(14, p.getSupplier());
					ps.setString(15, p.getActive());
					ps.setString(16, p.getDps());
					ps.setString(17, p.getDsp());
					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}

		return keyHolder.getKey().intValue();
	}
	@Override
	public int updateProduct(Product p) {
		String sql = getQuery("updateproduct");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, p.getName(), p.getDescr(), p.getPc(), p.getPrc(), p.getManufacturer()
					 	, p.getComposition(), p.getSp(), p.getBc(), p.getMc(), p.getRl()
						, p.getRq(), p.getDoc(), p.getDsc(), p.getSupplier(), p.getActive()
						, p.getDps(), p.getDsp(), p.getPid());
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;
	}
	@Override
	public int updatesavep(Product p) {
		String sql = getQuery("updatesavep");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, new Object[] {p.getName(), p.getDescr(), p.getPc(), p.getPrc(), p.getManufacturer(),
					p.getComposition(), p.getSp(), p.getBc(), p.getMc(), p.getRl(), p.getRq(), p.getDoc(), p.getDsc(),
					p.getSupplier(), p.getActive(), p.getDps(), p.getDsp(), p.getProduct()});
		} catch (InvalidResultSetAccessException e) {
              System.out.println(e);
		} catch (DataAccessException e) {
			System.out.println(e);
		}
		return returnVal;
	}

	// to display products on product master on page load
	@Override
	public List<Product> getP() {
		String sql = getQuery("getP");
		return template.query(sql, new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product p = new Product();
				p.setProduct(rs.getInt("pid"));
				return p;
			}
		});
	}

	@Override
	public List<Product> search() {
		String sql = getQuery("search");
		String active = "active";
		return template.query(sql, new Object[] { active }, new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product s = new Product();
				s.setName(rs.getString("name"));
				s.setDescr(rs.getString("descr"));
				s.setPc(rs.getString("pc"));
				s.setPrc(rs.getString("prc"));
				s.setManufacturer(rs.getString("manufacturer"));
				s.setComposition(rs.getString("composition"));
				s.setSp(rs.getString("sp"));
				s.setBc(rs.getString("bc"));
				s.setMc(rs.getString("mc"));
				s.setRl(rs.getString("rl"));
				s.setRq(rs.getString("rq"));
				s.setDoc(rs.getString("doc"));
				s.setDsc(rs.getString("dsc"));
				s.setSupplier(rs.getString("supplier"));
				s.setStocks(rs.getString("qty"));
				return s;

			}
		});
	}

	@Override
	public List<Product> search1() {
		String sql = getQuery("search1");
		String active = "active";
		return template.query(sql, new Object[] { active }, extractProducts());
	}
	private RowMapper<Product> extractProducts(){
		return new RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Product s = new Product();
				s.setName(rs.getString("name"));
				s.setDescr(rs.getString("descr"));
				s.setPc(rs.getString("pc"));
				s.setPrc(rs.getString("prc"));
				s.setManufacturer(rs.getString("manufacturer"));
				s.setComposition(rs.getString("composition"));
				s.setSp(rs.getString("sp"));
				s.setBc(rs.getString("bc"));
				s.setMc(rs.getString("mc"));
				s.setRl(rs.getString("rl"));
				s.setRq(rs.getString("rq"));
				s.setDoc(rs.getString("doc"));
				s.setDsc(rs.getString("dsc"));
				s.setSupplier(rs.getString("supplier"));
				s.setStocks(rs.getString("sum"));
				s.setActive(rs.getString("active"));
				s.setProduct(rs.getInt("pid"));
				s.setDps(rs.getString("dps"));
				s.setDsp(rs.getString("dsp"));
				return s;

			}
		};
	}

	@Override
	public List<Product> searchProducts(String productName,String productCode) {
		String sql = getQuery("searchProducts");
		String active = "active";
		if(productCode != null && !productCode.isEmpty()) {
			sql = sql.replace("and name like ?", "");
			return template.query(sql, new Object[] { active,productCode }, extractProducts());
		}else {
			sql = sql.replace("and prc = ?", "");
			return template.query(sql, new Object[] { active,Utils.getLikeParamValue(productName,false) }, extractProducts());
		}
		
		
	}

	
	@Override
	public List<Product> search3(String limit) {
		String sql = getQuery("search3");
		String active = "active";
		return template.query(sql, new Object[] { active, Integer.parseInt(limit) }, new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product s = new Product();
				s.setName(rs.getString("name"));
				s.setPrc(rs.getString("prc"));
				s.setPid(rs.getInt("pid"));
				return s;

			}
		});
	}

	@Override
	public List<Product> search3Filter(String srch2, String srch3, String limit) {
		String sql = getQuery("search3Filter");
		String active = "active";
		return template
				.query(sql,
						new Object[] { active, Utils.getLikeParamValue(srch2, false),
								Utils.getLikeParamValue(srch3, false), Integer.parseInt(limit) },
						new RowMapper<Product>() {
							public Product mapRow(ResultSet rs, int row) throws SQLException {
								Product s = new Product();
								s.setName(rs.getString("name"));
								s.setPrc(rs.getString("prc"));
								s.setPid(rs.getInt("pid"));
								return s;

							}
						});
	}

	@Override
	public List<Product> getcheckpcode(String code) {

		String sql = getQuery("getcheckpcode");
		return template.query(sql, new Object[] { code }, new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product s = new Product();

				s.setPrc(rs.getString("prc"));

				return s;

			}
		});
	}

	@Override
	public List<Product> getcheckpname(String name) {
		String sql = getQuery("getcheckpname");
		return template.query(sql, new Object[] { name }, new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product s = new Product();
				s.setName(rs.getString("name"));
				return s;

			}
		});
	}

	// ,(select Batch from purchase where purchase.ean = product.prc),(select
	// expDate from purchase where purchase.ean=product.prc),(select unit from
	// purchase where purchase.ean=product.prc),(select unitprice from purchase
	// where purchase.ean=product.prc),(select quantity from purchase where
	// purchase.ean=product.prc),(select total from purchase where
	// purchase.ean=product.prc)
	@Override
	public List<Product> searchProduct(String limit) {
		String sql = getQuery("searchProduct");
		// ,supplier,bc,rq,prc,sumstockm,dps,pid
		String active = "active";
		return template.query(sql, new Object[] { active, Integer.parseInt(limit) }, new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product s = new Product();
				// System.out.println(rs.getString(2));
				s.setName(rs.getString("name"));
				s.setSupplier(rs.getString("supplier"));
				s.setBc(rs.getString("bc"));
				s.setRq(rs.getString("rq"));
				s.setPrc(rs.getString("prc"));
				s.setStocks(rs.getString("sumstock"));
				s.setDps(rs.getString("dps"));
				s.setProduct(rs.getInt("pid"));
				return s;
			}
		});
	}

	@Override
	public List<Product> searchProductFilter(String srch, String srch2, String limit) {
		String sql = getQuery("searchProductFilter");
		return template.query(sql, new Object[] { Utils.getLikeParamValue(srch, false),
				Utils.getLikeParamValue(srch2, false), Integer.parseInt(limit) }, new RowMapper<Product>() {
					public Product mapRow(ResultSet rs, int row) throws SQLException {
						Product s = new Product();
						s.setName(rs.getString("name"));
						s.setSupplier(rs.getString("supplier"));
						s.setBc(rs.getString("bc"));
						s.setRq(rs.getString("rq"));
						s.setPrc(rs.getString("prc"));
						s.setStocks(rs.getString("sumstock"));
						s.setDps(rs.getString("dps"));
						s.setProduct(rs.getInt("pid"));
						return s;

					}
				});
	}

	@Override
	public List<Product> Reorder() {
		String sql = getQuery("Reorder");
		String active = "on";
		return template.query(sql, new Object[] { active }, new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product s = new Product();
				s.setName(rs.getString("name"));
				s.setPrc(rs.getString("prc"));
				s.setStocks(rs.getString("currentstock"));
				s.setDps(rs.getString("dps"));
				s.setProduct(rs.getInt("pid"));
				return s;

			}
		});
	}

	// to display the products which are below re-order-level
	@Override
	public List<Product> searchRq() {
		String sql = getQuery("searchRq");
		String active = "active";
		return template.query(sql, new Object[] { active }, new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product s = new Product();
				// name,supplier,bc,rq
				s.setName(rs.getString("name"));
				s.setSupplier(rs.getString("supplier"));
				s.setBc(rs.getString("bc"));
				s.setRq(rs.getString("rq"));
				return s;

			}
		});
	}

	@Override
	public List<Purchase> getCurrentstks() {
		String sql = getQuery("getCurrentstks");
		return template.query(sql, new RowMapper<Purchase>() {
			public Purchase mapRow(ResultSet rs, int row) throws SQLException {
				Purchase p = new Purchase();
				p.setProductName(rs.getString("productName"));
				p.setQuantity(rs.getString("quantity"));
				return p;
			}
		});
	}

	@Override
	public List<Order> getorderId(int no, String table, Order o) {
		String sql = getQuery("getorderId");
		return template.query(sql, new Object[] { o.getOrderid(), no }, new RowMapper<Order>() {
			public Order mapRow(ResultSet rs, int row) throws SQLException {
				Order ord = new Order();
				ord.setOrderid(rs.getString("id"));

				return ord;
			}
		});
	}

	@Override
	public List<Order> getorderDetails(int no, String limit) {
		String sql = getQuery("getOrder");//getQuery("getorderDetails");
		String active = "on";
		return template.query(sql, new Object[] {no,Integer.parseInt(limit) }, new RowMapper<Order>() {
			public Order mapRow(ResultSet rs, int row) throws SQLException {
				Order ord = new Order();
				ord.setAutoid(rs.getInt("autoid"));
				ord.setOrderid(rs.getString("orderid"));
				ord.setAuthor(rs.getString("author"));
				ord.setDelivery(rs.getString("delivery"));
				ord.setCount(rs.getInt("count"));
				ord.setSupplier(rs.getString("name"));
				ord.setSupplierid(rs.getInt("supplierid"));
				ord.setBranchid(rs.getInt("branchid"));
                ord.setOrderDate(rs.getDate("orderDate"));
				return ord;
			}
		});
	}

	@Override
	public List<Order> getorderDetailsFilter(int no, String srch3, String limit) {
		String sql = getQuery("getOrderFilter");
		return template.query(sql, new Object[] { no, Utils.getLikeParamValue(srch3, false), Integer.parseInt(limit) },
				new RowMapper<Order>() {
					public Order mapRow(ResultSet rs, int row) throws SQLException {
						Order ord = new Order();
						ord.setAutoid(rs.getInt("autoid"));
						ord.setOrderid(rs.getString("orderid"));
						ord.setAuthor(rs.getString("author"));
						ord.setDelivery(rs.getString("delivery"));
						ord.setCount(rs.getInt("count"));
						ord.setSupplier(rs.getString("name"));
						ord.setSupplierid(rs.getInt("supplierid"));
						ord.setBranchid(rs.getInt("branchid"));
						ord.setOrderDate(rs.getDate("orderDate"));
						return ord;
					}
				});
	}

	// to display the active order details distinct
	// orderid,orderDate,delivery,author,productName,Supplier,unit,quantity,stock,unitprice,total,ean

	@Override
	public List<OrderDetails> getorderDetails1(String string, int no) {
		String sql = getQuery("fetchOrderDetails");//getQuery("getorderDetails1");
		return template.query(sql, new Object[] { no }, new RowMapper<OrderDetails>() {
			public OrderDetails mapRow(ResultSet rs, int row) throws SQLException {
				OrderDetails ord = new OrderDetails();
				
				ord.setEan(rs.getString("prc"));
				ord.setProductName(rs.getString("name"));
				ord.setPid(rs.getInt("pid"));
				ord.setUnit(rs.getString("unit"));
				ord.setQuantity(rs.getInt("quantity"));
				ord.setStks(rs.getInt("currentstocks"));
			    ord.setAutoid(rs.getInt("autoid"));
			    ord.setOrderautoid(rs.getInt("orderautoid"));
				
				return ord;
			}
		});
	}

	// save order //
/*	@Override
	public int saveo(Order o, String name, String pack, String quantity, String stock, String ean, int no, int pid) {

		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, o.getOrderid());
					ps.setString(2, o.getOrderDate());
					ps.setString(3, o.getAuthor());
					ps.setString(4, name);
					ps.setString(5, o.getSupplier());
					ps.setString(6, pack);
					ps.setString(7, quantity);
					ps.setString(8, o.getCount());
					ps.setString(9, o.getActive());
					ps.setString(10, stock);
					ps.setString(11, ean);
					ps.setInt(12, no);
					ps.setInt(13, pid);
					ps.setString(14, o.getOrderDate());
					ps.setString(15, o.getSupplier());
					ps.setString(16, o.getAuthor());
					ps.setString(17, name);
					ps.setString(18, pack);
					ps.setString(19, quantity);
					ps.setString(20, o.getCount());
					ps.setString(21, o.getActive());
					ps.setString(22, stock);
					ps.setString(23, ean);
					ps.setInt(24, no);
					ps.setInt(25, pid);
					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}

		return keyHolder.getKey().intValue();
	}

	@Override
	public int Updsaveo(Order o, String name, String pack, String quantity, String stock, String ean, int no, int pid) {
		String sql = getQuery("Updsaveo");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, o.getOrderDate(), o.getSupplier(), o.getAuthor(), name, pack, quantity,
					o.getCount(), o.getActive(), stock, ean, no, o.getOrderid(), pid);
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;
	}
*/
	@Override
	public void updateActive(String name) {
		// TODO Auto-generated method stub

	}

	// auto generate invoice id

	@Override
	public List<Sales> getinvId(Sale s, String table, int no) {
		String sql = getQuery("getinvId");
		return template.query(sql, new Object[] { no, no }, new RowMapper<Sales>() {
			public Sales mapRow(ResultSet rs, int row) throws SQLException {
				Sales s = new Sales();
				s.setInvoice(rs.getString("id"));
				return s;
			}
		});
	}

	@Override
	public List<Sales> getinvIdd(Sale s, String table, int no) {
		String sql = getQuery("getinvIdd");
		return template.query(sql, new Object[] { no, no }, new RowMapper<Sales>() {
			public Sales mapRow(ResultSet rs, int row) throws SQLException {
				Sales s = new Sales();
				s.setInvoice(rs.getString("id"));
				return s;
			}
		});
	}

	@Override
	public List<Sales> getinvId1(String table, int no, String limit) {
		String sql = getQuery("getinvId1");
		return template.query(sql, new Object[] { no, Integer.parseInt(limit) }, new RowMapper<Sales>() {
			public Sales mapRow(ResultSet rs, int row) throws SQLException {
				Sales s = new Sales();
				s.setInvoice(rs.getString("invoiceid"));
				s.setAutoid(rs.getInt("autoid"));
				return s;
			}
		});
	}

	@Override
	public List<Sales> getinvId1d(String table, int no, String limit) {
		String sql = getQuery("getinvId1d");
		return template.query(sql, new Object[] { no, Integer.parseInt(limit) }, new RowMapper<Sales>() {
			public Sales mapRow(ResultSet rs, int row) throws SQLException {
				Sales s = new Sales();
				s.setInvoice(rs.getString("invoiceid"));
				s.setAutoid(rs.getInt("autoid"));
				return s;
			}
		});
	}

	@Override
	public List<Sales> getinvId1Filter(String table, int no, String srch, String limit) {
		String sql = getQuery("getinvId1Filter");
		return template.query(sql, new Object[] { no, Utils.getLikeParamValue(srch, false), Integer.parseInt(limit) },
				new RowMapper<Sales>() {
					public Sales mapRow(ResultSet rs, int row) throws SQLException {
						Sales s = new Sales();
						s.setInvoice(rs.getString("invoiceid"));
						s.setAutoid(rs.getInt("autoid"));
						return s;
					}
				});
	}

	@Override
	public List<Sales> getinvId1Filterd(String table, int no, String srch, String limit) {
		String sql = getQuery("getinvId1Filterd");
		return template.query(sql, new Object[] { no, Utils.getLikeParamValue(srch, false), Integer.parseInt(limit) },
				new RowMapper<Sales>() {
					public Sales mapRow(ResultSet rs, int row) throws SQLException {
						Sales s = new Sales();
						s.setInvoice(rs.getString("invoiceid"));
						s.setAutoid(rs.getInt("autoid"));
						return s;
					}
				});
	}

	// list products in sale screen
	@Override
	public List<Purchase> getProducts(String table, int no) {
		String sql = getQuery("getProducts");
		return template.query(sql, new Object[] { no }, new RowMapper<Purchase>() {
			public Purchase mapRow(ResultSet rs, int row) throws SQLException {
				// ean,productName,Batch,expDate,unit,unitprice,quantity,total,id
				Purchase p = new Purchase();
				p.setEan(rs.getString("ean"));
				p.setProductName(rs.getString("productname"));
				p.setBatch(rs.getString("batch"));
				p.setExpDate(rs.getString("expDate"));
				p.setUnit(rs.getString("unit"));
				p.setUnitPrice(rs.getString("unitprice"));
				p.setQuantity(rs.getString("total"));
				p.setPid(rs.getInt("id"));

				return p;
			}
		});
	}

	// list products in sale screen
	@Override
	public List<Purchase> getProductsd(String table, int no) {
		String sql = getQuery("getProductsd");
		return template.query(sql, new Object[] { no }, new RowMapper<Purchase>() {
			public Purchase mapRow(ResultSet rs, int row) throws SQLException {
				Purchase p = new Purchase();
				p.setEan(rs.getString("ean"));
				p.setProductName(rs.getString("productname"));
				p.setBatch(rs.getString("batch"));
				p.setExpDate(rs.getString("expDate"));
				p.setUnit(rs.getString("unit"));
				p.setUnitPrice(rs.getString("unitprice"));
				p.setQuantity(rs.getString("total"));
				p.setPid(rs.getInt("id"));

				return p;
			}
		});
	}
	// sales save

	// productstock
	// dproductstock
	@Override
	public int savess(Sale s, String name, String batch, String expdate, String unit, String up, String qty1,
			String stk1, String price1, String mpack, String mdesc, String sudesc, String ean, String table, int no,
			int pid) {

		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("savess");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, s.getInvoice());
					ps.setString(2, s.getInvoiceDate());
					ps.setString(3, s.getAuthor());
					ps.setString(4, s.getCdiscount());
					ps.setString(5, s.getCustId());
					ps.setString(6, s.getCustName());
					ps.setString(7, s.getCustPhone());
					ps.setString(8, s.getGender());
					ps.setString(9, s.getAge());
					ps.setString(10, ean);
					ps.setString(11, name);
					ps.setString(12, batch);
					ps.setString(13, expdate);
					ps.setString(14, stk1);
					ps.setString(15, unit);
					ps.setString(16, qty1);
					ps.setString(17, up);
					ps.setString(18, price1);
					ps.setString(19, s.getTitems());
					ps.setString(20, s.getSubt());
					ps.setString(21, s.getDiscount());
					ps.setString(22, s.getTax());
					ps.setString(23, s.getGtotal());
					ps.setString(24, mpack);
					ps.setString(25, mdesc);
					ps.setString(26, sudesc);
					ps.setString(27, s.getFileno());
					ps.setInt(28, no);
					ps.setInt(29, pid);
					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {

		}
		return keyHolder.getKey().intValue();
	}

	@Override
	public int savessd(Sale s, String name, String batch, String expdate, String unit, String up, String qty1,
			String stk1, String price1, String mpack, String mdesc, String sudesc, String ean, String table, int no,
			int pid) {

		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("savessd");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, s.getInvoice());
					ps.setString(2, s.getInvoiceDate());
					ps.setString(3, s.getAuthor());
					ps.setString(4, s.getCdiscount());
					ps.setString(5, s.getCustId());
					ps.setString(6, s.getCustName());
					ps.setString(7, s.getCustPhone());
					ps.setString(8, s.getGender());
					ps.setString(9, s.getAge());
					ps.setString(10, ean);
					ps.setString(11, name);
					ps.setString(12, batch);
					ps.setString(13, expdate);
					ps.setString(14, stk1);
					ps.setString(15, unit);
					ps.setString(16, qty1);
					ps.setString(17, up);
					ps.setString(18, price1);
					ps.setString(19, s.getTitems());
					ps.setString(20, s.getSubt());
					ps.setString(21, s.getDiscount());
					ps.setString(22, s.getTax());
					ps.setString(23, s.getGtotal());
					ps.setString(24, mpack);
					ps.setString(25, mdesc);
					ps.setString(26, sudesc);
					ps.setString(27, s.getFileno());
					ps.setInt(28, no);
					ps.setInt(29, pid);
					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}

		return keyHolder.getKey().intValue();

	}

	// TAX display in sale screen

	@Override
	public List<TaxB> getTax() {
		String sql = getQuery("getTax");
		String active = "on";
		// , , ,
		return template.query(sql, new Object[] {}, new RowMapper<TaxB>() {
			public TaxB mapRow(ResultSet rs, int row) throws SQLException {
				TaxB t = new TaxB();
				t.setTaxName(rs.getString("taxName"));
				t.setPercentage(rs.getString("percentage"));
				t.setDesc(rs.getString("description"));
				t.setActive((rs.getString("active")));

				return t;
			}
		});
	}

	// special discounts
	@Override
	public List<Spdiscount> getSpdis() {
		String sql = getQuery("getSpdissp");
		String active = "on";
		return template.query(sql, new Object[] {}, new RowMapper<Spdiscount>() {
			public Spdiscount mapRow(ResultSet rs, int row) throws SQLException {
				Spdiscount p = new Spdiscount();
				// , , , , ,
				p.setSpType(rs.getString("discode"));
				p.setSpDtype(rs.getString("distype"));
				p.setSpStdate(rs.getString("startdate"));
				p.setSpendate(rs.getString("enddate"));
				p.setSpact(rs.getString("active"));
				p.setSpDvalue(rs.getString("value"));

				return p;
			}
		});
	}

	// display customer discounts
	@Override
	public List<custDisc> getCustDis() {
		String sql = getQuery("getCustDis");
		return template.query(sql, new RowMapper<custDisc>() {
			public custDisc mapRow(ResultSet rs, int row) throws SQLException {
				custDisc d = new custDisc();
				d.setCustType(rs.getString("type"));
				d.setDiscType(rs.getString("dtype"));
				d.setDiscValue(rs.getString("value"));

				return d;
			}
		});
	}

	// to list branch orderid which have been ordered.
	@Override
	public List<Distribute> getBranchProducts() {
		String sql = getQuery("getBranchProducts");
		return template.query(sql, new RowMapper<Distribute>() {
			public Distribute mapRow(ResultSet rs, int row) throws SQLException {
				Distribute d = new Distribute();
				d.setBranchid(rs.getString("branchid"));
				return d;
			}
		});
	}

	@Override
	public int saved(Distribute d) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("saved");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, d.getBranchid());
					ps.setString(2, d.getAllocationid());
					ps.setString(3, d.getAllocationDate());
					ps.setString(4, d.getProductName());
					ps.setString(5, d.getBatch());
					ps.setString(6, d.getExpdate());
					ps.setString(7, d.getUnit());
					ps.setString(8, d.getUnitprice());
					ps.setString(9, d.getAllocationqty());
					ps.setString(10, d.getReqqty());
					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}

		return keyHolder.getKey().intValue();
	}

	@Override
	public List<Distribute> getAllocation() {
		String sql = getQuery("getAllocation");
		return template.query(sql, new RowMapper<Distribute>() {
			public Distribute mapRow(ResultSet rs, int row) throws SQLException {
				Distribute d = new Distribute();
				d.setAllocationid(rs.getString("allocation"));
				return d;
			}
		});
	}

	@Override
	public List<Distribute> getBrdetails(Distribute d) {
		String sql = getQuery("getBrdetails");
		return template.query(sql, new Object[] { d.getBranchid() }, new RowMapper<Distribute>() {
			public Distribute mapRow(ResultSet rs, int row) throws SQLException {
				// ,,,
				Distribute d = new Distribute();
				d.setBranchid(rs.getString("branchid"));
				d.setProductName(rs.getString("productName"));
				d.setUnit(rs.getString("unit"));
				d.setReqqty(rs.getString("reqqty"));
				return d;
			}
		});
	}

	@Override
	public int savequotation(quotation s, String name, String unit, String up, String qty1, String stk1,
			String price1) {
		String active = "on";
		String free = "NA";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("savequotation");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, s.getQuotation());
					ps.setString(2, s.getQuotationDate());
					ps.setString(3, s.getAuthor());
					ps.setString(4, s.getCdiscount());
					ps.setString(5, s.getCustId());
					ps.setString(6, s.getCustName());
					ps.setString(7, s.getCustPhone());
					ps.setString(8, s.getGender());
					ps.setString(9, s.getAge());
					ps.setString(10, s.getEan());
					ps.setString(11, name);
					ps.setString(12, s.getUnit());
					ps.setString(13, up);
					ps.setString(14, qty1);
					ps.setString(15, s.getFree());
					ps.setString(16, stk1);
					ps.setString(17, price1);
					ps.setString(18, s.getTitems());
					ps.setString(19, s.getSubt());
					ps.setString(20, s.getDiscount());
					ps.setString(21, s.getTax());
					ps.setString(22, s.getGtotal());
					ps.setString(23, active);
					ps.setString(24, s.getQuotationDate());
					ps.setString(25, s.getAuthor());
					ps.setString(26, s.getCdiscount());
					ps.setString(27, s.getCustId());
					ps.setString(28, s.getCustName());
					ps.setString(29, s.getCustPhone());
					ps.setString(30, s.getGender());
					ps.setString(31, s.getAge());
					ps.setString(32, s.getEan());
					ps.setString(33, name);
					ps.setString(34, up);
					ps.setString(35, qty1);
					ps.setString(36, free);
					ps.setString(37, stk1);
					ps.setString(38, price1);
					ps.setString(39, s.getTitems());
					ps.setString(40, s.getSubt());
					ps.setString(41, s.getDiscount());
					ps.setString(42, s.getTax());
					ps.setString(43, s.getGtotal());
					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}

		return keyHolder.getKey().intValue();

	}

//get quotationid,customer on page load ;
	@Override
	public List<ERPHO.model.quotation> getquotation() {
		String sql = getQuery("getquotation");
		return template.query(sql, new RowMapper<quotation>() {
			public quotation mapRow(ResultSet rs, int row) throws SQLException {
				quotation q = new quotation();
				q.setCustId(rs.getString("custId"));
				q.setQuotation(rs.getString("quotation"));
				return q;
			}
		});

	}

	// get corresponding quotations for each customer
	@Override
	public List<ERPHO.model.quotation> proformacust(quotation q) {
		String sql = getQuery("proformacust");
		return template.query(sql, new Object[] { q.getCustId() }, new RowMapper<quotation>() {
			public quotation mapRow(ResultSet rs, int row) throws SQLException {
				quotation q = new quotation();
				// ,
				q.setCustId(rs.getString("custId"));
				q.setQuotation(rs.getString("quotation"));
				return q;
			}
		});

	}

	// get quotationid based on date
	@Override
	public List<ERPHO.model.quotation> getquotationid() {
		String sql = getQuery("maxquotation");
		return template.query(sql, new RowMapper<quotation>() {
			public quotation mapRow(ResultSet rs, int row) throws SQLException {
				quotation q = new quotation();

				q.setQuotation(rs.getString("maxquotation"));

				return q;
			}
		});
	}

	@Override
	public List<ERPHO.model.quotation> updproforma(quotation q) {
		String sql = getQuery("updproforma");
		return template.query(sql, new Object[] { q.getQuotation() }, new RowMapper<quotation>() {
			// ,,,,
			public quotation mapRow(ResultSet rs, int row) throws SQLException {
				quotation q = new quotation();
				q.setQuotation(rs.getString("quotation"));
				q.setQuotationDate(rs.getString("quotationdate"));
				q.setAuthor(rs.getString("author"));
				q.setCdiscount(rs.getString("cdiscount"));
				q.setCustId(rs.getString("custId"));
				q.setCustName(rs.getString("custName"));
				q.setCustPhone(rs.getString("custPhone"));
				q.setGender(rs.getString("gender"));
				q.setAge(rs.getString("age"));
				q.setEan(rs.getString("ean"));
				q.setPname(rs.getString("pname"));
				q.setUnit(rs.getString("unit"));
				q.setUnitprice(rs.getString("unitprice"));
				q.setQuantity(rs.getString("quantity"));
				q.setFree(rs.getString("free"));
				q.setStock(rs.getString("stock"));
				q.setTotal(rs.getString("total"));
				q.setTitems(rs.getString("titems"));
				q.setSubt(rs.getString("subt"));
				q.setDiscount(rs.getString("discount"));
				q.setTax(rs.getString("tax"));
				q.setGtotal(rs.getString("gtotal"));
				return q;
			}
		});

	}

	// get history
	@Override
	public List<ERPHO.model.quotation> updhistory() {
		String sql = getQuery("updhistory");
		return template.query(sql, new RowMapper<quotation>() {
			public quotation mapRow(ResultSet rs, int row) throws SQLException {
				quotation q = new quotation();
				q.setQuotation(rs.getString("quotation"));
				q.setQuotationDate(rs.getString("quotationdate"));

				q.setCustName(rs.getString("custName"));

				q.setSubt(rs.getString("subt"));
				q.setDiscount(rs.getString("discount"));
				q.setTax(rs.getString("tax"));

				q.setGtotal(rs.getString("gtotal"));
				q.setStatus(rs.getString("status"));
				return q;
			}
		});

	}

// update status as mark complete or cancelled
	@Override
	public int updatestat(quotation s) {
		String sql = getQuery("updatestat");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, s.getStatus(), s.getQuotation());
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;

	}

	// get orderid and supplier

	@Override
	public List<Supply> getAllSuppliers() {
		String sql = getQuery("fetchSuppliers");
		String active = "on";
		return template.query(sql, new Object[] { active }, new RowMapper<Supply>() {
			public Supply mapRow(ResultSet rs, int row) throws SQLException {
				Supply supply = new Supply();
				supply.setSid(rs.getInt("sid"));
				supply.setName(rs.getString("name"));
				return supply;
			}
		});
	}

	@Override
	public List<Order> getOrdersupplier(Order o) {
		String sql = getQuery("getOrdersupplier");
		return template.query(sql, new RowMapper<Order>() {
			public Order mapRow(ResultSet rs, int row) throws SQLException {
				Order o = new Order();
				o.setOrderid(rs.getString("id"));
				return o;
			}
		});
	}

	// TODO Review d
	@Override
	public List<Purchase> getAllocationid(Purchase p, String table, int no) {
		String sql = getQuery("getAllocationid");
		return template.query(sql, new Object[] { p.getAllocationid(), no }, new RowMapper<Purchase>() {
			public Purchase mapRow(ResultSet rs, int row) throws SQLException {
				Purchase o = new Purchase();
				o.setAllocationid(rs.getString("id"));
				return o;
			}
		});
	}

	@Override
	public List<Purchases> getAllocationid1a(String table, int no, String limit) {
		String sql = getQuery("getAllocationid1a");
		return template.query(sql, new Object[] { no, Integer.parseInt(limit) }, new RowMapper<Purchases>() {
			public Purchases mapRow(ResultSet rs, int row) throws SQLException {
				Purchases o = new Purchases();
				o.setAutoid(rs.getInt("autoid"));
				o.setAllocationid(rs.getString("allocationid"));
				return o;
			}
		});
	}

	@Override
	public List<Purchase> getAllocationid1ad(String table, int no, String limit) {
		String sql = getQuery("getAllocationid1ad");
		return template.query(sql, new Object[] { no, limit }, new RowMapper<Purchase>() {
			public Purchase mapRow(ResultSet rs, int row) throws SQLException {
				Purchase o = new Purchase();
				o.setAllocationid(rs.getString("id"));
				return o;
			}
		});
	}

	@Override
	public List<Purchase> getAllocationid1aFilter(String table, int no, String srch3, String limit) {
		String sql = getQuery("getAllocationid1aFilter");
		return template.query(sql, new Object[] { no, Utils.getLikeParamValue(srch3, false), Integer.parseInt(limit) },
				new RowMapper<Purchase>() {
					public Purchase mapRow(ResultSet rs, int row) throws SQLException {
						Purchase o = new Purchase();
						o.setAllocationid(rs.getString("id"));
						return o;
					}
				});
	}

	@Override
	public List<Purchase> getsupplyorder(String s, String limit) {
		String sql = getQuery("getsupplyorder");
		String active = "active";
		return template.query(sql, new Object[] { Utils.getLikeParamValue(s, false), active, Integer.parseInt(limit) },
				new RowMapper<Purchase>() {
					public Purchase mapRow(ResultSet rs, int row) throws SQLException {
						Purchase o = new Purchase();

						o.setProductName(rs.getString("name"));
						o.setEan(rs.getString("prc"));
						o.setPid(rs.getInt("pid"));

						return o;
					}
				});
	}

	@Override
	public List<Purchase> getsupplyorderFilter(String s, String srch, String srch2, String limit) {
		String sql = getQuery("getsupplyorderFilter");
		String active = "active";
		System.out.println("s = "+Utils.getLikeParamValue(s, false));
		System.out.println();
		return template.query(sql,
				new Object[] { Utils.getLikeParamValue(s, false), Utils.getLikeParamValue(srch, false),
						Utils.getLikeParamValue(srch2, false), active, Integer.parseInt(limit) },
				new RowMapper<Purchase>() {
					public Purchase mapRow(ResultSet rs, int row) throws SQLException {
						Purchase o = new Purchase();

						o.setProductName(rs.getString("name"));
						o.setEan(rs.getString("prc"));
						o.setPid(rs.getInt("pid"));

						return o;
					}
				});
	}

	@Override
	public int savepurchase(Purchase p, String name, String batch, String expdate, String quantity, String unitprice,
			String discount, String free, String total, String ean1, String mpack, String mdesc, String sudesc, int no,
			int pid) {

		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("savepurchase");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, p.getAllocationid());
					ps.setString(2, p.getReceiveddate());
					ps.setString(3, p.getUpdatepricing());
					ps.setString(4, p.getSupplier());
					ps.setString(5, p.getOrderDate());
					ps.setString(6, name);
					ps.setString(7, batch);
					ps.setString(8, expdate);
					ps.setString(9, mpack);
					ps.setString(10, mdesc);
					ps.setString(11, sudesc);
					ps.setString(12, quantity);
					ps.setString(13, discount);
					ps.setString(14, unitprice);
					ps.setString(15, free);
					ps.setString(16, total);
					ps.setString(17, p.getGrandTotal());
					ps.setString(18, ean1);
					ps.setInt(19, no);
					ps.setInt(20, pid);
					ps.setString(21, expdate);
					ps.setString(22, mpack);
					ps.setString(23, mdesc);
					ps.setString(24, sudesc);
					ps.setString(25, quantity);
					ps.setString(26, discount);
					ps.setString(27, unitprice);
					ps.setString(28, free);
					ps.setString(29, total);
					ps.setString(30, p.getGrandTotal());
					ps.setInt(31, no);
					ps.setInt(32, pid);

					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}

		return keyHolder.getKey().intValue();
	}

	@Override
	public int updateean(String name) {
		String sql = getQuery("updateean");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, name, name);
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;
	}

	@Override
	public int saveproductpriceho(Purchase p, String name, String batch, String unitprice, String sp) {

		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {
				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("saveproductpriceho");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, name);
					ps.setString(2, batch);
					ps.setString(3, unitprice);
					ps.setString(4, sp);
					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}

		return keyHolder.getKey().intValue();
	}

	@Override
	public int updatecatho(String name, int no, int pid) {
		String sql = getQuery("updatesavep");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, name, name, no, pid);
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;

		// TODO Auto-generated method stub

	}
	// save product stocks

	@Override
	public int saveproductstockho(String ean1, String name, String batch, String expdate, String mpack, String mpsize,
			String cp, String prqty, String prprice, String qty, String sudesc, String stkpr, String markup, String sp,
			String spdesc, String spsize, String stksp, String sellqty, String sunits, String tprice, int no, int pid) {
		System.out.println(qty);

		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, ean1);
					ps.setString(2, name);
					ps.setString(3, batch);
					ps.setString(4, expdate);
					ps.setString(5, mpack);
					ps.setString(6, mpsize);
					ps.setString(7, cp);
					ps.setString(8, prqty);
					ps.setString(9, prprice);
					ps.setString(10, qty);
					ps.setString(11, sudesc);
					ps.setString(12, stkpr);
					ps.setString(13, markup);
					ps.setString(14, sp);
					ps.setString(15, spdesc);
					ps.setString(16, spsize);
					ps.setString(17, stksp);
					ps.setString(18, sellqty);
					ps.setString(19, sunits);
					ps.setString(20, tprice);
					ps.setInt(21, no);
					ps.setInt(22, pid);
					ps.setString(23, expdate);
					ps.setString(24, mpsize);
					ps.setString(25, cp);
					ps.setString(26, prqty);
					ps.setString(27, prprice);
					ps.setString(28, qty);
					ps.setString(29, sudesc);
					ps.setString(30, stkpr);
					ps.setString(31, markup);
					ps.setString(32, sp);
					ps.setString(33, spdesc);
					ps.setString(34, spsize);
					ps.setString(35, stksp);
					ps.setString(36, sellqty);
					ps.setString(37, sunits);
					ps.setString(38, tprice);
					ps.setInt(39, no);
					ps.setInt(40, pid);

					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}

		return keyHolder.getKey().intValue();

	}

	@Override
	public int saveproductstockho1(String ean1, String name, String batch, String expdate, String mpack, String mpsize,
			String cp, String prqty, String prprice, String qty, String sudesc, String stkpr, String markup, String sp,
			String spdesc, String spsize, String stksp, String sellqty, String sunits, String tprice, String table,
			int no, int pid) {

		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("saveproductstockho1");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, ean1);
					ps.setString(2, name);
					ps.setString(3, batch);
					ps.setString(4, expdate);
					ps.setString(5, mpack);
					ps.setString(6, mpsize);
					ps.setString(7, cp);
					ps.setString(8, prqty);
					ps.setString(9, prprice);
					ps.setString(10, qty);
					ps.setString(11, sudesc);
					ps.setString(12, stkpr);
					ps.setString(13, markup);
					ps.setString(14, sp);
					ps.setString(15, spdesc);
					ps.setString(16, spsize);
					ps.setString(17, stksp);
					ps.setString(18, sellqty);
					ps.setString(19, sunits);
					ps.setString(20, tprice);
					ps.setInt(21, no);
					ps.setInt(22, pid);
					ps.setString(23, expdate);
					ps.setString(24, mpsize);
					ps.setString(25, cp);
					ps.setString(26, prqty);
					ps.setString(27, prprice);
					ps.setString(28, qty);
					ps.setString(29, sudesc);
					ps.setString(230, stkpr);
					ps.setString(31, markup);
					ps.setString(32, sp);
					ps.setString(33, spdesc);
					ps.setString(34, spsize);
					ps.setString(35, stksp);
					ps.setString(36, sellqty);
					ps.setString(37, sunits);
					ps.setString(38, tprice);
					ps.setInt(39, no);
					ps.setInt(40, pid);
					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}
		return keyHolder.getKey().intValue();
	}

	@Override
	public int saveproductstockho1d(String ean1, String name, String batch, String expdate, String mpack, String mpsize,
			String cp, String prqty, String prprice, String qty, String sudesc, String stkpr, String markup, String sp,
			String spdesc, String spsize, String stksp, String sellqty, String sunits, String tprice, String table,
			int no, int pid) {

		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("saveproductstockho1d");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, ean1);
					ps.setString(2, name);
					ps.setString(3, batch);
					ps.setString(4, expdate);
					ps.setString(5, mpack);
					ps.setString(6, mpsize);
					ps.setString(7, cp);
					ps.setString(8, prqty);
					ps.setString(9, prprice);
					ps.setString(10, qty);
					ps.setString(11, sudesc);
					ps.setString(12, stkpr);
					ps.setString(13, markup);
					ps.setString(14, sp);
					ps.setString(15, spdesc);
					ps.setString(16, spsize);
					ps.setString(17, stksp);
					ps.setString(18, sellqty);
					ps.setString(19, sunits);
					ps.setString(20, tprice);
					ps.setInt(21, no);
					ps.setInt(22, pid);
					ps.setString(23, expdate);
					ps.setString(24, mpsize);
					ps.setString(25, cp);
					ps.setString(26, prqty);
					ps.setString(27, prprice);
					ps.setString(28, qty);
					ps.setString(29, sudesc);
					ps.setString(230, stkpr);
					ps.setString(31, markup);
					ps.setString(32, sp);
					ps.setString(33, spdesc);
					ps.setString(34, spsize);
					ps.setString(35, stksp);
					ps.setString(36, sellqty);
					ps.setString(37, sunits);
					ps.setString(38, tprice);
					ps.setInt(39, no);
					ps.setInt(40, pid);
					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}
		return keyHolder.getKey().intValue();
	}

	@Override
	public int updatecatho2(String name, int no, int pid) {
		String sql = getQuery("updatecatho2");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, name, name, no, pid);
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;

	}

	@Override
	public int updatecatho1(String name) {
		String sql = getQuery("updatecatho1");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, name, name);
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;
		// TODO Auto-generated method stub

	}

	// TODO review table d
	@Override
	public int saveproductstockho2(String ean1, String name, String batch, String expdate, String mpack, String mpsize,
			String cp, String prqty, String prprice, String qty, String sudesc, String stkpr, String markup, String sp,
			String spdesc, String spsize, String stksp, String sellqty, String sunits, String tprice, String table,
			int no, int pid) {

		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("saveproductstockho2");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, ean1);
					ps.setString(2, ean1);
					ps.setString(3, batch);
					ps.setString(4, expdate);
					ps.setString(5, mpack);
					ps.setString(6, mpsize);
					ps.setString(7, cp);
					ps.setString(8, prqty);
					ps.setString(9, prprice);
					ps.setString(10, qty);
					ps.setString(11, sudesc);
					ps.setString(12, stkpr);
					ps.setString(13, markup);
					ps.setString(14, sp);
					ps.setString(15, spdesc);
					ps.setString(16, spsize);
					ps.setString(17, stksp);
					ps.setString(18, sellqty);
					ps.setString(19, sunits);
					ps.setString(20, tprice);
					ps.setInt(21, no);
					ps.setInt(22, pid);
					ps.setString(23, expdate);
					ps.setString(24, mpsize);
					ps.setString(25, cp);
					ps.setString(26, prqty);
					ps.setString(27, prprice);
					ps.setString(28, qty);
					ps.setString(29, sudesc);
					ps.setString(30, stkpr);
					ps.setString(31, markup);
					ps.setString(32, sp);
					ps.setString(33, spdesc);
					ps.setString(34, spsize);
					ps.setString(35, stksp);
					ps.setString(36, sellqty);
					ps.setString(37, sunits);
					ps.setString(38, tprice);
					ps.setInt(39, no);

					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}

		return keyHolder.getKey().intValue();
	}

	// 898 to 950 product stocks for dispensary
	@Override
	public int dsavepurchase(Purchase p, String name, String batch, String expdate, String quantity, String unitprice,
			String discount, String free, String total, String ean1, String mpack, String mdesc, String sudesc,
			int no) {

		// discount is total purschase price

		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("dsavepurchase");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

					ps.setString(1, p.getAllocationid());
					ps.setString(2, p.getReceiveddate());
					ps.setString(3, p.getUpdatepricing());
					ps.setString(4, p.getSupplier());
					ps.setString(5, p.getOrderDate());
					ps.setString(6, name);
					ps.setString(7, batch);
					ps.setString(8, expdate);
					ps.setString(9, mpack);
					ps.setString(10, mdesc);
					ps.setString(11, sudesc);
					ps.setString(12, quantity);
					ps.setString(13, discount);
					ps.setString(14, unitprice);
					ps.setString(15, free);
					ps.setString(16, total);
					ps.setString(17, p.getGrandTotal());
					ps.setString(18, ean1);
					ps.setInt(19, no);
					ps.setString(20, expdate);
					ps.setString(21, mpack);
					ps.setString(22, mdesc);
					ps.setString(23, sudesc);
					ps.setString(24, quantity);
					ps.setString(25, discount);
					ps.setString(26, unitprice);
					ps.setString(27, free);
					ps.setString(28, total);
					ps.setString(29, p.getGrandTotal());
					ps.setString(30, ean1);
					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}

		return keyHolder.getKey().intValue();
	}

	@Override
	public int dupdateean(String name) {
		String sql = getQuery("dupdateean");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, name, name);
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;
	}

	@Override
	public int dupdatecatho(String name, int no) {

		String sql = getQuery("dupdatecatho");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, name, no, name);
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;
		// TODO Auto-generated method stub

	}
	// save product stocks

	@Override
	public int dsaveproductstockho(String ean1, String name, String batch, String expdate, String mpack, String mpsize,
			String cp, String prqty, String prprice, String qty, String sudesc, String stkpr, String markup, String sp,
			String spdesc, String spsize, String stksp, String sellqty, String sunits, String tprice, int no) {

		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("dsaveproductstockho");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, ean1);
					ps.setString(2, name);
					ps.setString(3, batch);
					ps.setString(4, expdate);
					ps.setString(5, mpack);
					ps.setString(6, mpsize);
					ps.setString(7, cp);
					ps.setString(8, prqty);
					ps.setString(9, prprice);
					ps.setString(10, qty);
					ps.setString(11, sudesc);
					ps.setString(12, stkpr);
					ps.setString(13, markup);
					ps.setString(14, sp);
					ps.setString(15, spdesc);
					ps.setString(16, spsize);
					ps.setString(17, stksp);
					ps.setString(18, sellqty);
					ps.setString(19, sunits);
					ps.setString(20, tprice);
					ps.setInt(21, no);
					ps.setString(22, expdate);
					ps.setString(23, mpsize);
					ps.setString(24, cp);
					ps.setString(25, prqty);
					ps.setString(26, prprice);
					ps.setString(27, qty);
					ps.setString(28, sudesc);
					ps.setString(29, stkpr);
					ps.setString(30, markup);
					ps.setString(31, sp);
					ps.setString(32, spdesc);
					ps.setString(33, spsize);
					ps.setString(34, stksp);
					ps.setString(35, sellqty);
					ps.setString(36, sunits);
					ps.setString(37, tprice);
					ps.setInt(38, no);

					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}

		return keyHolder.getKey().intValue();
	}

	@Override
	public int dupdatecatho2(String name, int no) {
		String sql = getQuery("dupdatecatho2");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, name, no, name);
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;
	}

	@Override
	public int dupdatecatho1(String name) {

		String sql = getQuery("dupdatecatho1");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, name, name);
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;

	}

	// product price load

	@Override
	public List<Productprice> getInfoSearch() {
		String sql = getQuery("getInfoSearchs");
		return template.query(sql, new RowMapper<Productprice>() {
			public Productprice mapRow(ResultSet rs, int row) throws SQLException {
				Productprice p = new Productprice();
				p.setCode(rs.getString("code"));
				p.setName(rs.getString("name"));
				p.setBatch(rs.getString("batch"));
				p.setCp(rs.getString("cp"));
				p.setCategory(rs.getString("pc"));
				p.setRmp(rs.getString("rmp"));
				p.setWmp(rs.getString("wmp"));
				p.setRbsp(rs.getString("rbsp"));
				p.setWbsp(rs.getString("wbsp"));
				p.setSp(rs.getString("sp"));
				return p;
			}
		});
	}

	@Override
	public List<Product> getInfoSearch1(String limit) {
		String sql = getQuery("getInfoSearch1");
		return template.query(sql, new Object[] { Integer.parseInt(limit) }, new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product p = new Product();
				p.setPc(rs.getString("pc"));

				return p;
			}
		});
	}

	@Override
	public List<Product> getInfoSearch1Filter(String srch, String limit) {
		String sql = getQuery("getInfoSearch1Filter");
		return template.query(sql, new Object[] { Utils.getLikeParamValue(srch, false), Integer.parseInt(limit) },
				new RowMapper<Product>() {
					public Product mapRow(ResultSet rs, int row) throws SQLException {
						Product p = new Product();
						p.setPc(rs.getString("pc"));

						return p;
					}
				});
	}

	@Override
	public List<Productprice> getproSearch(Productprice ps) {
		String sql = "";
		if (ps.getCategory().equalsIgnoreCase("All")) {
			sql = getQuery("getproSearch1");
			if (ps.getCode() != null && ps.getCode() != "") {
				final String var = ps.getName();
				final String var1 = ps.getCategory();
				final int var2 = ps.getRecords();
				final String var3 = ps.getCode();
				return template.query(sql,
						new Object[] { Utils.getLikeParamValue(ps.getCode(), false), ps.getRecords() },
						new RowMapper<Productprice>() {
							public Productprice mapRow(ResultSet rs, int row) throws SQLException {
								Productprice p = new Productprice();
								p.setCode(rs.getString("code"));
								p.setName(rs.getString("name"));
								p.setBatch(rs.getString("batch"));
								p.setCp(rs.getString("cp"));
								p.setCategory(rs.getString("category"));
								p.setRmp(rs.getString("rmp"));
								p.setWmp(rs.getString("wmp"));
								p.setRbsp(rs.getString("rbsp"));
								p.setWbsp(rs.getString("wbsp"));
								p.setSp(rs.getString("sp"));
								p.setName1(var);
								p.setCategory1(var1);
								p.setRecords(var2);
								p.setCode1(var3);
								return p;
							}
						});
			}

			else {
				sql = getQuery("getproSearch2");
				final String var = ps.getName();
				final String var1 = ps.getCategory();
				final int var2 = ps.getRecords();
				final String var3 = ps.getCode();

				return template.query(sql,
						new Object[] { Utils.getLikeParamValue(ps.getName(), false), ps.getRecords() },
						new RowMapper<Productprice>() {

							public Productprice mapRow(ResultSet rs, int row) throws SQLException {
								Productprice p = new Productprice();

								// ,,,cp,category,rmp,wmp,((cp*(rmp/100))+cp) as rbsp,((cp*(wmp/100))+cp) as
								// wbsp,sp
								p.setCode(rs.getString("code"));
								p.setName(rs.getString("name"));
								p.setBatch(rs.getString("batch"));
								p.setCp(rs.getString("cp"));
								p.setCategory(rs.getString("category"));
								p.setRmp(rs.getString("rmp"));
								p.setWmp(rs.getString("wmp"));
								p.setRbsp(rs.getString("rbsp"));
								p.setWbsp(rs.getString("wbsp"));
								p.setSp(rs.getString("sp"));
								p.setName1(var);
								p.setCategory1(var1);
								p.setRecords(var2);
								p.setCode1(var3);
								return p;
							}
						});
			}
		} else {
			sql = getQuery("getproSearch3");
			if (ps.getCode1() != null && ps.getCode1() != "") {

				// ,name,batch,cp,category,rmp,wmp,((cp*(rmp/100))+cp) as
				// rbsp,((cp*(wmp/100))+cp) as wbsp,sp from productprice where ean like
				// '%"+ps.getCode()+"%' and category ='"+ps.getCategory()+"' limit
				// "+ps.getRecords()+"
				final String var = ps.getName();
				final String var1 = ps.getCategory();
				final int var2 = ps.getRecords();
				final String var3 = ps.getCode();
				return template.query(sql, new RowMapper<Productprice>() {
					public Productprice mapRow(ResultSet rs, int row) throws SQLException {
						Productprice p = new Productprice();
						System.out.println("code4");
						p.setCode(rs.getString("code"));
						p.setName(rs.getString("name"));
						p.setBatch(rs.getString("batch"));
						p.setCp(rs.getString("cp"));
						p.setCategory(rs.getString("category"));
						p.setRmp(rs.getString("cp"));
						p.setWmp(rs.getString("wpm"));
						p.setRbsp(rs.getString("rbsp"));
						p.setWbsp(rs.getString("wbsp"));
						p.setSp(rs.getString("sp"));
						p.setName1(var);
						p.setCategory1(var1);
						p.setRecords(var2);
						p.setCode1(var3);
						return p;

					}

				});
			}

			else {
				sql = getQuery("getproSearch3");
				final String var = ps.getName();
				final String var1 = ps.getCategory();
				final int var2 = ps.getRecords();
				final String var3 = ps.getCode();
				return template.query(sql, new Object[] { Utils.getLikeParamValue(ps.getName(), false),
						ps.getCategory(), ps.getRecords() }, new RowMapper<Productprice>() {
							public Productprice mapRow(ResultSet rs, int row) throws SQLException {
								Productprice p = new Productprice();
								System.out.println("code4");
								p.setCode(rs.getString("code"));
								p.setName(rs.getString("name"));
								p.setBatch(rs.getString("batch"));
								p.setCp(rs.getString("cp"));
								p.setCategory(rs.getString("category"));
								p.setRmp(rs.getString("rmp"));
								p.setWmp(rs.getString("wmp"));
								p.setRbsp(rs.getString("rbsp"));
								p.setWbsp(rs.getString("wbsp"));
								p.setSp(rs.getString("sp"));
								p.setName1(var);
								p.setCategory1(var1);
								p.setRecords(var2);
								p.setCode1(var3);
								return p;
							}
						});
			}
		}
	}

	@Override
	public int saveprPr(Productprice ps) {
		String sql = getQuery("");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, ps.getRmp(), ps.getCp(), ps.getSp(), ps.getName(), ps.getBatch());
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;
	}

	// product stocks
	// TODO : refactor mercilessly
	@Override
	public List<Productstock> getstockSearch(Productstock ps, String table, int no) {
		if (ps.getCategory().equalsIgnoreCase("All")) {
			if (ps.getBatch() != null && ps.getBatch() != "") {
				System.out.println("code1" + ps.getExpDate());
				final String var3 = ps.getCode();
				final String var4 = ps.getName();
				final String var5 = ps.getCategory();
				final String var6 = ps.getExpDate();
				final String var7 = ps.getToDate();
				final int var8 = ps.getRecords();
				final String var9 = ps.getBatch();
				System.out.println(ps.getRecords());
				return template.query(
						"select pr.prc,pr.name,p.batch,p.expdate,pr.pc,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice,p.pid from "
								+ table + " p join product pr on pr.pid = p.pid where p.id = '" + no
								+ "' and p.batch like '%" + ps.getBatch() + "%' and p.expdate between '"
								+ ps.getExpDate() + "' and '" + ps.getToDate() + "'limit " + ps.getRecords() + "",
						new RowMapper<Productstock>() {
							public Productstock mapRow(ResultSet rs, int row) throws SQLException {
								Productstock p = new Productstock();
								System.out.println("Batch" + rs.getString(1));
								p.setCode(rs.getString(1));
								p.setName(rs.getString(2));
								p.setBatch(rs.getString(3));
								p.setExpDate(rs.getString(4));
								p.setCategory(rs.getString(5));
								p.setMpack(rs.getString(6));
								p.setMpsize(rs.getString(7));
								p.setCp(rs.getString(8));
								p.setPrqty(rs.getString(9));
								p.setPrprice(rs.getString(10));
								p.setQuantity(rs.getString(11));
								p.setSudesc(rs.getString(12));
								p.setStkpr(rs.getString(13));
								p.setMarkup(rs.getString(14));
								p.setSp(rs.getString(15));
								p.setSpdesc(rs.getString(16));
								p.setSpsize(rs.getString(17));
								p.setStksp(rs.getString(18));
								p.setSellqty(rs.getString(19));
								p.setSunits(rs.getString(20));
								p.setTprice(rs.getString(21));
								p.setPid(rs.getInt(22));
								return p;
							}
						});
			} else if (ps.getName() != null && ps.getName() != "") {

				final String var3 = ps.getCode();
				final String var4 = ps.getName();
				final String var5 = ps.getCategory();
				final String var6 = ps.getExpDate();
				final String var7 = ps.getToDate();
				final int var8 = ps.getRecords();
				final String var9 = ps.getBatch();

				return template.query(
						"select pr.prc,pr.name,p.batch,p.expdate,pr.pc,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice,p.pid from "
								+ table + " p join product pr on pr.pid = p.pid where p.id = '" + no
								+ "' and p.name like '%" + ps.getName() + "%'  and (p.expdate between '"
								+ ps.getExpDate() + "' and '" + ps.getToDate() + "' ) limit " + ps.getRecords() + " ",
						new RowMapper<Productstock>() {

							public Productstock mapRow(ResultSet rs, int row) throws SQLException {
								Productstock p = new Productstock();
								System.out.println("Name" + rs.getString(1));
								p.setCode(rs.getString(1));
								p.setName(rs.getString(2));
								p.setBatch(rs.getString(3));
								p.setExpDate(rs.getString(4));
								p.setCategory(rs.getString(5));
								p.setMpack(rs.getString(6));
								p.setMpsize(rs.getString(7));
								p.setCp(rs.getString(8));
								p.setPrqty(rs.getString(9));
								p.setPrprice(rs.getString(10));
								p.setQuantity(rs.getString(11));
								p.setSudesc(rs.getString(12));
								p.setStkpr(rs.getString(13));
								p.setMarkup(rs.getString(14));
								p.setSp(rs.getString(15));
								p.setSpdesc(rs.getString(16));
								p.setSpsize(rs.getString(17));
								p.setStksp(rs.getString(18));
								p.setSellqty(rs.getString(19));
								p.setSunits(rs.getString(20));
								p.setTprice(rs.getString(21));
								p.setPid(rs.getInt(22));
								return p;
							}
						});
			}

			else if (ps.getCode() != null && ps.getCode() != "") {

				return template.query(
						"select pr.prc,pr.name,p.batch,p.expdate,pr.pc,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice,p.pid from "
								+ table + " p join product pr on pr.pid = p.pid where p.id = '" + no
								+ "' and p.code like '%" + ps.getCode() + "%' and (p.expdate between '"
								+ ps.getExpDate() + "' and '" + ps.getToDate() + "' ) limit " + ps.getRecords() + "",
						new RowMapper<Productstock>() {
							public Productstock mapRow(ResultSet rs, int row) throws SQLException {
								Productstock p = new Productstock();

								p.setCode(rs.getString(1));
								p.setName(rs.getString(2));
								p.setBatch(rs.getString(3));
								p.setExpDate(rs.getString(4));
								p.setCategory(rs.getString(5));
								p.setMpack(rs.getString(6));
								p.setMpsize(rs.getString(7));
								p.setCp(rs.getString(8));
								p.setPrqty(rs.getString(9));
								p.setPrprice(rs.getString(10));
								p.setQuantity(rs.getString(11));
								p.setSudesc(rs.getString(12));
								p.setStkpr(rs.getString(13));
								p.setMarkup(rs.getString(14));
								p.setSp(rs.getString(15));
								p.setSpdesc(rs.getString(16));
								p.setSpsize(rs.getString(17));
								p.setStksp(rs.getString(18));
								p.setSellqty(rs.getString(19));
								p.setSunits(rs.getString(20));
								p.setTprice(rs.getString(21));
								p.setPid(rs.getInt(22));
								return p;
							}
						});
			} else {

				return template.query(
						"select pr.prc,pr.name,p.batch,p.expdate,pr.pc,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice,p.pid from "
								+ table + " p join product pr on pr.pid = p.pid where p.id = '" + no
								+ "' and (p.expdate between STR_TO_DATE('" + ps.getExpDate()
								+ "', '%Y-%m-%d') and STR_TO_DATE('" + ps.getToDate() + "', '%Y-%m-%d')) limit "
								+ ps.getRecords() + "",
						new RowMapper<Productstock>() {
							public Productstock mapRow(ResultSet rs, int row) throws SQLException {
								Productstock p = new Productstock();

								p.setCode(rs.getString(1));
								p.setName(rs.getString(2));
								p.setBatch(rs.getString(3));
								p.setExpDate(rs.getString(4));
								p.setCategory(rs.getString(5));
								p.setMpack(rs.getString(6));
								p.setMpsize(rs.getString(7));
								p.setCp(rs.getString(8));
								p.setPrqty(rs.getString(9));
								p.setPrprice(rs.getString(10));
								p.setQuantity(rs.getString(11));
								p.setSudesc(rs.getString(12));
								p.setStkpr(rs.getString(13));
								p.setMarkup(rs.getString(14));
								p.setSp(rs.getString(15));
								p.setSpdesc(rs.getString(16));
								p.setSpsize(rs.getString(17));
								p.setStksp(rs.getString(18));
								p.setSellqty(rs.getString(19));
								p.setSunits(rs.getString(20));
								p.setTprice(rs.getString(21));
								p.setPid(rs.getInt(22));
								System.out.println(rs.getString(4));

								return p;
							}
						});

			}
		}

		else {

			if (ps.getBatch() != null && ps.getBatch() != "") {

				final String var3 = ps.getCode();
				final String var4 = ps.getName();
				final String var5 = ps.getCategory();
				final String var6 = ps.getExpDate();
				final String var7 = ps.getToDate();
				final int var8 = ps.getRecords();
				final String var9 = ps.getBatch();

				return template.query(
						"select pr.prc,pr.name,p.batch,p.expdate,pr.pc,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice,p.pid from "
								+ table + " p join product pr on pr.pid = p.pid where p.id='" + no
								+ "' and p.batch like '%" + ps.getBatch() + "%' and p.category = '" + ps.getCategory()
								+ "' and (p.expdate between '" + ps.getExpDate() + "' and '" + ps.getToDate()
								+ "' ) limit " + ps.getRecords() + "",
						new RowMapper<Productstock>() {

							public Productstock mapRow(ResultSet rs, int row) throws SQLException {
								Productstock p = new Productstock();
								System.out.println(rs.getString(1));
								p.setCode(rs.getString(1));
								p.setName(rs.getString(2));
								p.setBatch(rs.getString(3));
								p.setExpDate(rs.getString(4));
								p.setCategory(rs.getString(5));
								p.setMpack(rs.getString(6));
								p.setMpsize(rs.getString(7));
								p.setCp(rs.getString(8));
								p.setPrqty(rs.getString(9));
								p.setPrprice(rs.getString(10));
								p.setQuantity(rs.getString(11));
								p.setSudesc(rs.getString(12));
								p.setStkpr(rs.getString(13));
								p.setMarkup(rs.getString(14));
								p.setSp(rs.getString(15));
								p.setSpdesc(rs.getString(16));
								p.setSpsize(rs.getString(17));
								p.setStksp(rs.getString(18));
								p.setSellqty(rs.getString(19));
								p.setSunits(rs.getString(20));
								p.setTprice(rs.getString(21));
								p.setPid(rs.getInt(22));
								return p;
							}
						});
			} else if (ps.getName() != null && ps.getName() != "") {

				final String var3 = ps.getCode();
				final String var4 = ps.getName();
				final String var5 = ps.getCategory();
				final String var6 = ps.getExpDate();
				final String var7 = ps.getToDate();
				final int var8 = ps.getRecords();
				final String var9 = ps.getBatch();

				return template.query(
						"select pr.prc,pr.name,p.batch,p.expdate,pr.pc,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice,p.pid from "
								+ table + " p join product pr on pr.pid = p.pid where p.id= '" + no
								+ "' and p.name like '%" + ps.getName() + "%' and p.category = '" + ps.getCategory()
								+ "' and (p.expdate between '" + ps.getExpDate() + "' and '" + ps.getToDate()
								+ "') limit " + ps.getRecords() + " ",
						new RowMapper<Productstock>() {
							public Productstock mapRow(ResultSet rs, int row) throws SQLException {
								Productstock p = new Productstock();
								System.out.println(rs.getString(1));
								p.setCode(rs.getString(1));
								p.setName(rs.getString(2));
								p.setBatch(rs.getString(3));
								p.setExpDate(rs.getString(4));
								p.setCategory(rs.getString(5));
								p.setMpack(rs.getString(6));
								p.setMpsize(rs.getString(7));
								p.setCp(rs.getString(8));
								p.setPrqty(rs.getString(9));
								p.setPrprice(rs.getString(10));
								p.setQuantity(rs.getString(11));
								p.setSudesc(rs.getString(12));
								p.setStkpr(rs.getString(13));
								p.setMarkup(rs.getString(14));
								p.setSp(rs.getString(15));
								p.setSpdesc(rs.getString(16));
								p.setSpsize(rs.getString(17));
								p.setStksp(rs.getString(18));
								p.setSellqty(rs.getString(19));
								p.setSunits(rs.getString(20));
								p.setTprice(rs.getString(21));
								p.setPid(rs.getInt(22));
								return p;
							}
						});
			}

			else if (ps.getCode() != null && ps.getCode() != "") {

				return template.query(
						"select pr.prc,pr.name,p.batch,p.expdate,pr.pc,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice,p.pid from "
								+ table + " p where p.id='" + no + "' and p.code like '%" + ps.getCode()
								+ "%' and p.category = '" + ps.getCategory() + "'and (p.expdate between '"
								+ ps.getExpDate() + "' and '" + ps.getToDate() + "') limit " + ps.getRecords() + "",
						new RowMapper<Productstock>() {

							public Productstock mapRow(ResultSet rs, int row) throws SQLException {
								Productstock p = new Productstock();
								System.out.println("insd code" + rs.getString(1));
								p.setCode(rs.getString(1));
								p.setName(rs.getString(2));
								p.setBatch(rs.getString(3));
								p.setExpDate(rs.getString(4));
								p.setCategory(rs.getString(5));
								p.setMpack(rs.getString(6));
								p.setMpsize(rs.getString(7));
								p.setCp(rs.getString(8));
								p.setPrqty(rs.getString(9));
								p.setPrprice(rs.getString(10));
								p.setQuantity(rs.getString(11));
								p.setSudesc(rs.getString(12));
								p.setStkpr(rs.getString(13));
								p.setMarkup(rs.getString(14));
								p.setSp(rs.getString(15));
								p.setSpdesc(rs.getString(16));
								p.setSpsize(rs.getString(17));
								p.setStksp(rs.getString(18));
								p.setSellqty(rs.getString(19));
								p.setSunits(rs.getString(20));
								p.setTprice(rs.getString(21));
								p.setPid(rs.getInt(22));
								return p;
							}
						});
			}

			else {

				return template.query(
						"select pr.prc,p.name,p.batch,p.expdate,pr.pc,p.mpack,p.mpsize,p.cp,p.prqty,p.prprice,p.currentstock,p.sudesc,p.stkpr,p.markup,p.sp,p.spdesc,p.spsize,p.stksp,p.sellqty,p.sunits,p.tprice,p.pid from "
								+ table + " p join product pr on pr.pid = p.pid where p.id = '" + no + "' and pr.pc = '"
								+ ps.getCategory() + "' and (p.expdate between STR_TO_DATE('" + ps.getExpDate()
								+ "', '%Y-%m-%d')  and STR_TO_DATE('" + ps.getToDate() + "', '%Y-%m-%d')) limit "
								+ ps.getRecords() + "",
						new RowMapper<Productstock>() {
							public Productstock mapRow(ResultSet rs, int row) throws SQLException {
								Productstock p = new Productstock();

								p.setCode(rs.getString(1));
								p.setName(rs.getString(2));
								p.setBatch(rs.getString(3));
								p.setExpDate(rs.getString(4));
								p.setCategory(rs.getString(5));
								p.setMpack(rs.getString(6));
								p.setMpsize(rs.getString(7));
								p.setCp(rs.getString(8));
								p.setPrqty(rs.getString(9));
								p.setPrprice(rs.getString(10));
								p.setQuantity(rs.getString(11));
								p.setSudesc(rs.getString(12));
								p.setStkpr(rs.getString(13));
								p.setMarkup(rs.getString(14));
								p.setSp(rs.getString(15));
								p.setSpdesc(rs.getString(16));
								p.setSpsize(rs.getString(17));
								p.setStksp(rs.getString(18));
								p.setSellqty(rs.getString(19));
								p.setSunits(rs.getString(20));
								p.setTprice(rs.getString(21));
								p.setPid(rs.getInt(22));
								return p;
							}
						});

			}

		}

	}

	// :TODO // multiple calls from controller
	@Override
	public List<Productstock> getInfoStkSearch(String table, int no) {
		String sql = getQuery("getInfoStkSearch");
		return template.query(sql, new Object[] { no, no }, new RowMapper<Productstock>() {
			public Productstock mapRow(ResultSet rs, int row) throws SQLException {
				Productstock p = new Productstock();
				p.setCode(rs.getString("prc"));
				p.setName(rs.getString("name"));
				p.setBatch(rs.getString("batch"));
				p.setExpDate(rs.getString("expdate"));
				p.setCategory(rs.getString("pc"));
				p.setMpack(rs.getString("mpack"));
				p.setMpsize(rs.getString("mpsize"));
				p.setCp(rs.getString("cp"));
				p.setPrqty(rs.getString("prqty"));
				p.setPrprice(rs.getString("prprice"));
				p.setQuantity(rs.getString("currentstock"));
				p.setSudesc(rs.getString("sudesc"));
				p.setStkpr(rs.getString("stkpr"));
				p.setMarkup(rs.getString("markup"));
				p.setSp(rs.getString("sp"));
				p.setSpdesc(rs.getString("spdesc"));
				p.setSpsize(rs.getString("spsize"));
				p.setStksp(rs.getString("stksp"));
				p.setSellqty(rs.getString("sellqty"));
				p.setSunits(rs.getString("sunits"));
				p.setTprice(rs.getString("tprice"));
				p.setPid(rs.getInt("pid"));
				p.setCs(rs.getInt("currstock"));
				return p;
			}
		});
	}

	@Override
	public List<ProductStocks> getInfoStkSearchd(String table, int no) {
		String sql = getQuery("getInfoStkSearchd");
		return template.query(sql, new Object[] { no, no }, extractDispProductStocks());
	}

	@Override
	public List<ProductStocks> getInfoStkSearch1(String table, int no) {
		String sql = getQuery("getInfoStkSearch1");
		return template.query(sql, new Object[] { no, no },extractProductStocks());	
		
	}

	@Override
	public int psStatus(int uqkval) {
		String status = "off";
		String sql = getQuery("psStatus");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, status, uqkval);
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;
	}

	@Override
	public int psStatus2(int uqkval) {
		String status = "on";
		String sql = getQuery("psStatus");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, status, uqkval);
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;
	}

	// TODO : review table d
	@Override
	public List<Sale> getsaleInv(String invoice, String table, String table1, int no) {

		return template.query(
				"select s.invoice,s.invoiceDate,s.author,s.cdiscount,s.custId,s.custName,s.custPhone,s.gender,s.age,s.ean,s.pname,s.batch,s.expDate,s.unit,s.unitprice,s.quantity,s.free,(select ps.currentstock from "
						+ table1 + " ps where ps.id = '" + no
						+ "' and ps.pid = s.pid and ps.batch = s.batch)CurrentStock,s.total,s.titems,s.subt,s.discount,s.tax,s.gtotal,s.spack,s.spsize,s.sudesc,s.fileno from "
						+ table + " s where s.id='" + no + "' and invoice ='" + invoice + "'",
				new RowMapper<Sale>() {
					public Sale mapRow(ResultSet rs, int row) throws SQLException {
						Sale s = new Sale();

						s.setInvoice(rs.getString(1));
						s.setInvoiceDate(rs.getString(2));
						s.setAuthor(rs.getString(3));
						s.setCdiscount(rs.getString(4));
						s.setCustId(rs.getString(5));
						s.setCustName(rs.getString(6));
						s.setCustPhone(rs.getString(7));
						s.setGender(rs.getString(8));
						s.setAge(rs.getString(9));
						s.setEan(rs.getString(10));
						s.setPname(rs.getString(11));
						s.setBatch(rs.getString(12));
						s.setExpDate(rs.getString(13));
						s.setUnit(rs.getString(14));
						s.setUnitprice(rs.getString(15));
						s.setQuantity(rs.getString(16));
						s.setFree(rs.getString(17));
						s.setStock(rs.getString(18));
						s.setTotal(rs.getString(19));
						s.setTitems(rs.getString(20));
						s.setSubt(rs.getString(21));
						s.setDiscount(rs.getString(22));
						s.setTax(rs.getString(23));
						s.setGtotal(rs.getString(24));
						s.setSdesc(rs.getString(25));
						s.setSpsize(rs.getString(26));
						s.setSudesc(rs.getString(27));
						s.setFileno(rs.getString(28));
						// TODO Auto-generated method
						// stubinvoice,invoiceDate,author,cdiscount,custId,custName,custPhone,gender,age,ean,pname,batch,expDate,unit,unitprice,quantity,free,stock,total,titems,subt,discount,tax,gtotal
						return s;
					}
				});

	}

	// print purchase
	// TODO : create another controller method
	// TODO : review code. column names
	@Override
	public List<Purchase> getPrpur(String invoice, String table) {
		String sql = getQuery("getPrpur");
		return template.query(sql, new Object[] { invoice }, new RowMapper<Purchase>() {
			public Purchase mapRow(ResultSet rs, int row) throws SQLException {
				Purchase s = new Purchase();

				s.setAllocationid(rs.getString("allocationid"));
				s.setReceiveddate(rs.getString("receiveddate"));
				s.setProductName(rs.getString("productName"));
				s.setBatch1(rs.getString("batch"));
				s.setExpDate(rs.getString("expDate"));
				s.setQuantity(rs.getString("quantity"));
				s.setUnitPrice(rs.getString("unitprice"));
				s.setDiscount(rs.getString("discount"));
				s.setTotal(rs.getString("discount"));
				s.setEan(rs.getString("ean"));
				s.setGrandTotal(rs.getString("grandTotal"));
				s.setSupplier(rs.getString("supplierInvoice"));
				s.setMdesc(rs.getString("mdesk"));
				s.setMpack(rs.getString("mpack"));
				s.setSudesc(rs.getString(15));
				s.setTaxes(rs.getString(16));
				s.setSinvoice(rs.getString(17));
				return s;
			}
		});

	}

	@Override
	public List<Purchase> getPrpurd(String invoice, String table) {
		String sql = getQuery("getPrpurd");
		return template.query(sql, new Object[] { invoice }, new RowMapper<Purchase>() {
			public Purchase mapRow(ResultSet rs, int row) throws SQLException {
				Purchase s = new Purchase();

				s.setAllocationid(rs.getString("allocationid"));
				s.setReceiveddate(rs.getString("receiveddate"));
				s.setProductName(rs.getString("productName"));
				s.setBatch1(rs.getString("batch"));
				s.setExpDate(rs.getString("expDate"));
				s.setQuantity(rs.getString("quantity"));
				s.setUnitPrice(rs.getString("unitprice"));
				s.setDiscount(rs.getString("discount"));
				s.setTotal(rs.getString("discount"));
				s.setEan(rs.getString("ean"));
				s.setGrandTotal(rs.getString("grandTotal"));
				s.setSupplier(rs.getString("supplierInvoice"));
				s.setMdesc(rs.getString("mdesk"));
				s.setMpack(rs.getString("mpack"));
				s.setSudesc(rs.getString(15));
				s.setTaxes(rs.getString(16));
				s.setSinvoice(rs.getString(17));
				return s;
			}
		});

	}

	@Override
	public List<ProductStocks> getinvprods(int pid, String table, String table1, int no) {
		String sql = getQuery("getinvprods").replace("$tablename", table);
		if(table.equalsIgnoreCase("dproductstock")) {
			sql = sql.replace("and ps.status = 'on'", "");
		}
		return template.query(sql, new Object[] { no, pid }, new RowMapper<ProductStocks>() {
			public ProductStocks mapRow(ResultSet rs, int row) throws SQLException {
				ProductStocks s = new ProductStocks();
				s.setBatch(rs.getString("batch"));
				s.setExpirydate(rs.getDate("expdate"));
				s.setSpdesc(rs.getString("spdesc"));
				s.setSpsize(rs.getInt("spsize"));
				s.setCurrentstock(rs.getInt("currentstock"));
				s.setSudesc(rs.getString("sudesc"));
				s.setSp(rs.getFloat("sp"));
				s.setSellqty(rs.getInt("sellqty"));
			    s.setSunits(rs.getInt("sunits"));
				s.setPid(rs.getInt("pid"));
				s.setCp(rs.getInt("cp"));
				s.setName(rs.getString("name"));
				s.setCode(rs.getString("prc"));
			    return s;

			}
		});
	}

	@Override
	public List<ProductStocks> getinvprodsd(int pid, String table, String table1, int no) {
		String sql = getQuery("getinvprodsd");
		return template.query(sql, new Object[] { no, pid }, new RowMapper<ProductStocks>() {
			public ProductStocks mapRow(ResultSet rs, int row) throws SQLException {
				ProductStocks s = new ProductStocks();
				s.setBatch(rs.getString("batch"));
				s.setExpirydate(rs.getDate("expdate"));
				s.setSpdesc(rs.getString("spdesc"));
				s.setSpsize(rs.getInt("spsize"));
				s.setCurrentstock(rs.getInt("currentstock"));
				s.setSudesc(rs.getString("sudesc"));
				s.setSp(rs.getFloat("sp"));
				s.setSellqty(rs.getInt("sellqty"));
			    s.setSunits(rs.getInt("sunits"));
				s.setPid(rs.getInt("pid"));
				s.setCp(rs.getInt("cp"));
				s.setName(rs.getString("name"));
				s.setCode(rs.getString("prc"));
			    return s;

			}
		});
	}

	

	@Override
	public int updated(int pid, String stk, String batch, String table, int no) {
		String sql = getQuery("updated");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, stk, no, pid, batch);
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;
	}

	@Override
	public int deletepr(int autoid) {
		String sql = getQuery("deletepr");
		return template.update(sql, new Object[] {autoid });

	}
	
	@Override
	public int deleteOrder(int autoid) {
		String sql = getQuery("deleteOrder");
		return template.update(sql, new Object[] {autoid });

	}

	// display sales reports
	@Override
	public List<Sale> getsaleReports(String frdate, String edate, String table) {
		String sql = getQuery("getsaleReports");
		return template.query(sql, new RowMapper<Sale>() {
			public Sale mapRow(ResultSet rs, int row) throws SQLException {
				Sale s = new Sale();
				s.setInvoice(rs.getString("invoice"));
				s.setInvoiceDate(rs.getString("invoiceDate"));
				s.setCustName(rs.getString("custName"));
				s.setDiscount(rs.getString("cdiscount"));
				s.setTax(rs.getString("tax"));
				s.setGtotal(rs.getString("gtotal"));
				return s;
			}
		});

	}

	@Override
	public List<Sale> getsaleReportsd(String frdate, String edate, String table) {
		String sql = getQuery("getsaleReportsd");
		return template.query(sql, new RowMapper<Sale>() {
			public Sale mapRow(ResultSet rs, int row) throws SQLException {
				Sale s = new Sale();
				// s.invoice as invoice ,s.invoiceDate as invoiceDate,s.custName as
				// custName,s.cdiscount as cdiscount,s.tax as tax,s.gtotal as gtotal
				s.setInvoice(rs.getString("invoice"));
				s.setInvoiceDate(rs.getString("invoiceDate"));
				s.setCustName(rs.getString("custName"));
				s.setDiscount(rs.getString("cdiscount"));
				s.setTax(rs.getString("tax"));
				s.setGtotal(rs.getString("gtotal"));
				return s;
			}
		});

	}

	@Override
	public List<ProductStocks> getBatdet(String batch, String table, int pid, int id) {
		String sql = getQuery("getBatdet");
		return template.query(sql, new Object[] { batch, pid, id }, new RowMapper<ProductStocks>() {
			public ProductStocks mapRow(ResultSet rs, int row) throws SQLException {
				ProductStocks p = new ProductStocks();
				p.setBatch(rs.getString("batch"));
				p.setExpirydate(rs.getDate("expdate"));
				p.setMpsize(rs.getInt("mpsize"));
				p.setCp(rs.getFloat("cp"));

				return p;
			}
		});
	}

	@Override
	public List<Productstock> getBatdetd(String batch, String table, String pname, int id) {
		String sql = getQuery("getBatdetd");
		return template.query(sql, new Object[] { batch, pname, id }, new RowMapper<Productstock>() {
			public Productstock mapRow(ResultSet rs, int row) throws SQLException {
				Productstock p = new Productstock();
				p.setBatch(rs.getString("batch"));
				p.setExpDate(rs.getString("expdate"));
				p.setMpsize(rs.getString("mpsize"));
				p.setCp(rs.getString("cp"));

				return p;
			}
		});
	}

	@Override
	public int[] updateorpr(List<Integer> productList, int no) {
		return template.batchUpdate(getQuery("updateorpr"), new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setInt(1, productList.get(i));
				
			}

			public int getBatchSize() {
				return productList.size();
			}
		});
	
	}

	@Override
	public int updatereord(String name, String val, int no) {

		String sql = getQuery("updatereord");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, val, name, name);
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;
	}

	@Override
	public List<Productstock> getBranchPRS(int no, int pid) {
		String sql = getQuery("getBranchPRS");
		return template.query(sql, new Object[] { no, pid }, new RowMapper<Productstock>() {
			public Productstock mapRow(ResultSet rs, int row) throws SQLException {
				Productstock i = new Productstock();
				i.setCstock(rs.getString("currstock"));
				return i;
			}
		});
	}

	@Override
	public int updBranchdet(int no, int ssid, int fid, String table) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {
				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("updBranchdet");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setInt(1, no);
					ps.setInt(2, ssid);
					ps.setInt(3, fid);

					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}

		return keyHolder.getKey().intValue();
	}

	@Override
	public int updTransfer(int no, String batch, String expdate, String cp, String sp, String stkstrans, String table) {
		// TODO Auto-generated method stub

		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setInt(1, no);
					ps.setString(2, batch);
					ps.setString(3, expdate);
					ps.setString(4, stkstrans);
					ps.setString(5, cp);
					ps.setString(6, sp);
					return ps;
				}
			}, keyHolder);
		} catch (InvalidResultSetAccessException e) {
		} catch (DataAccessException e) {
		}

		return keyHolder.getKey().intValue();
	}

	@Override
	public int updstkinbr(int pid, int ssid, String string2, String batch, String table) {
		String sql = getQuery("updstkinbr");
		int returnVal = 0;
		try {
			returnVal = template.update(sql, string2, ssid, pid, batch);
		} catch (InvalidResultSetAccessException e) {

		} catch (DataAccessException e) {

		}
		return returnVal;
	}

	@Override
	public List<License> getLusers() {

		return template.query(getQuery("getLicenceUsers"), new RowMapper<License>() {
			public License mapRow(ResultSet rs, int row) throws SQLException {
				License p = new License();
				p.setLid(rs.getInt("lid"));
				p.setLckey(rs.getString("lkey"));
				return p;
			}
		});
	}

	@Override
	public List<Branch> getBranch() {
		// TODO Auto-generated method stub
		String sql = getQuery("getBranch");

		return template.query(sql, new RowMapper<Branch>() {
			public Branch mapRow(ResultSet rs, int row) throws SQLException {
				Branch i = new Branch();
				i.setId(rs.getInt("id"));
				i.setName(rs.getString("name"));
				i.setAddress(rs.getString("address"));
				i.setLogo(rs.getString("logo"));
				i.setIop(rs.getString("logoname"));
				i.setType(rs.getString("type"));
				return i;
			}
		});
	}
	
	@Override
	public List<Branch> getOtherBranch(int no) {
		// TODO Auto-generated method stub
		String sql = getQuery("getOtherBranch");

		return template.query(sql, new Object[] { no }, new RowMapper<Branch>() {
			public Branch mapRow(ResultSet rs, int row) throws SQLException {
				Branch i = new Branch();
				i.setId(rs.getInt("id"));
				i.setName(rs.getString("name"));
				i.setAddress(rs.getString("address"));
				i.setLogo(rs.getString("logo"));
				i.setIop(rs.getString("logoname"));
				i.setType(rs.getString("type"));
				return i;
			}
		});
	}

	@Override
	public List<Branch> getBranch(int no) {
		// TODO Auto-generated method stub
		String sql = getQuery("getBranchForId");

		return template.query(sql, new Object[] { no }, new RowMapper<Branch>() {
			public Branch mapRow(ResultSet rs, int row) throws SQLException {
				Branch i = new Branch();
				i.setName(rs.getString("name"));
				i.setAddress(rs.getString("address"));
				i.setLogo(rs.getString("logo"));
				i.setIop(rs.getString("logoname"));
				return i;
			}
		});
	}
	
	@Override
	public int saveorder(Order o) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("saveOrder");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, o.getOrderid());
					ps.setInt(2, o.getBranchid());
					ps.setString(3, o.getDelivery());
					ps.setString(4, o.getAuthor());
					ps.setInt(5, o.getCount());
					ps.setInt(6, o.getSupplierid());
					ps.setInt(7, o.getBranchid());
					return ps;
				}
			}, keyHolder);
		}  catch (InvalidResultSetAccessException e) {
			System.out.println(e);
		} catch (DataAccessException e) {
			System.out.println(e);
		}
      
		return keyHolder.getKey().intValue();
	}
	
	@Override
	public int updateorder(Order o) {
		String sql = getQuery("updateOrder");
		return template.update(sql, new Object[] {o.getDelivery(),o.getAuthor(),o.getCount(),o.getSupplierid(),o.getBranchid(),o.getAutoid()});  
	}
	@Override
	public int[] saveorderdetails(List<OrderDetails> insertList) {
		return template.batchUpdate(getQuery("saveOrderDetails"), new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setInt(1, insertList.get(i).getPid());
				ps.setString(2, insertList.get(i).getUnit());
				ps.setInt(3, insertList.get(i).getQuantity());
				ps.setInt(4, insertList.get(i).getOrderautoid());
			}

			public int getBatchSize() {
				return insertList.size();
			}
		});

	}
	
	@Override
	public int[] updateorderdetails(List<OrderDetails> updateList) {
		return template.batchUpdate(getQuery("updateOrderDetails"), new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setInt(1, updateList.get(i).getPid());
				ps.setString(2, updateList.get(i).getUnit());
				ps.setInt(3, updateList.get(i).getQuantity());
				ps.setInt(4, updateList.get(i).getOrderautoid());
				ps.setInt(5, updateList.get(i).getAutoid());
			}

			public int getBatchSize() {
				return updateList.size();
			}
		});
	}
	
	@Override
	public int savePurchases(Purchases purchase) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("savePurchases");
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, purchase.getAllocationid());
					ps.setInt(2, purchase.getBranchid());
					ps.setInt(3, purchase.getSupplierid());
					ps.setString(4, purchase.getSupplierinvoice());
					ps.setDouble(5, purchase.getGrandtotal());
					ps.setInt(6, purchase.getBranchid());
					return ps;
				}
			}, keyHolder);
		}  catch (InvalidResultSetAccessException e) {
			System.out.println(e);
		} catch (DataAccessException e) {
			System.out.println(e);
		}
	    purchase.getPurchaseDetailsList().forEach(details -> details.setPurchasesid(keyHolder.getKey().intValue()));
        savePurchaseDetails(purchase.getPurchaseDetailsList());
		return keyHolder.getKey().intValue();
	}
	
	
	@Override
	public int[] savePurchaseDetails(List<PurchaseDetails> insertList) {
		return template.batchUpdate(getQuery("savePurchaseDetails"), new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setInt(1, insertList.get(i).getPid());
				ps.setString(2, insertList.get(i).getBatch());
				ps.setString(3, insertList.get(i).getPackdesc());
				ps.setInt(4, insertList.get(i).getPacksize());
				ps.setString(5, insertList.get(i).getSingleunitdesc());
				ps.setInt(6, insertList.get(i).getPurchaseqty());
				ps.setDouble(7, insertList.get(i).getTotalpurchaseprice());
				ps.setFloat(8, insertList.get(i).getUnitcp());
				ps.setInt(9, insertList.get(i).getStocknumber());
				ps.setDouble(10, insertList.get(i).getStockvaluepurchase());
				ps.setInt(11, insertList.get(i).getPurchasesid());
				ps.setDate(12, insertList.get(i).getExpirydate());
			}

			public int getBatchSize() {
				return insertList.size();
			}
		});

	}
	@Override
	public int[] savePurchaseStocks(List<ProductStocks> insertList) {
		return template.batchUpdate(getQuery("saveProductStocks"), new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setInt(1, insertList.get(i).getPid());
				ps.setString(2, insertList.get(i).getBatch());
				ps.setDate(3, insertList.get(i).getExpirydate());
				ps.setString(4,insertList.get(i).getMpack());
				ps.setInt(5, insertList.get(i).getMpsize());
				ps.setFloat(6, insertList.get(i).getCp());
				ps.setInt(7, insertList.get(i).getPurchaseqty());
				ps.setString(8, insertList.get(i).getSudesc());
				ps.setDouble(9, insertList.get(i).getStockprice());
				ps.setDouble(10, insertList.get(i).getPurchaseprice());
				ps.setInt(11, insertList.get(i).getCurrentstock());
				ps.setInt(12, insertList.get(i).getBranchid());
			}
			public int getBatchSize() {
				return insertList.size();
			}
		});
	}
	
	
	@Override
	public int[] updateReorderFlag(List<Integer> reorderLevelList) {
		return template.batchUpdate(getQuery("updatereord"), new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setInt(1, reorderLevelList.get(i));
				ps.setInt(2, reorderLevelList.get(i));
			}
			public int getBatchSize() {
				return reorderLevelList.size();
			}
		});
	}
	
	@Override
	public int[] updateProductStocks(List<ProductStocks> udpateList,String tablename) {
		String query = getQuery("updateProductStocks").replace("$tablename", tablename);
		if(tablename.equalsIgnoreCase("dproductstock")) {
			query = query.replace(",status = ?", "");
		}
		return template.batchUpdate(query, new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setDate(1, udpateList.get(i).getExpirydate());
				ps.setInt(2, udpateList.get(i).getMpsize());
				ps.setFloat(3, udpateList.get(i).getCp());
				ps.setInt(4, udpateList.get(i).getPurchaseqty());
				ps.setDouble(5, udpateList.get(i).getPurchaseprice());
				ps.setInt(6, udpateList.get(i).getCurrentstock());
				ps.setString(7, udpateList.get(i).getSudesc());
				ps.setDouble(8, udpateList.get(i).getStockprice());
				ps.setFloat(9, udpateList.get(i).getMarkup());
				ps.setFloat(10, udpateList.get(i).getSp());
				ps.setString(11, udpateList.get(i).getSpdesc());
				ps.setInt(12, udpateList.get(i).getSpsize());
				ps.setDouble(13, udpateList.get(i).getStksp());
				ps.setInt(14, udpateList.get(i).getSellqty());
				ps.setInt(15, udpateList.get(i).getSunits());
				ps.setDouble(16, udpateList.get(i).getTotalprice());
				if(tablename.equalsIgnoreCase("productstock")) {
				if(udpateList.get(i).getStatus() != null && udpateList.get(i).getStatus().equals("on")) {
				  ps.setString(17, udpateList.get(i).getStatus());
				}else {
				  ps.setString(17, "off");
				}
				ps.setInt(18, udpateList.get(i).getAutoid());
				}
				else {
					ps.setInt(17, udpateList.get(i).getAutoid());
				}
			}
			public int getBatchSize() {
				return udpateList.size();
			}
		});
	}
	
	private RowMapper<ProductStocks> getMethodtoExtract(String tablename) {
		return (tablename.equalsIgnoreCase("productstock") ? extractProductStocks() : extractDispProductStocks()); 
	}
	@Override
	public List<ProductStocks> fetchSearchResults(ProductStocksWrapper wrapper,String tablename){
		String query = getQuery("fetchProductStocks").replace("$tablename", tablename);
		if(tablename.equalsIgnoreCase("dproductstock")) {
			query = query.replace("p.status as status,", "");
			query = query.replace("p.status='on' and", "");
		}
		if(wrapper.getCategory().equalsIgnoreCase("All")) {
			if(Utils.isEmpty(wrapper.getName()) && Utils.isEmpty(wrapper.getBatch()) && Utils.isEmpty(wrapper.getCode())) {
			 query = query.replace("and (pr.pc like ? or pr.name like ? or pr.prc = ? or p.batch = ?)", "");	
			 return template.query(query, new Object[] {wrapper.getBranchid(),wrapper.getBranchid(),wrapper.getExpirydate(),wrapper.getToexpirydate(),wrapper.getLimit()}, getMethodtoExtract(tablename));
			}
			else {
				query = query.replace("pr.pc like ? or", "");
				return template.query(query, new Object[] {wrapper.getBranchid(),wrapper.getBranchid(),wrapper.getExpirydate(),wrapper.getToexpirydate(),Utils.isEmpty(wrapper.getName()) ? wrapper.getName() : Utils.getLikeParamValue(wrapper.getName(),false),
				wrapper.getCode(),wrapper.getBatch(),wrapper.getLimit()}, getMethodtoExtract(tablename));
	            }
			 }
		else {
			return template.query(query, new Object[] {wrapper.getBranchid(),wrapper.getBranchid(),wrapper.getExpirydate(),wrapper.getToexpirydate(),Utils.isEmpty(wrapper.getCategory()) ? wrapper.getCategory() : Utils.getLikeParamValue(wrapper.getCategory(),false), Utils.isEmpty(wrapper.getName()) ? wrapper.getName() : Utils.getLikeParamValue(wrapper.getName(),false),
			wrapper.getCode(),wrapper.getBatch(),wrapper.getLimit()}, getMethodtoExtract(tablename));
		}
		
	}
	
	private RowMapper<ProductStocks> extractProductStocks(){
		return new RowMapper<ProductStocks>() {

			@Override
			public ProductStocks mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductStocks p = new ProductStocks();
				p.setCode(rs.getString("prc"));
				p.setName(rs.getString("name"));
				p.setBatch(rs.getString("batch"));
				p.setExpirydate(rs.getDate("expdate"));
				p.setCategory(rs.getString("pc"));
				p.setMpack(rs.getString("mpack"));
				p.setMpsize(rs.getInt("mpsize"));
				p.setCp(rs.getFloat("cp"));
				p.setPurchaseqty(rs.getInt("prqty"));
				p.setPurchaseprice(rs.getDouble("prprice"));
				p.setCurrentstock(rs.getInt("currentstock"));//p.setQuantity(rs.getInt("curentstock"));
				p.setSudesc(rs.getString("sudesc"));
				p.setStockprice(rs.getDouble("stkpr"));
				p.setMarkup(rs.getFloat("markup"));
				p.setSp(rs.getFloat("sp"));
				p.setSpdesc(rs.getString("spdesc"));
				p.setSpsize(rs.getInt("spsize"));
				p.setStksp(rs.getFloat("stksp"));
				p.setSellqty(rs.getInt("sellqty"));
				p.setSunits(rs.getInt("sunits"));
				p.setTotalprice(rs.getDouble("tprice"));
				p.setPid(rs.getInt("pid"));
				p.setTotalPrdStks(rs.getInt("currstock"));
				p.setStatus(rs.getString("status"));
				p.setAutoid(rs.getInt("autoid"));
				return p;
			}
		};
	}

	private RowMapper<ProductStocks> extractDispProductStocks(){
		return new RowMapper<ProductStocks>() {

			@Override
			public ProductStocks mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductStocks p = new ProductStocks();
				p.setCode(rs.getString("prc"));
				p.setName(rs.getString("name"));
				p.setBatch(rs.getString("batch"));
				p.setExpirydate(rs.getDate("expdate"));
				p.setCategory(rs.getString("pc"));
				p.setMpack(rs.getString("mpack"));
				p.setMpsize(rs.getInt("mpsize"));
				p.setCp(rs.getFloat("cp"));
				p.setPurchaseqty(rs.getInt("prqty"));
				p.setPurchaseprice(rs.getDouble("prprice"));
				p.setCurrentstock(rs.getInt("currentstock"));//p.setQuantity(rs.getInt("curentstock"));
				p.setSudesc(rs.getString("sudesc"));
				p.setStockprice(rs.getDouble("stkpr"));
				p.setMarkup(rs.getFloat("markup"));
				p.setSp(rs.getFloat("sp"));
				p.setSpdesc(rs.getString("spdesc"));
				p.setSpsize(rs.getInt("spsize"));
				p.setStksp(rs.getFloat("stksp"));
				p.setSellqty(rs.getInt("sellqty"));
				p.setSunits(rs.getInt("sunits"));
				p.setTotalprice(rs.getDouble("tprice"));
				p.setPid(rs.getInt("pid"));
				p.setAutoid(rs.getInt("autoid"));
				return p;
			}
		};
	}

	
	@Override
	public int saveSaleDetails(Sales sale,String tablename,String subtablename) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			template.update(new PreparedStatementCreator() {

				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String sql = getQuery("saveSalesInfo").replace("$tablename", tablename);
					PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				      ps.setString(1,sale.getInvoice());
				      ps.setInt(2, sale.getBranchid());
				      ps.setDate(3,sale.getInvoicedate());
				      ps.setFloat(4, sale.getCdiscount());
				      ps.setInt(5, sale.getCustomer().getCid());
				      ps.setInt(6, sale.getBranchid());
				      ps.setString(7, sale.getFileno());
				      ps.setInt(8, sale.getTitems());
				      ps.setDouble(9, sale.getSubt());
				      ps.setFloat(10, sale.getTax());
				      ps.setFloat(11, sale.getDiscount());
				      ps.setDouble(12, sale.getGtotal());
				      ps.setString(13, sale.getCreatedby());
				      if(Utils.isEmpty(sale.getIsPatient())) {
				    	  ps.setString(14, "false");
				      }else {
				    	  ps.setString(14, sale.getIsPatient());	  
				      }
				     
					return ps;
				}
			}, keyHolder);
		}  catch (InvalidResultSetAccessException e) {
			System.out.println(e);
		} catch (DataAccessException e) {
			System.out.println(e);
		}
	    sale.getSaledetailsList().forEach(details -> details.setSalesautoid(keyHolder.getKey().intValue()));
        saveSaleDetails(sale.getSaledetailsList(),subtablename);
		return keyHolder.getKey().intValue();

	}

	private int[] saveSaleDetails(List<SaleDetails> saledetailsList,String tablename) {
		return template.batchUpdate(getQuery("saveSalesDetails").replace("$tablename", tablename), new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setInt(1, saledetailsList.get(i).getProduct().getPid());
				ps.setString(2, saledetailsList.get(i).getBatch());
				ps.setDate(3, saledetailsList.get(i).getExpirydate());
				ps.setInt(4, saledetailsList.get(i).getQuantitysold());
				ps.setFloat(5, saledetailsList.get(i).getUnitprice());
				ps.setInt(6, saledetailsList.get(i).getTotalquantity());
				ps.setInt(7, saledetailsList.get(i).getStock());
				ps.setDouble(8, saledetailsList.get(i).getTotal());
				ps.setString(9, saledetailsList.get(i).getSpack());
				ps.setInt(10, saledetailsList.get(i).getSpsize());
				ps.setString(11, saledetailsList.get(i).getSudesc());
				ps.setInt(12, saledetailsList.get(i).getSalesautoid());
			}

			public int getBatchSize() {
				return saledetailsList.size();
			}
		});


	}
	
	@Override
	public int[] updateCurrentStocks(List<ProductStocks> stocksList, String tablename) {
		return template.batchUpdate(getQuery("update").replace("$tablename", tablename), new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
			ps.setInt(1, stocksList.get(i).getQuantity());
			ps.setInt(2, stocksList.get(i).getBranchid());
			ps.setInt(3, stocksList.get(i).getPid());
			ps.setString(4, stocksList.get(i).getBatch());
			}
			public int getBatchSize() {
				return stocksList.size();
			}
		});
	}
	
	@Override
	public List<Sales> fetchSaleRecords(int autoid,String tablename, String subtablename, String subtablename2){
		String query = "";
		if(tablename.equalsIgnoreCase("dispensarysale")) {
		query =	getQuery("fetchDispSaleRecords").replace("$tablename", tablename);
		}
		query = getQuery("fetchSaleRecords").replace("$tablename", tablename);
		return template.query(query,new Object[] {autoid},new RowMapper<Sales>() {
			public Sales mapRow(ResultSet rs, int row) throws SQLException {
				Sales sales = new Sales();
				sales.setAutoid(rs.getInt("autoid"));
				sales.setInvoice(rs.getString("invoice"));
				sales.setInvoicedate(rs.getDate("invoicedate"));
				sales.setCdiscount(rs.getFloat("cdiscount"));
				Customer customer = new Customer();
		 	    customer.setCid(rs.getInt("cid"));
				if(rs.getBoolean("isPatient") == false) {
		 	    customer.setName(rs.getString("name"));
		 	    customer.setAge(rs.getString("age"));
		   	    customer.setPhone(rs.getString("phone"));
		 	    customer.setSex(rs.getString("sex"));
		 	    customer.setCustomer(rs.getString("customer"));
				}
				sales.setCustomer(customer);
				sales.setBranchid(rs.getInt("branchid"));
				sales.setFileno(rs.getString("fileno"));
				sales.setTitems(rs.getInt("titems"));
				sales.setSubt(rs.getDouble("subt"));
				sales.setTax(rs.getFloat("tax"));
				sales.setGtotal(rs.getDouble("gtotal"));
				sales.setCreatedby(rs.getString("createdby"));
				sales.setIsPatient(rs.getString("isPatient"));
				sales.setSaledetailsList(fetchSaleDetailsRecords(sales.getAutoid(),subtablename,subtablename2));
				return sales;
			}
		});
	}
	
	public List<SaleDetails> fetchSaleDetailsRecords(int salesautoid,String tablename,String subtablename){
		String query = getQuery("fetchSaleDetails").replace("$tablename", tablename).replace("$subtable", subtablename);
		return template.query(query, new Object[] {salesautoid},new RowMapper<SaleDetails>() {
              public SaleDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				SaleDetails details = new SaleDetails();
				details.setBatch(rs.getString("batch"));
				details.setExpirydate(rs.getDate("expirydate"));
				details.setQuantitysold(rs.getInt("quantitysold"));
				details.setUnitprice(rs.getFloat("unitprice"));
				details.setTotalquantity(rs.getInt("totalquantity"));
				details.setStock(rs.getInt("currentstock"));
				details.setTotal(rs.getDouble("total"));
				details.setSpack(rs.getString("spack"));
				details.setSpsize(rs.getInt("spsize"));
				details.setSudesc(rs.getString("sudesc"));
				details.setSalesautoid(rs.getInt("salesautoid"));
				
				Product product = new Product();
				product.setPid(rs.getInt("pid"));
				product.setName(rs.getString("name"));
				product.setPrc(rs.getString("prc"));
				
				details.setProduct(product);
				return details;
			}
		
		});
		}
	
	
	@Override
	@Transactional
	public int transferStocks(List<ProductStocks> stocksList) throws Exception{
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String json = gson.toJson(stocksList);
		SimpleJdbcCall jdbcCall = new SimpleJdbcCall(template.getDataSource()).withProcedureName("Transfer_Stocks");
		SqlParameterSource in = new MapSqlParameterSource().addValue("stksArr", json);
		Map<String, Object> out = jdbcCall.execute(in);
		return (Integer) out.get("result");
	   
	}

	@Override
	public List<Branch> getAllBranch() {
		String sql = getQuery("getAllBranch");
		return template.query(sql, new Object[] {}, new RowMapper<Branch>() {
			public Branch mapRow(ResultSet rs, int row) throws SQLException {
				Branch i = new Branch();
				i.setId(rs.getInt("id"));
				i.setName(rs.getString("name"));
				i.setAddress(rs.getString("address"));
				i.setLogo(rs.getString("logo"));
				i.setIop(rs.getString("logoname"));
				i.setType(rs.getString("type"));
				return i;
			}
		});
	}
}
