package model;

import java.sql.Timestamp;

/**----------------------------------------------------------------------*
 *■■■ItemsDtoクラス■■■
 *概要：DTO（「items」テーブル）
 *----------------------------------------------------------------------**/
public class ReviewsSelectDto {

	//----------------------------------------------------------------
	//フィールド
	//----------------------------------------------------------------

	private int reviews_id;
	private int reviews_user_id;
	private int reviews_item_id;
	private String reviews_comment;
	private int reviews_star;
	private String users_name;
	private String users_nickname;
	private String items_name ;
	private String items_picture;
	private Timestamp createdtime ;
	private Timestamp deletedtime ;
	
	
	public int getReviews_id() {
		return reviews_id;
	}
	public void setReviews_id(int reviews_id) {
		this.reviews_id = reviews_id;
	}
	public int getReviews_user_id() {
		return reviews_user_id;
	}
	public void setReviews_user_id(int reviews_user_id) {
		this.reviews_user_id = reviews_user_id;
	}
	public int getReviews_item_id() {
		return reviews_item_id;
	}
	public void setReviews_item_id(int reviews_item_id) {
		this.reviews_item_id = reviews_item_id;
	}
	public String getReviews_comment() {
		return reviews_comment;
	}
	public void setReviews_comment(String reviews_comment) {
		this.reviews_comment = reviews_comment;
	}
	public int getReviews_star() {
		return reviews_star;
	}
	public void setReviews_star(int reviews_star) {
		this.reviews_star = reviews_star;
	}
	public String getUsers_nickname() {
		return users_nickname;
	}
	public void setUsers_nickname(String users_nickname) {
		this.users_nickname = users_nickname;
	}
	public String getUsers_name() {
		return users_name;
	}
	public void setUsers_name(String users_name) {
		this.users_name = users_name;
	}
	public String getItems_name() {
		return items_name;
	}
	public void setItems_name(String items_name) {
		this.items_name = items_name;
	}
	public String getItems_picture() {
		return items_picture;
	}
	public void setItems_picture(String items_picture) {
		this.items_picture = items_picture;
	}
	public Timestamp getCreatedtime() {
		return createdtime;
	}
	public void setCreatedtime(Timestamp createdtime) {
		this.createdtime = createdtime;
	}
	public Timestamp getDeletedtime() {
		return deletedtime;
	}
	public void setDeletedtime(Timestamp deletedtime) {
		this.deletedtime = deletedtime;
	}
	
	

}
