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

	public List<InqueriesDto> executeSelectInqueries(int id) {

		//-------------------------------------------
		//データベースへの接続を実施
		//-------------------------------------------

		//DAOクラスをインスタンス化＆itemsテーブルからデータ取得
		InqueriesDao dao = new InqueriesDao();
		List<InqueriesDto> dtoList= dao.doSelect(id);

		return dtoList;


	}

}
