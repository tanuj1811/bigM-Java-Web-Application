package com.bigM.dao;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.bigM.model.Order;
import com.bigM.model.User;
import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

public class UserDB {

	String connnectionURL = "mongodb+srv://admin:admin@cluster0.flkeq.mongodb.net/Tanuj?retryWrites=true&w=majority";
    MongoClient mongoClient = MongoClients.create(connnectionURL);
    
	public UserDB() {
		System.out.println(getClass().getName()+"Connection Created");
	}
	
	public boolean addUser(User user) {
		
		try {
			Document document = new Document(user.toMap());
	        //insert the data
	        mongoClient.getDatabase("bigM").getCollection("User").insertOne(document);
	        System.out.println("data inserted ");
	        return true;
		} catch (Exception e) {
			System.out.println("[ADD_USER]Something went Wrong " + e);
			return false;
		}
	}
	
	public boolean loginUser(String email,String password) {
		BasicDBObject query = new BasicDBObject();
		query.put("email", email);
		query.put("password", password);
		
    	// Fetching the Data
    	MongoCursor<Document> cursor = mongoClient.getDatabase("bigM").getCollection("User").find(query).iterator();
    
    	return cursor.hasNext();
	}
	
	
	public User getUserByEmail(String email) {
		try {
			BasicDBObject query = new BasicDBObject();
			query.put("email",email);
			
	    	// Fetching the Data
	    	MongoCursor<Document> cursor = mongoClient.getDatabase("bigM").getCollection("User").find(query).iterator();
	    	Document obj = cursor.next();
	    	User user = new User();
	    	user.set_id(obj.getObjectId("_id").toString());
	    	user.setName(obj.getString("name"));
	    	user.setEmail(obj.getString("email"));
	    	user.setNumber(obj.getString("number"));
	    	user.setShopName(obj.getString("shopName"));
	    	user.setPassword(obj.getString("password"));
	    	user.setAddress(obj.getString("address"));
	    	user.setDate(obj.getString("date"));
	    	
//	    	MongoCollection<User> users = mongoClient.getDatabase("bigM").getCollection("User",User.class);
//	    	User user = users.find(eq("email", email)).first();
//	    	System.out.println("Grade found:\t" + user);
	    	
	    	System.out.println("Printing from getUserbyemail :: "+user);
	    	return user;
	    	
	    	
		} catch (Exception e) {
			System.out.println(getClass()+"Something went Wrong" +e);
			return null;
		}
	}
	
	public void updatePassword(String newPassword,String userId) {
		try {
		mongoClient.getDatabase("bigM").getCollection("User").updateOne(Filters.eq("_id", new ObjectId(userId)), Updates.set("password", newPassword));
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
}
