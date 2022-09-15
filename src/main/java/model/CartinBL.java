package model;

/**----------------------------------------------------------------------*
 *■■■SaveSurveyBLクラス■■■
 *概要：ビジネスロジック（アンケートデータの登録）
 *----------------------------------------------------------------------**/
public class CartinBL {

	/**----------------------------------------------------------------------*
	 *■executeInsertSurveyメソッド
	 *概要　：対象のアンケートデータを登録する
	 *引数　：対象のアンケートデータ（SurveyDto型）
	 *戻り値：DB操作成功フラグ（true:成功/false:失敗）
	 *----------------------------------------------------------------------**/
	public int executeInsertCart(CartDto dto) {

		int flugcheck = 0;
		boolean successInsert = false ;  //DB操作成功フラグ（true:成功/false:失敗）

		//-------------------------------------------
		//データベースへの接続を実施
		//-------------------------------------------

		//DAOクラスをインスタンス化＆対象のユーザーデータを登録するよう依頼
		dto.getId();
		CartDao dao = new CartDao();
		if(dao.CartInCheck(dto.getItem_id(), dto.getUser_id()) <= 0) { 
			successInsert = dao.doInsert(dto);
			if(successInsert) {
				flugcheck = 0;
			}else {
				flugcheck = 1;
			}
		}else {
				flugcheck = 2;
		}
		
		return flugcheck;
	}

}
