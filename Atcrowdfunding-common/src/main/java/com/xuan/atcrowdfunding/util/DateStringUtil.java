package com.xuan.atcrowdfunding.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateStringUtil {
	

	public static String dateToString(Date date) {
		SimpleDateFormat simp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String TimeDate = simp.format(date);
		return TimeDate;
	}
	
	

}
