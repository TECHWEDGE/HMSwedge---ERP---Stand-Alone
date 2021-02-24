package com.hms.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

public class Utils {

	public static final String LIKE = "%";
	public static final String COMMA_DELIMITER = ",";

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


	public static String getLikeParamValue(String param, boolean trailing) {
		StringBuilder sb = new StringBuilder("");
		if (!trailing) {
			sb.append(LIKE);
		}
		sb.append(param).append(LIKE);
		return sb.toString();
	}

	public static Collection<String> getCollectionFromCSV(String csv) {

		String[] values = csv.split(COMMA_DELIMITER);
		ArrayList<String> list = new ArrayList<String>(Arrays.asList(values));
		return list;
	}


	public static String getMimeType(String fileName) {
		String extension = fileName.substring(fileName.lastIndexOf('.') + 1);

		return extension;
	}


}
