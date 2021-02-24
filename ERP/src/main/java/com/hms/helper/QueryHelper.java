package com.hms.helper;

public class QueryHelper {
	protected Queries dbQueries;
	protected QueryHelper(String queryPath) {
		dbQueries = new Queries(queryPath);
	}
	public String getQuery(String key) {
		return dbQueries.getQuery(key);
	}
}