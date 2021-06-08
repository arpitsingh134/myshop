package com.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.security.sasl.SaslClientFactory;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {

	public static void deleteFile(String path) {
		boolean f = false;

		try {

			File fs = new File(path);
			fs.delete();

		} catch (Exception e) {
			// TODO: handle exception
		}
		//
//		/return f;

	}

	public static boolean saveFile(InputStream is, String path) {
		boolean f = false;

		try {

			byte[] data = new byte[is.available()];
			is.read(data);
			FileOutputStream fs = new FileOutputStream(path);
			fs.write(data);
			fs.flush();
			fs.close();
			f = true;

		} catch (Exception e) {
			// TODO: handle exception
		}

		return f;

	}
	
	public static String  get10Words(String src) {
		
		String [] s=src.split(" ");
		if(s.length>10) {
			String resutlString="";
			for(int i=0;i<10;i++) {
				resutlString+=s[i]+" ";
				
			}
			return resutlString+"...";
			
			
		}
		else {
			
			return src+"...";
			
		}
		
		
	}
	
	public static int getDiscountedPrice(int price ,int percentage) {
		
		
		return	 (int) ( price*(0.01)*(100-percentage));
		
		
		
		
	}
	
	public static Map<String, Long> getCounts(SessionFactory factory) {
		Session session=factory.openSession();
		
		String q1="Select count(*) from User";
		String q2="Select count(*) from Product";
		
		Query query1=session.createQuery(q1);
		Query query2=session.createQuery(q2);
		Long  userCount=(Long)query1.list().get(0);
		Long productCount=(Long)query2.list().get(0);
		Map<String, Long> map=new HashMap<String, Long>();
		map.put("userCount", userCount);
		map.put("productCount", productCount);
		return map;
		
		
	}
	

}
