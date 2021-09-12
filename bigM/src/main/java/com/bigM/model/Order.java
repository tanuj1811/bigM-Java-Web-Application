package com.bigM.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Order {
	
	private String _id;
	private String userId ;
	private String orderName;
	private String shopName;
	private String orderNumber;
	private String productName;
	private String qty;
	private String description;
	private String orderDate ;
	private String deliveryAddress;
	private String deliveredDate = "NA";
	private String type;
	private int amount;
	boolean isPlaced=false;
	
	public Map<String,Object> toMap(){
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("orderName", orderName);
		map.put("shopName", shopName);
		map.put("orderNumber", orderNumber);
		map.put("productName", productName);
		map.put("qty", qty);
		map.put("description", description);
		map.put("orderDate", orderDate);
		map.put("deliveryAddress", deliveryAddress);
		map.put("isPlaced", isPlaced);
		map.put("deliveredDate", deliveredDate);
		map.put("type", type);
		map.put("amount", amount);
		
		return map;
	}
	
	public Order() {
	}
	
	
	public Order(String userId ,String orderName, String shopName, String orderNumber, String productName, String qty, String type,
			String description, String deliveryAddress) {
		this.userId = userId;
		this.orderName = orderName;
		this.shopName = shopName;
		this.orderNumber = orderNumber;
		this.productName = productName;
		this.qty = qty;
		this.type = type;
		this.description = description;
		this.deliveryAddress = deliveryAddress;
		this.orderDate = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
		this.amount = calculateAmount(type,qty);
	}
	
	private int calculateAmount(String type2, String qty2) {
		int n = Integer.parseInt(type2);
		int amount = 0;
		for(char ch : qty2.toCharArray())
			if(Character.isDigit(ch))
				amount = amount*10 + Integer.parseInt(ch+"");
		System.out.println("******************************************************************************************");
		System.out.println(amount);
		switch(n) {
		case 1:
			amount *= 18;
			break;
		case 2:
			amount *= 50;
			break;
		case 3:
			amount *= 85;
			break;
		case 4:
			amount *= 135;
			break;
		case 5:
			amount *= 160;
			break;
		
		}
		
		return amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Order [_id=" + _id + ", userId=" + userId + ", orderName=" + orderName + ", shopName=" + shopName
				+ ", orderNumber=" + orderNumber + ", productName=" + productName + ", qty=" + qty + ", description="
				+ description + ", orderDate=" + orderDate + ", deliveryAddress=" + deliveryAddress + ", deliveredDate="
				+ deliveredDate + ", type=" + type + ", isPlaced=" + isPlaced + "]";
	}
	
	public String getDeliveredDate() {
		return deliveredDate;
	}

	public void setDeliveredDate(String deliveredDate) {
		this.deliveredDate = deliveredDate;
	}

	public String getOrderId() {
		return userId;
	}

	public void setOrderId(String userId) {
		this.userId = userId;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public boolean isPlaced() {
		return isPlaced;
	}

	public void setIsPlaced(boolean isPlaced) {
		this.isPlaced = isPlaced;
	}
	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
