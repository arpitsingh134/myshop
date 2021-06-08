package com.helper;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

	public static SessionFactory factory;


	public static SessionFactory getFactory() {

		try {
			if (factory == null) {

				factory = new Configuration().configure("hibernet.cfg.xml").buildSessionFactory();

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return factory;

	}

	public static  void closeFactory() {
		if (factory.isOpen()) {
			factory.close();
		}
	}

}
