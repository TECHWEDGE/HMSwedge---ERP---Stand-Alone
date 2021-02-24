package ERPHO.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

public class Utils {
	public static final String LIKE = "%";

	public static boolean isEmpty(String str) {
		return str == null || "".equals(str.trim());
	}

	public static String trimWithNullCheck(String str) {
		if (str == null)
			return null;
		else {
			String res = str.trim();
			return "".equals(res) ? null : res;
		}
	}

	public static String checkNull(String str) {
		if (str == null) {
			return "";
		} else {
			return trimWithNullCheck(str);
		}
	}

	public static String getLikeParamValue(String param, boolean trailing) {
		StringBuilder sb = new StringBuilder("");
		if (!trailing) {
			sb.append(LIKE);
		}
		sb.append(param).append(LIKE);
		return sb.toString();
	}
	
	public static String getLikeParamsValue(Integer num, boolean trailing) {
		StringBuilder sb = new StringBuilder("");
		if (!trailing) {
			sb.append(LIKE);
		}
		sb.append(num).append(LIKE);
		return sb.toString();
	}


	public static float getRandomFloatNumber(int max, int min) {
		Random r = new Random();
		return (min + r.nextFloat() * (max - min));
	}

	public static String getAlphaNumericString(int n) {

		// chose a Character random from this String
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz";

		// create StringBuffer size of AlphaNumericString
		StringBuilder sb = new StringBuilder(n);

		for (int i = 0; i < n; i++) {

			// generate a random number between
			// 0 to AlphaNumericString variable length
			int index = (int) (AlphaNumericString.length() * Math.random());

			// add Character one by one in end of sb
			sb.append(AlphaNumericString.charAt(index));
		}

		return sb.toString();
	}

	public static Date getDate(String dateInString) {
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		// String dateInString = "7-Jun-2013";
		Date date = null;
		try {

			date = formatter.parse(dateInString);
			System.out.println("date"+date);
			System.out.println(formatter.format(date));

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	public static Date getStartOfYear(int year) {

		Calendar calendarStart = Calendar.getInstance();
		calendarStart.set(Calendar.YEAR, year);
		calendarStart.set(Calendar.MONTH, 0);
		calendarStart.set(Calendar.DAY_OF_MONTH, 1);
		Date startDate = calendarStart.getTime();

		return startDate;
	}

	public static Date getEndOfYear(int year) {

		Calendar calendarEnd = Calendar.getInstance();
		calendarEnd.set(Calendar.YEAR, year);
		calendarEnd.set(Calendar.MONTH, 11);
		calendarEnd.set(Calendar.DAY_OF_MONTH, 31);
		Date endDate = calendarEnd.getTime();
		return endDate;
	}
	
	public static String getDateTime() {
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String now = sdf.format(date);
		System.out.println("utils now = "+now);
		return now;
	}
}
