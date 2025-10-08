package com.app.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	private Map<Integer,CartItem> items=new HashMap<>();;
	private int totalPrice;
	public Cart() {
		
	}
	

	public Map<Integer, CartItem> getItems() {
		return items;
	}


	public void setItems(Map<Integer, CartItem> items) {
		this.items = items;
	}
	 


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public void addItem(CartItem item) {
		int menuId = item.getMenuId();
		if(items.containsKey(menuId)) {
			CartItem existingItem = items.get(menuId);   //get item already exist in cart
			existingItem.setQuantity(existingItem.getQuantity() +item.getQuantity());  //set quantity to (oldquan + newquan) exist item
		}
		else {
			items.put(menuId, item);
		}
	}
	public void updateItem(int itemId,int quantity) {
		if(items.containsKey(itemId)) {
			if(quantity<=0) {
				items.remove(itemId);
			}
			else {
				items.get(itemId).setQuantity(quantity);
			}
		}

	}
	public void removeItem(int itemId) {
		items.remove(itemId);
	}
}

