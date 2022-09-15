package model;

import java.util.List;

/**----------------------------------------------------------------------*
 *■■■ItemsDtoクラス■■■
 *概要：DTO（「items」テーブル）
 *----------------------------------------------------------------------**/
public class ShowReviewsBL {

	//----------------------------------------------------------------
	//フィールド
	//----------------------------------------------------------------

	public List<ReviewsSelectDto> executeSelectReviews(int id) {

		//-------------------------------------------
		//データベースへの接続を実施
		//-------------------------------------------

		//DAOクラスをインスタンス化＆itemsテーブルからデータ取得
		ReviewsDao dao = new ReviewsDao();
		List<ReviewsSelectDto> dtoList= dao.doSelectbyItemid(id);

		return dtoList;


	}
	public List<ReviewsSelectDto> executeSelectReviews2(int id) {

		//-------------------------------------------
		//データベースへの接続を実施
		//-------------------------------------------

		//DAOクラスをインスタンス化＆itemsテーブルからデータ取得
		ReviewsDao dao = new ReviewsDao();
		List<ReviewsSelectDto> dtoList= dao.doSelectbyUserid(id);

		return dtoList;


	}

}
