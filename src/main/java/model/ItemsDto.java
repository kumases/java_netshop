package model;

import java.sql.Timestamp;

/**----------------------------------------------------------------------*
 *■■■ItemsDtoクラス■■■
 *概要：DTO（「items」テーブル）
 *----------------------------------------------------------------------**/
public class ItemsDto {

	//----------------------------------------------------------------
	//フィールド
	//----------------------------------------------------------------
	private int id; //アイテムID
	private String name; //名前
	private int price; //価格
	private int stock; //在庫
	private String setumei; //説明
	private String syousai; //詳細
	private String picture; //画像
	private Timestamp time ;  
	//----------------------------------------------------------------
	//getter/setter
	//----------------------------------------------------------------

	//getter/setter（対象フィールド：id）
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	//getter/setter（対象フィールド：Name）
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	//getter/setter（対象フィールド：passWord）
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock (int stock) {
		this.stock = stock;
	}

	public String getSetumei() {
		return setumei;
	}

	public void setSetumei(String setumei) {
		this.setumei = setumei;
	}

	public String getSyousai() {
		return syousai;
	}

	public void setSyousai(String syousai) {
		this.syousai = syousai;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}
}
