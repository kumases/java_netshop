package model;

import java.util.List;

/**----------------------------------------------------------------------*
 *■■■ShowAllSurveyBLクラス■■■
 *概要：ビジネスロジック（アンケートデータの全件表示）
 *----------------------------------------------------------------------**/
public class SelectInqueryBL {

	/**----------------------------------------------------------------------*
	 *■executeSelectSurveyメソッド
	 *概要　：アンケートデータを全件抽出する
	 *引数　：なし
	 *戻り値：抽出結果（DTOリスト）
	 *----------------------------------------------------------------------**/
	public List<InqueriesDto> executeSelectInqueries(int id) {

		//-------------------------------------------
		//データベースへの接続を実施
		//-------------------------------------------

		//DAOクラスをインスタンス化＆itemsテーブルからデータ取得
		InqueriesDao dao = new InqueriesDao();
		List<InqueriesDto> dtoList= dao.doSelectOne(id);

		return dtoList;
	}

}
