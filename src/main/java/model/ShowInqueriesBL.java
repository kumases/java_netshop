package model;

import java.util.List;

/**----------------------------------------------------------------------*
 *■■■ItemsDtoクラス■■■
 *概要：DTO（「items」テーブル）
 *----------------------------------------------------------------------**/
public class ShowInqueriesBL {

	//----------------------------------------------------------------
	//フィールド
	//----------------------------------------------------------------

	public List<InqueriesAndAnswerDto> executeSelectInqueries(int id) {

		//-------------------------------------------
		//データベースへの接続を実施
		//-------------------------------------------

		//DAOクラスをインスタンス化＆itemsテーブルからデータ取得
		AnswersDao dao = new AnswersDao();
		List<InqueriesAndAnswerDto> dtoList= dao.doSelect(id);

		return dtoList;


	}

}
