package ERPHO.report;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.util.Map;

import org.springframework.stereotype.Component;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

@Component
public class ClientReport {
	private String path;

	private String pathToReportPackage;

	public ClientReport() {
		this.path = this.getClass().getClassLoader().getResource("").getPath();
		this.pathToReportPackage = this.path + "com/labs/jasper/";
		System.out.println(path);
	}

	/*
	 * public void generate(List<Client> clients) throws Exception { List<Client>
	 * _clients = new ArrayList<>(); Client c1 = new Client(1, "One", "1223/B",
	 * "560070", "95101", "9886720673"); Client c2 = new Client(2, "Two", "518",
	 * "560085", "95102", "9845795528"); Client c3 = new Client(3, "Three", "8177",
	 * "560004", "95103", "9886720210"); Client c4 = new Client(4, "Four", "39821",
	 * "560001", "95104", "9886045457"); JasperReport report =
	 * JasperCompileManager.compileReport(this.getPathToReportPackage() +
	 * "Clients.jrxml");
	 * 
	 * JasperPrint print = JasperFillManager.fillReport(report, null, new
	 * JRBeanCollectionDataSource(_clients));
	 * 
	 * File filePath = new File("f:/java/jasperreports/clients.pdf");
	 * 
	 * JasperExportManager.exportReportToPdfFile(print, filePath.getAbsolutePath());
	 * }
	 */

	public void generate(String reportTemplate, Connection connection, Map<String, Object> params, String outputpath) {

		JasperReport report;
		JasperPrint print;
		System.out.println("report template" + reportTemplate);
		try {
			// report =
			// JasperCompileManager.compileReport("E:\\jaysucheckin\\ami\\trunk\\haxagonal\\src\\main\\resources\\HEXQUOTE.jrxml");
			report = JasperCompileManager.compileReport(reportTemplate);
			// String file =
			// "E:\\jaysucheckin\\ami\\trunk\\haxagonal\\src\\main\\resources\\images\\Signature.jpg";

			print = JasperFillManager.fillReport(report, params, connection);

			File filePath = new File(outputpath);

			JasperExportManager.exportReportToPdfFile(print, filePath.getAbsolutePath());

			// JasperExportManager.exportReportToHtmlFile(sourceFileName)
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public byte[] generateAndStream(String reportTemplate, Connection connection, Map<String, Object> params,
			String outputpath) {

		JasperReport report;
		JasperPrint print;
		byte[] bytes = null;
		System.out.println("report template" + reportTemplate);
		try {
			report = JasperCompileManager.compileReport(reportTemplate);
			// String file =

			JasperPrint jasperPrint = JasperFillManager.fillReport(report, params, connection);
			bytes = JasperExportManager.exportReportToPdf(jasperPrint);

			// JasperExportManager.exportReportToHtmlFile(sourceFileName)
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {

			// Initialize a pointer
			// in file using OutputStream
			File file = new File(outputpath);
			OutputStream os = new FileOutputStream(outputpath);

			// Starts writing the bytes in it
			os.write(bytes);
			System.out.println("Successfully" + " byte inserted");

			// Close the file
			os.close();
		}

		catch (Exception e) {
			System.out.println("Exception: " + e);
		}
		return bytes;
	}

	public String getPathToReportPackage() {
		return this.pathToReportPackage;
	}

	public String getPath() {
		return this.path;
	}

	public static void main(String[] args) {
		ClientReport cr = new ClientReport();
		try {
			// cr.generate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public JasperReport compileReport(String reportTemplate) throws Exception {
		JasperReport report;
		try {
			report = JasperCompileManager.compileReport(reportTemplate);
		} catch (JRException e) {
			throw new Exception("Unable to complie report " + reportTemplate, e);
		}
		return report;

	}
}
