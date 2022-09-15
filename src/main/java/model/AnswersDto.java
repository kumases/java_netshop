package model;

import java.sql.Timestamp;

/**----------------------------------------------------------------------*
 *■■■ItemsDtoクラス■■■
 *概要：DTO（「inquery」テーブル）
 *----------------------------------------------------------------------**/
public class AnswersDto {

	//----------------------------------------------------------------
	//フィールド
	//----------------------------------------------------------------

	private int id; 
	private int inquery_id;
	private String message;
	private Timestamp time ;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getInquery_id() {
		return inquery_id;
	}
	public void setInquery_id(int inquery_id) {
		this.inquery_id = inquery_id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	
	
}
