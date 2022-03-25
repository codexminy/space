package com.second.space.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils {
	
	public static String getRenamedFileName(String fname) {
		//확장자 분리
		String ext = fname.substring(fname.lastIndexOf(".")+1);
		//날짜
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		//난수 만들기
		int rndNum = (int)(Math.random()*1000);
		
		return sdf.format(new Date())+"_"+rndNum+"."+ext;
	}
	
	public static String getRenamedFileName2(String fname) {
		//확장자 분리
		String ext = fname.substring(fname.lastIndexOf(".")+1);
		//날짜
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		//난수 만들기
		int rndNum = (int)(Math.random()*1000000000);
		
		return sdf.format(new Date())+"_"+rndNum+"."+ext;
	}
}
