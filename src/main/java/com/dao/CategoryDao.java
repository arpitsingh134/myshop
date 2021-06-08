package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Category;

public class CategoryDao {

	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		this.factory = factory;
	}

	public int saveCategory(Category category) {
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();

		int result = (int) session.save(category);

		tx.commit();

		session.close();
		return result;

	}

	public List<Category> getAllCategory() {
		Session session = this.factory.openSession();

		Query q = session.createQuery("from Category");
		List<Category> categories = q.list();

		session.close();
		return categories;

	}

	public Category getCategoryByID(int categoryID) {
		Session session = this.factory.openSession();

		// Query q = session.createQuery("from Category where categoryID =:categoryID"
		// );
		// q.setParameter("categoryID", categoryID);

		//
		Category category = session.get(Category.class, categoryID);

		// List<Category> categories = q.list();
		session.close();
		return category;

	}

	/*
	 * public User getUserByEmailAndPassword(String userEmail, String userPassword)
	 * {
	 * 
	 * User user = null;
	 * 
	 * try { Session session = this.factory.openSession();
	 * 
	 * String hql =
	 * "FROM  User u where u.userEmail=:userEmail and u.userPassword=:userPassword";
	 * Query query = session.createQuery(hql); query.setParameter("userEmail",
	 * userEmail); query.setParameter("userPassword", userPassword);
	 * user=(User)query.uniqueResult();
	 * 
	 * 
	 * session.close(); } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * // TODO Auto-generated method stub return user; }
	 */

}
