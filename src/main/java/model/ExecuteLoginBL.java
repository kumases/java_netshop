package model;


/**----------------------------------------------------------------------*
 *■■■ExecuteLoginBLクラス■■■
 *概要：ビジネスロジック（ユーザーデータの照合）
 *----------------------------------------------------------------------**/
public class ExecuteLoginBL {

	/**----------------------------------------------------------------------*
	 *■executeSelectUserInfoメソッド
	 *概要　：対象のアンケートデータを登録する
	 *引数１：入力されたユーザーID
	 *引数２：入力されたユーザーのパスワード
	 *戻り値：抽出したユーザーデータ（UserInfoDto型）
	 *----------------------------------------------------------------------**/
	public UsersDto executeSelectUsers(String userName, String passWord) {

		// データベースにアクセスしてユーザー情報を取得
		UsersDao dao = new UsersDao();
		UsersDto dto = dao.doSelect(userName, passWord);

		return dto;
	}

}
