package com.inc.util;

import java.util.regex.Pattern;

public class Verify {
	public static boolean idVeriFy(String value) {
		String policy = "([a-z0-9]{4,12})";
		
		return Pattern.compile(policy).matcher(value).matches();		
	}
	
	public static boolean passwordVerify(String value) {
		String policy = "((?=.*[!@#$%^*+=-_])(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z]).{8,15})";
		
		return Pattern.compile(policy).matcher(value).matches();
	}
	
	public static boolean nameVerify(String value) {
		String policy = "([가-힣a-zA-Z]{2,5})";
		
		return Pattern.compile(policy).matcher(value).matches();
	}
}
