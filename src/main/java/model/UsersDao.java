package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**----------------------------------------------------------------------*
 *■■■UserInfoDaoクラス■■■
 *概要：DAO（「user_info」テーブル）
 *----------------------------------------------------------------------**/
public class UsersDao {
	//-------------------------------------------
	//データベースへの接続情報
	//-------------------------------------------

	//JDBCドライバの相対パス
	//※バージョンによって変わる可能性があります（MySQL5系の場合は「com.mysql.jdbc.Driver」）
	String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";

	//接続先のデータベース
	//※データベース名が「test_db」でない場合は該当の箇所を変更してください
	String JDBC_URL = "jdbc:mysql://localhost/test_db?characterEncoding=UTF-8&serverTimezone=JST&useSSL=false";

	//接続するユーザー名
	//※ユーザー名が「test_user」でない場合は該当の箇所を変更してください
	String USER_ID = "root";

	//接続するユーザーのパスワード
	//※パスワードが「test_pass」でない場合は該当の箇所を変更してください
	String USER_PASS = "password";

	//----------------------------------------------------------------
	//メソッド
	//----------------------------------------------------------------

	/**----------------------------------------------------------------------*
	 *■doSelectメソッド
	 *概要　：引数のユーザー情報に紐づくユーザーデータを「user_info」テーブルから抽出する
	 *引数①：ユーザーID（ユーザー入力）
	 *引数②：ユーザーパスワード（ユーザー入力）
	 *戻り値：「user_info」テーブルから抽出したユーザーデータ（UserInfoDto型）
	 *----------------------------------------------------------------------**/
	public UsersDto doSelect(String inputUserName, String inputPassWord) {

		//-------------------------------------------
		//JDBCドライバのロード
		//-------------------------------------------
		try {
			Class.forName(DRIVER_NAME); //JDBCドライバをロード＆接続先として指定
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		//-------------------------------------------
		//SQL発行
		//-------------------------------------------

		//JDBCの接続に使用するオブジェクトを宣言
		//※finallyブロックでも扱うためtryブロック内で宣言してはいけないことに注意
		Connection con = null; // Connection（DB接続情報）格納用変数
		PreparedStatement ps = null; // PreparedStatement（SQL発行用オブジェクト）格納用変数
		ResultSet rs = null; // ResultSet（SQL抽出結果）格納用変数

		//抽出データ（UserInfoDto型）格納用変数
		//※最終的にreturnするため、tryブロック内で宣言してはいけないことに注意
		UsersDto dto = new UsersDto();

		try {

			//-------------------------------------------
			//接続の確立（Connectionオブジェクトの取得）
			//-------------------------------------------
			con = DriverManager.getConnection(JDBC_URL, USER_ID, USER_PASS);

			//-------------------------------------------
			//SQL文の送信 ＆ 結果の取得
			//-------------------------------------------

			//発行するSQL文の生成（SELECT）
			StringBuffer buf = new StringBuffer();
			buf.append(" SELECT             ");
			buf.append("   id  ,       ");
			buf.append("   name,       ");
			buf.append("   nickname,       ");
			buf.append("   pass         ");
			buf.append(" FROM               ");
			buf.append("   users        ");
			buf.append(" WHERE              ");
			buf.append("   name  = ? AND "); //第1パラメータ
			buf.append("   pass = ?     "); //第2パラメータ

			//PreparedStatement（SQL発行用オブジェクト）を生成＆発行するSQLをセット
			ps = con.prepareStatement(buf.toString());

			//パラメータをセット
			ps.setString(1, inputUserName); //第1パラメータ：ユーザーネーム（ユーザー入力）
			ps.setString(2, inputPassWord); //第2パラメータ：ユーザーパスワード（ユーザー入力）

			//SQL文の送信＆戻り値としてResultSet（SQL抽出結果）を取得
			rs = ps.executeQuery();

			//--------------------------------------------------------------------------------
			//ResultSetオブジェクトからユーザーデータを抽出
			//--------------------------------------------------------------------------------
			if (rs.next()) {
				//ResultSetから1行分のレコード情報をDTOへ登録
				dto.setUserId(rs.getInt("id")); //ユーザーID
				dto.setUserName(rs.getString("name")); //ユーザー名
				dto.setNickname(rs.getString("nickname")); //表示名
				dto.setPassWord(rs.getString("pass")); //ユーザーパスワード
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			//-------------------------------------------
			//接続の解除
			//-------------------------------------------

			//ResultSetオブジェクトの接続解除
			if (rs != null) { //接続が確認できている場合のみ実施
				try {
					rs.close(); //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			//PreparedStatementオブジェクトの接続解除
			if (ps != null) { //接続が確認できている場合のみ実施
				try {
					ps.close(); //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			//Connectionオブジェクトの接続解除
			if (con != null) { //接続が確認できている場合のみ実施
				try {
					con.close(); //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		//抽出したユーザーデータを戻す
		return dto;
	}
	
	public boolean doInsert(UsersDto dto) {

		//-------------------------------------------
		//JDBCドライバのロード
		//-------------------------------------------
		try {
			Class.forName(DRIVER_NAME);       //JDBCドライバをロード＆接続先として指定
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		//-------------------------------------------
		//SQL発行
		//-------------------------------------------

		//JDBCの接続に使用するオブジェクトを宣言
		//※finallyブロックでも扱うためtryブロック内で宣言してはいけないことに注意
		Connection        con = null ;   // Connection（DB接続情報）格納用変数
		PreparedStatement ps  = null ;   // PreparedStatement（SQL発行用オブジェクト）格納用変数

		//実行結果（真：成功、偽：例外発生）格納用変数
		//※最終的にreturnするため、tryブロック内で宣言してはいけないことに注意
		boolean isSuccess = true ;

		try {

			//-------------------------------------------
			//接続の確立（Connectionオブジェクトの取得）
			//-------------------------------------------
			con = DriverManager.getConnection(JDBC_URL, USER_ID, USER_PASS);

			//-------------------------------------------
			//トランザクションの開始
			//-------------------------------------------
			//オートコミットをオフにする（トランザクション開始）
			con.setAutoCommit(false);

			//-------------------------------------------
			//SQL文の送信 ＆ 結果の取得
			//-------------------------------------------

			//発行するSQL文の生成（INSERT）
			StringBuffer buf = new StringBuffer();
			buf.append("INSERT INTO users (  ");
			buf.append("  name,               ");
			buf.append("  name_kana,                ");
			buf.append("  nickname,                ");
			buf.append("  sex, ");
			buf.append("  birthday,            ");
			buf.append("  zipcode,                ");
			buf.append("  address,                ");
			buf.append("  tell,                ");
			buf.append("  email,                ");
			buf.append("  pass,                ");
			buf.append("  created                ");
			buf.append(") VALUES (            ");
			buf.append("  ?,                  ");
			buf.append("  ?,                  ");
			buf.append("  ?,                  ");
			buf.append("  ?,                  ");
			buf.append("  ?,                  ");
			buf.append("  ?,                  ");
			buf.append("  ?,                  ");
			buf.append("  ?,                  ");
			buf.append("  ?,                  ");
			buf.append("  ?,                  ");
			buf.append("  ?                   ");
			buf.append(")                     ");
			Date sqlDate = null;
			if(dto.getBirthday().length() != 0 && dto.getBirthday() !=null) {
					Date.valueOf(dto.getBirthday()  );
			}
			//PreparedStatementオブジェクトを生成＆発行するSQLをセット
			ps = con.prepareStatement(buf.toString());

			//パラメータをセット
			ps.setString(    1, dto.getUserName()              );
			ps.setString(    2, dto.getName_kana()              );
			ps.setString(    3, dto.getNickname()              );
			ps.setInt(       4, dto.getSex()               );
			ps.setDate(    5, sqlDate             );
			ps.setString(    6, dto.getZipcode()              );
			ps.setString(    7, dto.getAddress()              );
			ps.setString(    8, dto.getTell()              );
			ps.setString(    9, dto.getEmail()              );
			ps.setString(    10, dto.getPassWord()              );
			ps.setTimestamp( 11, dto.getTime()              ); 

			//SQL文の実行
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

			//実行結果を例外発生として更新
			isSuccess = false ;

		} finally {
			//-------------------------------------------
			//トランザクションの終了
			//-------------------------------------------
			if(isSuccess){
				//明示的にコミットを実施
				try {
					con.commit();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}else{
				//明示的にロールバックを実施
				try {
					con.rollback();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			//-------------------------------------------
			//接続の解除
			//-------------------------------------------

			//PreparedStatementオブジェクトの接続解除
			if (ps != null) {    //接続が確認できている場合のみ実施
				try {
					ps.close();  //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			//Connectionオブジェクトの接続解除
			if (con != null) {    //接続が確認できている場合のみ実施
				try {
					con.close();  //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

		//実行結果を返す
		return isSuccess;
	}
	
	public List<UsersDto> doSelectInfo(int id) {

		//-------------------------------------------
		//JDBCドライバのロード
		//-------------------------------------------
		try {
			Class.forName(DRIVER_NAME); //JDBCドライバをロード＆接続先として指定
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		//-------------------------------------------
		//SQL発行
		//-------------------------------------------

		//JDBCの接続に使用するオブジェクトを宣言
		//※finallyブロックでも扱うためtryブロック内で宣言してはいけないことに注意
		Connection con = null; // Connection（DB接続情報）格納用変数
		PreparedStatement ps = null; // PreparedStatement（SQL発行用オブジェクト）格納用変数
		ResultSet rs = null; // ResultSet（SQL抽出結果）格納用変数

		//抽出データ（UserInfoDto型）格納用変数
		//※最終的にreturnするため、tryブロック内で宣言してはいけないことに注意
		List<UsersDto> dtoList = new ArrayList<UsersDto>();

		try {

			//-------------------------------------------
			//接続の確立（Connectionオブジェクトの取得）
			//-------------------------------------------
			con = DriverManager.getConnection(JDBC_URL, USER_ID, USER_PASS);

			//-------------------------------------------
			//SQL文の送信 ＆ 結果の取得
			//-------------------------------------------

			//発行するSQL文の生成（SELECT）
			StringBuffer buf = new StringBuffer();
			buf.append(" SELECT             ");
			buf.append("   id  ,       ");
			buf.append("   name,       ");
			buf.append("   name_kana,       ");
			buf.append("   nickname,       ");
			buf.append("   sex,       ");
			buf.append("   birthday,       ");
			buf.append("   zipcode,       ");
			buf.append("   address,       ");
			buf.append("   tell,       ");
			buf.append("   email,       ");
			buf.append("   pass,         ");
			buf.append("   created       ");
			buf.append(" FROM               ");
			buf.append("   users        ");
			buf.append(" WHERE              ");
			buf.append("   id  = ? ");


			//PreparedStatement（SQL発行用オブジェクト）を生成＆発行するSQLをセット
			ps = con.prepareStatement(buf.toString());

			//パラメータをセット
			ps.setInt(1,id);
			//SQL文の送信＆戻り値としてResultSet（SQL抽出結果）を取得
			rs = ps.executeQuery();

			//--------------------------------------------------------------------------------
			//ResultSetオブジェクトからユーザーデータを抽出
			//--------------------------------------------------------------------------------
			if (rs.next()) {
				//ResultSetから1行分のレコード情報をDTOへ登録
				UsersDto dto = new UsersDto();
				dto.setUserId(rs.getInt("id"));
				dto.setUserName(rs.getString("name"));
				dto.setName_kana(rs.getString("name_kana"));
				dto.setNickname(rs.getString("nickname"));
				dto.setSex(rs.getInt("sex"));
				dto.setBirthday(rs.getString("birthday"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress(rs.getString("address"));
				dto.setTell(rs.getString("tell"));
				dto.setEmail(rs.getString("Email"));
				dto.setPassWord(rs.getString("pass"));
				dto.setTime(rs.getTimestamp( "created") );
				dtoList.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			//-------------------------------------------
			//接続の解除
			//-------------------------------------------

			//ResultSetオブジェクトの接続解除
			if (rs != null) { //接続が確認できている場合のみ実施
				try {
					rs.close(); //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			//PreparedStatementオブジェクトの接続解除
			if (ps != null) { //接続が確認できている場合のみ実施
				try {
					ps.close(); //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			//Connectionオブジェクトの接続解除
			if (con != null) { //接続が確認できている場合のみ実施
				try {
					con.close(); //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return dtoList;
	}
	
	public List<UsersDto> doSelectInfoAll() {

		//-------------------------------------------
		//JDBCドライバのロード
		//-------------------------------------------
		try {
			Class.forName(DRIVER_NAME); //JDBCドライバをロード＆接続先として指定
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		//-------------------------------------------
		//SQL発行
		//-------------------------------------------

		//JDBCの接続に使用するオブジェクトを宣言
		//※finallyブロックでも扱うためtryブロック内で宣言してはいけないことに注意
		Connection con = null; // Connection（DB接続情報）格納用変数
		PreparedStatement ps = null; // PreparedStatement（SQL発行用オブジェクト）格納用変数
		ResultSet rs = null; // ResultSet（SQL抽出結果）格納用変数

		//抽出データ（UserInfoDto型）格納用変数
		//※最終的にreturnするため、tryブロック内で宣言してはいけないことに注意
		List<UsersDto> dtoList = new ArrayList<UsersDto>();

		try {

			//-------------------------------------------
			//接続の確立（Connectionオブジェクトの取得）
			//-------------------------------------------
			con = DriverManager.getConnection(JDBC_URL, USER_ID, USER_PASS);

			//-------------------------------------------
			//SQL文の送信 ＆ 結果の取得
			//-------------------------------------------

			//発行するSQL文の生成（SELECT）
			StringBuffer buf = new StringBuffer();
			buf.append(" SELECT             ");
			buf.append("   id  ,       ");
			buf.append("   name,       ");
			buf.append("   name_kana,       ");
			buf.append("   nickname,       ");
			buf.append("   sex,       ");
			buf.append("   birthday,       ");
			buf.append("   zipcode,       ");
			buf.append("   address,       ");
			buf.append("   tell,       ");
			buf.append("   email,       ");
			buf.append("   pass,         ");
			buf.append("   created       ");
			buf.append(" FROM               ");
			buf.append("   users        ");



			//PreparedStatement（SQL発行用オブジェクト）を生成＆発行するSQLをセット
			ps = con.prepareStatement(buf.toString());

			//SQL文の送信＆戻り値としてResultSet（SQL抽出結果）を取得
			rs = ps.executeQuery();

			//--------------------------------------------------------------------------------
			//ResultSetオブジェクトからユーザーデータを抽出
			//--------------------------------------------------------------------------------
			while (rs.next()) {
				UsersDto dto = new UsersDto();
				dto.setUserId(rs.getInt("id"));
				dto.setUserName(rs.getString("name"));
				dto.setName_kana(rs.getString("name_kana"));
				dto.setNickname(rs.getString("nickname"));
				dto.setSex(rs.getInt("sex"));
				dto.setBirthday(rs.getString("birthday"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress(rs.getString("address"));
				dto.setTell(rs.getString("tell"));
				dto.setEmail(rs.getString("Email"));
				dto.setPassWord(rs.getString("pass"));
				dto.setTime(rs.getTimestamp( "created") );
				dtoList.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			//-------------------------------------------
			//接続の解除
			//-------------------------------------------

			//ResultSetオブジェクトの接続解除
			if (rs != null) { //接続が確認できている場合のみ実施
				try {
					rs.close(); //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			//PreparedStatementオブジェクトの接続解除
			if (ps != null) { //接続が確認できている場合のみ実施
				try {
					ps.close(); //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			//Connectionオブジェクトの接続解除
			if (con != null) { //接続が確認できている場合のみ実施
				try {
					con.close(); //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return dtoList;
	}
	
	public boolean doUpdate(UsersDto dto) {

		//-------------------------------------------
		//JDBCドライバのロード
		//-------------------------------------------
		try {
			Class.forName(DRIVER_NAME);       //JDBCドライバをロード＆接続先として指定
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		//-------------------------------------------
		//SQL発行
		//-------------------------------------------

		//JDBCの接続に使用するオブジェクトを宣言
		//※finallyブロックでも扱うためtryブロック内で宣言してはいけないことに注意
		Connection        con = null ;   // Connection（DB接続情報）格納用変数
		PreparedStatement ps  = null ;   // PreparedStatement（SQL発行用オブジェクト）格納用変数

		//実行結果（真：成功、偽：例外発生）格納用変数
		//※最終的にreturnするため、tryブロック内で宣言してはいけないことに注意
		boolean isSuccess = true ;

		try {

			//-------------------------------------------
			//接続の確立（Connectionオブジェクトの取得）
			//-------------------------------------------
			con = DriverManager.getConnection(JDBC_URL, USER_ID, USER_PASS);

			//-------------------------------------------
			//トランザクションの開始
			//-------------------------------------------
			//オートコミットをオフにする（トランザクション開始）
			con.setAutoCommit(false);

			//-------------------------------------------
			//SQL文の送信 ＆ 結果の取得
			//-------------------------------------------

			//発行するSQL文の生成（INSERT）
			StringBuffer buf = new StringBuffer();
			buf.append("UPDATE  users SET   ");
			buf.append("  name = ? ,               ");
			buf.append("  name_kana = ? ,                ");
			buf.append("  nickname = ?,                ");
			buf.append("  sex = ?, ");
			buf.append("  birthday = ?,            ");
			buf.append("  zipcode = ? ,                ");
			buf.append("  address = ? ,                ");
			buf.append("  tell = ? ,                ");
			buf.append("  email = ?               ");
			buf.append(" WHERE           ");
			buf.append("  id = ?                 ");
			Date sqlDate = null;
			if(dto.getBirthday().length() != 0 && dto.getBirthday() !=null) {
					Date.valueOf(dto.getBirthday()  );
			}
			//PreparedStatementオブジェクトを生成＆発行するSQLをセット
			ps = con.prepareStatement(buf.toString());

			//パラメータをセット
			ps.setString(    1, dto.getUserName()              );
			ps.setString(    2, dto.getName_kana()              );
			ps.setString(    3, dto.getNickname()              );
			ps.setInt(       4, dto.getSex()               );
			ps.setDate(    5, sqlDate             );
			ps.setString(    6, dto.getZipcode()              );
			ps.setString(    7, dto.getAddress()              );
			ps.setString(    8, dto.getTell()              );
			ps.setString(    9, dto.getEmail()              );
			ps.setInt(       10, dto.getUserId()               );

			//SQL文の実行
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

			//実行結果を例外発生として更新
			isSuccess = false ;

		} finally {
			//-------------------------------------------
			//トランザクションの終了
			//-------------------------------------------
			if(isSuccess){
				//明示的にコミットを実施
				try {
					con.commit();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}else{
				//明示的にロールバックを実施
				try {
					con.rollback();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			//-------------------------------------------
			//接続の解除
			//-------------------------------------------

			//PreparedStatementオブジェクトの接続解除
			if (ps != null) {    //接続が確認できている場合のみ実施
				try {
					ps.close();  //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			//Connectionオブジェクトの接続解除
			if (con != null) {    //接続が確認できている場合のみ実施
				try {
					con.close();  //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}
		//実行結果を返す
		return isSuccess;
	}
	
	public boolean doUpdatePass(UsersDto dto) {

		//-------------------------------------------
		//JDBCドライバのロード
		//-------------------------------------------
		try {
			Class.forName(DRIVER_NAME);       //JDBCドライバをロード＆接続先として指定
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		//JDBCの接続に使用するオブジェクトを宣言
		//※finallyブロックでも扱うためtryブロック内で宣言してはいけないことに注意
		Connection        con = null ;   // Connection（DB接続情報）格納用変数
		PreparedStatement ps  = null ;   // PreparedStatement（SQL発行用オブジェクト）格納用変数

		//実行結果（真：成功、偽：例外発生）格納用変数
		//※最終的にreturnするため、tryブロック内で宣言してはいけないことに注意
		boolean isSuccess = true ;

		try {

			//-------------------------------------------
			//接続の確立（Connectionオブジェクトの取得）
			//-------------------------------------------
			con = DriverManager.getConnection(JDBC_URL, USER_ID, USER_PASS);

			//-------------------------------------------
			//トランザクションの開始
			//-------------------------------------------
			//オートコミットをオフにする（トランザクション開始）
			con.setAutoCommit(false);

			//-------------------------------------------
			//SQL文の送信 ＆ 結果の取得
			//-------------------------------------------

			//発行するSQL文の生成（INSERT）
			StringBuffer buf = new StringBuffer();
			buf.append("UPDATE  users SET   ");
			buf.append("  pass = ?               ");
			buf.append(" WHERE           ");
			buf.append("  id = ?                 ");
			//PreparedStatementオブジェクトを生成＆発行するSQLをセット
			ps = con.prepareStatement(buf.toString());


			//パラメータをセット
			ps.setString(    1, dto.getPassWord()              );
			ps.setInt(       2, dto.getUserId()               );
			//SQL文の実行
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

			//実行結果を例外発生として更新
			isSuccess = false ;

		} finally {
			//-------------------------------------------
			//トランザクションの終了
			//-------------------------------------------
			if(isSuccess){
				//明示的にコミットを実施
				try {
					con.commit();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}else{
				//明示的にロールバックを実施
				try {
					con.rollback();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			//-------------------------------------------
			//接続の解除
			//-------------------------------------------

			//PreparedStatementオブジェクトの接続解除
			if (ps != null) {    //接続が確認できている場合のみ実施
				try {
					ps.close();  //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			//Connectionオブジェクトの接続解除
			if (con != null) {    //接続が確認できている場合のみ実施
				try {
					con.close();  //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}
		//実行結果を返す
		return isSuccess;
	}
	
	public boolean doDelete(int user_id) {


		//-------------------------------------------
		//JDBCドライバのロード
		//-------------------------------------------
		try {
			Class.forName(DRIVER_NAME);       //JDBCドライバをロード＆接続先として指定
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		//-------------------------------------------
		//SQL発行
		//-------------------------------------------

		//JDBCの接続に使用するオブジェクトを宣言
		Connection        con = null ;   // Connection（DB接続情報）格納用変数
		PreparedStatement ps  = null ;   // PreparedStatement（SQL発行用オブジェクト）格納用変数
		ResultSet         rs  = null ;   // ResultSet（SQL抽出結果）格納用変数

		
		boolean isSuccess = true ;
		try {
			//-------------------------------------------
			//接続の確立（Connectionオブジェクトの取得）
			//-------------------------------------------
			con = DriverManager.getConnection(JDBC_URL, USER_ID, USER_PASS);

			//-------------------------------------------
			//SQL文の送信 ＆ 結果の取得
			//-------------------------------------------

			//発行するSQL文の生成（SELECT）
			StringBuffer buf = new StringBuffer();
			buf.append("delete  from                ");
			buf.append("  users                ");
			buf.append("  where                ");
			buf.append("  id = ?              ");

			ps = con.prepareStatement(buf.toString());
			ps.setInt(       1, user_id );
			ps.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//-------------------------------------------
			//接続の解除
			//-------------------------------------------

			//ResultSetオブジェクトの接続解除
			if (rs != null) {    //接続が確認できている場合のみ実施
				try {
					rs.close();  //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			//PreparedStatementオブジェクトの接続解除
			if (ps != null) {    //接続が確認できている場合のみ実施
				try {
					ps.close();  //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			//Connectionオブジェクトの接続解除
			if (con != null) {    //接続が確認できている場合のみ実施
				try {
					con.close();  //接続の解除
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return isSuccess;
	}
}
