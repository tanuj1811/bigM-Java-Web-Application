package com.bigM.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


public class User {
	
	String _id;
	
	String name;
	String email;
	String number;
	String shopName;
	String proof;
	String password;
	String address;
	String date;
	
	
	public Map<String,Object> toMap(){
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("email", email);
		map.put("number", number);
		map.put("shopName", shopName);
		map.put("proof", proof);
		map.put("password", password);
		map.put("address", address);
		map.put("date", date);
		return map;
	}
	
	
	
	public User() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
		this.date = simpleDateFormat.format(new Date());
		
	}
	
	public User(String name, String email, String number, String shopName, String proof, String password,
			String address) {
		super();
		this.name = name;
		this.email = email;
		this.number = number;
		this.shopName = shopName;
		this.proof = proof;
		this.password = password;
		this.address = address;

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
		this.date = simpleDateFormat.format(new Date());
		
	}

	
	@Override
	public String toString() {
		return "User [_id=" + _id + ", name=" + name + ", email=" + email + ", number=" + number + ", shopName="
				+ shopName + ", proof=" + proof + ", password=" + password + ", address=" + address + ", date=" + date
				+  "]";
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getProof() {
		return proof;
	}

	public void setProof(String proof) {
		this.proof = proof;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date =  date;
	}
	public String get_id() {
		return _id;
	}



	public void set_id(String _id) {
		this._id = _id;
	}
	
}
