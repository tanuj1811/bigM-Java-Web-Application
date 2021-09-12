package com.bigM.model;

import java.util.ArrayList;
import java.util.List;

public class OrderBill {

	static int n = 1;
	private String _id = "bigM-00a-1k";
	private String userId;
	private String billDate;
	private int totalAmount;
	private int amountPaid;
	
	
	private List<Order> orders = new ArrayList<>();

	public static int getN() {
		return n;
	}

	public static void setN(int n) {
		OrderBill.n = n;
	}

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public int getAmountPaid() {
		return amountPaid;
	}

	public void setAmountPaid(int amountPaid) {
		this.amountPaid = amountPaid;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	
	
	
		
	
	
}
