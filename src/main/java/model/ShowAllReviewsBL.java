package model;

import java.util.List;

/**----------------------------------------------------------------------*
 *■■■ShowAllSurveyBLクラス■■■
 *概要：ビジネスロジック（アンケートデータの全件表示）
 *----------------------------------------------------------------------**/
public class ShowAllReviewsBL {

	/**----------------------------------------------------------------------*
	 *■executeSelectSurveyメソッド
	 *概要　：アンケートデータを全件抽出する
	 *引数　：なし
	 *戻り値：抽出結果（DTOリスト）
	 *----------------------------------------------------------------------**/
	public List<ReviewsSelectDto> executeSelectReviews() {

		//-------------------------------------------
		//データベースへの接続を実施
		//-------------------------------------------

		//DAOクラスをインスタンス化＆itemsテーブルからデータ取得
		ReviewsDao dao = new ReviewsDao();
		List<ReviewsSelectDto> dtoList= dao.doSelectAll();

		return dtoList;
	}

}