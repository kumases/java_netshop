package model;

import java.sql.Timestamp;

/**----------------------------------------------------------------------*
 *■■■ItemsDtoクラス■■■
 *概要：DTO（「inquery」テーブル）
 *----------------------------------------------------------------------**/
public class InqueriesAndAnswerDto {

	//----------------------------------------------------------------
	//フィールド
	//----------------------------------------------------------------

	private int id; 
	private String email;
	private String inquery_post; 
	private String name;
	private int user_id;
	private Timestamp inquery_time ;
	private String message;
	private int inquery_id;
	private Timestamp answer_time ;
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
	public Timestamp getInquery_time() {
		return inquery_time;
	}
	public void setInquery_time(Timestamp inquery_time) {
		this.inquery_time = inquery_time;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getInquery_id() {
		return inquery_id;
	}
	public void setInquery_id(int inquery_id) {
		this.inquery_id = inquery_id;
	}
	public Timestamp getAnswer_time() {
		return answer_time;
	}
	public void setAnswer_time(Timestamp answer_time) {
		this.answer_time = answer_time;
	}
	
	

}
