package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Category;
import com.entities.Product;

public class ProductDao {

	private SessionFactory factory;

	public ProductDao(SessionFactory sessionFactory) {
		super();
		this.factory = sessionFactory;
	}

	public int saveProduct(Product product) {
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();

		int result = (int) session.save(product);

		tx.commit();

		session.close();
		return result;

	}

	public List<Product> getAllProducts() {
		Session session = this.factory.openSession();

		Query q = session.createQuery("from Product");
		List<Product> products = q.list();

		session.close();
		return products;

	}

	public List<Product> getProductsByCategoryID(int categoryID) {
		Session session = this.factory.openSession();

		Query q = session.createQuery("from Product as p where p.category.categoryID =: categoryID");
		q.setParameter("categoryID", categoryID);
		List<Product> products = q.list();

		session.close();
		return products;

	}

	public Product getProductByProductID(int productID) {
		Session session = this.factory.openSession();

		// Query q = session.createQuery("from Category where categoryID =:categoryID"
		// );
		// q.setParameter("categoryID", categoryID);

		//
		Product product = session.get(Product.class, productID);

		// List<Category> categories = q.list();
		session.close();
		return product;

	}

}
