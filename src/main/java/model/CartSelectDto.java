package model;

import java.sql.Timestamp;

/**----------------------------------------------------------------------*
 *■■■ItemsDtoクラス■■■
 *概要：DTO（「items」テーブル）
 *----------------------------------------------------------------------**/
public class CartSelectDto {

	//----------------------------------------------------------------
	//フィールド
	//----------------------------------------------------------------

	private int cart_id; //アイテムID
	private int cart_user_id;
	private int cart_item_id;
	private int cart_number;
	private String items_name;
	private int items_price;
	private int items_stock;
	private String items_picture;
	private Timestamp time ;  
	
	
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getCart_user_id() {
		return cart_user_id;
	}
	public void setCart_user_id(int cart_user_id) {
		this.cart_user_id = cart_user_id;
	}
	public int getCart_item_id() {
		return cart_item_id;
	}
	public void setCart_item_id(int cart_item_id) {
		this.cart_item_id = cart_item_id;
	}
	public int getCart_number() {
		return cart_number;
	}
	public void setCart_number(int cart_number) {
		this.cart_number = cart_number;
	}
	public String getItems_name() {
		return items_name;
	}
	public void setItems_name(String items_name) {
		this.items_name = items_name;
	}
	public int getItems_price() {
		return items_price;
	}
	public void setItems_price(int items_price) {
		this.items_price = items_price;
	}
	public int getItems_stock() {
		return items_stock;
	}
	public void setItems_stock(int items_stock) {
		this.items_stock = items_stock;
	}
	public String getItems_picture() {
		return items_picture;
	}
	public void setItems_picture(String items_picture) {
		this.items_picture = items_picture;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}



}
