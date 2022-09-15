package model;

import java.sql.Timestamp;

/**----------------------------------------------------------------------*
 *■■■ItemsDtoクラス■■■
 *概要：DTO（「inquery」テーブル）
 *----------------------------------------------------------------------**/
public class InqueriesDto {

	//----------------------------------------------------------------
	//フィールド
	//----------------------------------------------------------------

	private int id; 
	private String email;
	private String inquery_post; 
	private String name;
	private int user_id;
	private Timestamp time ;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getInquery_post() {
		return inquery_post;
	}
	public void setInquery_post(String inquery_post) {
		this.inquery_post = inquery_post;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}  


}
