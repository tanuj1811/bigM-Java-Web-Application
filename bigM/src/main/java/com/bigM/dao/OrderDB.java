
package com.bigM.dao;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.bigM.model.Order;
import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

public class OrderDB {
	String connnectionURL = "mongodb+srv://admin:admin@cluster0.flkeq.mongodb.net/Tanuj?retryWrites=true&w=majority";
    MongoClient mongoClient = MongoClients.create(connnectionURL);
    
	public OrderDB() {
		System.out.println(getClass().getName()+"Connection Created");
	}
	
	public boolean addOrder(Order order) {
		
		try {
			Document document = new Document(order.toMap());
	        //insert the data
	        mongoClient.getDatabase("bigM").getCollection("Order").insertOne(document);
	        System.out.println("data inserted ");
	        return true;
		} catch (Exception e) {
			System.out.println("[ADD_USER]Something went Wrong " + e);
			return false;
		}
	}
	
	public List<Order> getAllOrders(){
		List<Order> orders = new ArrayList<>();
		try {
			MongoCursor<Document> cursor2 = mongoClient.getDatabase("bigM").getCollection("Order").find().iterator();
			System.out.println("********************");
			while(cursor2.hasNext())
			System.out.println(cursor2.next().toJson());
			
			System.out.println("********************");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return orders;
	}
	
	public Order getOrderByOrderId(String orderId) {
		try {
			System.out.println(getClass()+" "+orderId);
			BasicDBObject query = new BasicDBObject();
			query.put("_id", new ObjectId(orderId));
			MongoCursor<Document> cursor = mongoClient.getDatabase("bigM").getCollection("Order").find(query).iterator();
			Document document = cursor.next();
			Order order = new Order();
    		order.set_id(document.getObjectId("_id").toString());
    		order.setUserId(document.getString("userId")); 
    		order.setOrderName(document.getString("orderName")); 
    		order.setShopName(document.getString("shopName")); 
    		order.setOrderNumber(document.getString("orderNumber")); 
    		order.setProductName(document.getString("productName")); 
    		order.setQty(document.getString("qty")); 
    		order.setDescription(document.getString("description")); 
    		order.setOrderDate(document.getString("orderDate")); 
    		order.setDeliveryAddress(document.getString("deliveryAddress")); 
    		order.setIsPlaced(document.getBoolean("isPlaced"));
    		order.setType(document.getString("type"));
//    		order.setAmount(document.getInteger("amount"));
    		
    		System.out.println(getClass()+" ::" +order);
    		return order;
		} catch (Exception e) {
			System.out.println(getClass()+"something went wrong" + e);
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Order> getOrdersByUserId(String userId){
		List<Order> orders = new ArrayList<>();
		
		try {
			BasicDBObject query = new BasicDBObject();
			query.put("userId", userId);
			
	    	MongoCursor<Document> cursor = mongoClient.getDatabase("bigM").getCollection("Order").find(query).iterator();
	    	while(cursor.hasNext()) {
	    		Document document = cursor.next();
	    		Order order = new Order();
	    		order.set_id(document.getObjectId("_id").toString());
	    		order.setUserId(document.getString("userId")); 
	    		order.setOrderName(document.getString("orderName")); 
	    		order.setShopName(document.getString("shopName")); 
	    		order.setOrderNumber(document.getString("orderNumber")); 
	    		order.setProductName(document.getString("productName")); 
	    		order.setQty(document.getString("qty")); 
	    		order.setDescription(document.getString("description")); 
	    		order.setOrderDate(document.getString("orderDate")); 
	    		order.setDeliveryAddress(document.getString("deliveryAddress")); 
	    		order.setIsPlaced(document.getBoolean("isPlaced"));
	    		order.setType(document.getString("type"));
//	    		order.setAmount(document.getInteger("amount"));
	    		
	    		orders.add(order);
	    	}
		} catch (Exception e) {
			System.out.println(getClass()+"something went wrong" + e);
		}
		
		return orders;
	}
	
	public List<Order> getNonPlacedOrdersByUserId(String userId){
		List<Order> orders = new ArrayList<Order>();
		
		for(Order order: getOrdersByUserId(userId))
			if(!order.isPlaced())
				orders.add(order);

		return orders;
	}
	
	public List<Order> getPlacedOrdersByUserId(String userId){
		List<Order> orders = new ArrayList<Order>();
		
		for(Order order: getOrdersByUserId(userId))
			if(order.isPlaced())
				orders.add(order);

		return orders;
	}
	
	
	public void updateOrderByOrderId(Order newOrder,String orderId) {
		
		System.out.println(getClass()+"[new order] :: " + newOrder);
    	
    	//Updating in the DataBase
    	mongoClient.getDatabase("bigM").getCollection("Order").updateOne(Filters.eq("_id", new ObjectId(orderId)), Updates.combine(
    																											Updates.set("orderName", newOrder.getOrderName()),
    																											Updates.set("shopName", newOrder.getShopName()),
    																											Updates.set("orderNumber", newOrder.getOrderNumber()),
    																											Updates.set("productName", newOrder.getProductName()),
    																											Updates.set("qty", newOrder.getQty()),
    																											Updates.set("description", newOrder.getDescription()),
    																											Updates.set("deliveryAddress", newOrder.getDeliveryAddress())
    																											
    																										));
    	System.out.println(getClass()+"Order Updated");
	}
	
	public void deleteOrderByOrderId(String orderId) {
		BasicDBObject query = new BasicDBObject();
		query.put("_id", new ObjectId(orderId));
		
    	mongoClient.getDatabase("bigM").getCollection("Order").deleteOne(query);
    	System.out.println(getClass() + "DELeted...");
	}
	
	public List<Order> findByProductNameContaining(String productName,String userId){
		List<Order> orders = new ArrayList<Order>();
		for(Order order:getOrdersByUserId(userId))
			if(order.getProductName().contains(productName))
				orders.add(order);

		return orders;
	}
	
}
