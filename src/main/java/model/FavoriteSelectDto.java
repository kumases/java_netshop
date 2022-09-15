package model;

import java.sql.Timestamp;

/**----------------------------------------------------------------------*
 *■■■ItemsDtoクラス■■■
 *概要：DTO（「items」テーブル）
 *----------------------------------------------------------------------**/
public class FavoriteSelectDto {

	//----------------------------------------------------------------
	//フィールド
	//----------------------------------------------------------------

	private int favorite_id; //アイテムID
	private int favorite_user_id;
	private int favorite_item_id;
	private String items_name;
	private int items_price;
	private int items_stock;
	private String items_picture;
	private Timestamp time ;
	
	
	public int getFavorite_id() {
		return favorite_id;
	}
	public void setFavorite_id(int favorite_id) {
		this.favorite_id = favorite_id;
	}
	public int getFavorite_user_id() {
		return favorite_user_id;
	}
	public void setFavorite_user_id(int favorite_user_id) {
		this.favorite_user_id = favorite_user_id;
	}
	public int getFavorite_item_id() {
		return favorite_item_id;
	}
	public void setFavorite_item_id(int favorite_item_id) {
		this.favorite_item_id = favorite_item_id;
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
