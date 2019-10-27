package utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class Utils {

	public static String getUUID(){
		String u =  UUID.randomUUID().toString();
		String uuid = u.substring(u.lastIndexOf('-')+1, u.length()); 
		return uuid;
	}
	public static String getTime(){
		String time;
		Date d = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:ss");
		return format.format(d);
	}
	public static String [] stringToList(String name){
		System.out.println(name);
		String[] n = name.split(",");
		System.out.println(n);
		return n;
	}
	public static String getSimpleTime(){
		String time;
		Date d = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(d);
	}
	
}
