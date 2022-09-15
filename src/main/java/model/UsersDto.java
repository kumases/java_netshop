package model;


import java.sql.Timestamp;

/**----------------------------------------------------------------------*
 *■■■UserInfoDtoクラス■■■
 *概要：DTO（「user_info」テーブル）
 *----------------------------------------------------------------------**/
public class UsersDto {

	//----------------------------------------------------------------
	//フィールド
	//----------------------------------------------------------------
	private int userId; //ユーザーID
	private String userName; //ユーザー名
	private String name_kana;
	private String nickname;
	private int sex;
	private String birthday;
	private String zipcode;
	private String address;
	private String tell;
	private String email;
	private String passWord; //ユーザーパスワード
	private Timestamp time ; 
	

	//----------------------------------------------------------------
	//getter/setter
	//----------------------------------------------------------------


	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getName_kana() {
		return name_kana;
	}
	public void setName_kana(String name_kana) {
		this.name_kana = name_kana;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}

}
