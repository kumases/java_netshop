package model;

/**----------------------------------------------------------------------*
 *■■■ShowAllSurveyBLクラス■■■
 *概要：ビジネスロジック（アンケートデータの全件表示）
 *----------------------------------------------------------------------**/
public class DeleteReviewBL {

	/**----------------------------------------------------------------------*
	 *■executeSelectSurveyメソッド
	 *概要　：アンケートデータを全件抽出する
	 *引数　：なし
	 *戻り値：抽出結果（DTOリスト）
	 *----------------------------------------------------------------------**/
	public boolean executeDeleteReview(int item_id, int user_id) {

		boolean succesDelete = false;
		//-------------------------------------------
		//データベースへの接続を実施
		//-------------------------------------------

		//DAOクラスをインスタンス化＆itemsテーブルからデータ取得
		ReviewsDao dao = new ReviewsDao();
		succesDelete =dao.doUpdate(item_id,user_id);
		
		
		
		return succesDelete;
	}

}
