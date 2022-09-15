package model;

import java.sql.Timestamp;

/**----------------------------------------------------------------------*
 *■■■ItemsDtoクラス■■■
 *概要：DTO（「items」テーブル）
 *----------------------------------------------------------------------**/
public class HistoryDto {

	//----------------------------------------------------------------
	//フィールド
	//----------------------------------------------------------------
	private int id; //履歴ID
	private int user_id; //ユーザーID
	private String item_name; //名前
	private int price; //価格
	private int item_id; //アイテムID
	private int num; //数
	private Timestamp time ;  
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}
	
	
}
