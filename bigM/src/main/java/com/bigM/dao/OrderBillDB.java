package com.bigM.dao;

import javax.servlet.http.HttpSession;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;

public class OrderBillDB {
	String connnectionURL = "mongodb+srv://admin:admin@cluster0.flkeq.mongodb.net/Tanuj?retryWrites=true&w=majority";
    MongoClient mongoClient = MongoClients.create(connnectionURL);
    
    public OrderBillDB() {
    	System.out.println(getClass().getName()+"Connection Created");
	}
    
    public void getLastMonthBill(String userId) {
    	
    }
    
}
