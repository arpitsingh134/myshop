package com.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.User;


public class UserDao {

	private SessionFactory factory;

	public UserDao(SessionFactory sessionFactory) {
		this.factory = sessionFactory;
	}

	public  int saveUser(User user) {
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();

		int result = (int) session.save(user);

		tx.commit();

		session.close();
		return result;

	}

	public User getUserByEmailAndPassword(String userEmail, String userPassword) {

		User user = null;

		try {
			Session session = this.factory.openSession();

			String hql = "FROM  User u where u.userEmail=:userEmail and u.userPassword=:userPassword";
			Query query = session.createQuery(hql);
			query.setParameter("userEmail", userEmail);
			query.setParameter("userPassword", userPassword);
			user=(User)query.uniqueResult();
			
			
			session.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// TODO Auto-generated method stub
		return user;
	}

}
