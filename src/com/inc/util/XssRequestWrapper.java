package com.inc.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class XssRequestWrapper extends HttpServletRequestWrapper {

	public XssRequestWrapper(HttpServletRequest request) {
		super(request);
	}

	@Override
	public String getParameter(String parameter) {
		String value = super.getParameter(parameter);
		if(value == null) {
			return null;
		}
		
		return cleanXss(value);
	}

	@Override
	public String[] getParameterValues(String parameter) {
		String[] values = super.getParameterValues(parameter);
		
		if(values == null) {
			return null;
		}
		String[] envalues = new String[values.length];
		for(int i=0; i<values.length; i++) {
			envalues[i] = cleanXss(values[i]);
		}
		
		return envalues;
	}
	
	
	private String cleanXss(String value) {
		value = value.replaceAll("\\\"", "&quot;");
		value = value.replaceAll("eval\\((.*)\\)", "");
		value = value.replaceAll("<", "&lt;");
		value = value.replaceAll(">", "&gt;");
		value = value.replaceAll("\\(", "&#40;");
		value = value.replaceAll("\\)", "&#41;");
		value = value.replaceAll("'", "&#39;");		
		value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
		value = value.replaceAll("script", "");
				
		return value;
	}
}
