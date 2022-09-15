package model;

import java.util.List;

/**----------------------------------------------------------------------*
 *■■■ShowAllSurveyBLクラス■■■
 *概要：ビジネスロジック（アンケートデータの全件表示）
 *----------------------------------------------------------------------**/
public class ShowAllItemsBL {

	/**----------------------------------------------------------------------*
	 *■executeSelectSurveyメソッド
	 *概要　：アンケートデータを全件抽出する
	 *引数　：なし
	 *戻り値：抽出結果（DTOリスト）
	 *----------------------------------------------------------------------**/
	public List<ItemsDto> executeSelectItems(String search,String order) {

		//-------------------------------------------
		//データベースへの接続を実施
		//-------------------------------------------

		//DAOクラスをインスタンス化＆itemsテーブルからデータ取得
		ItemsDao dao = new ItemsDao();
		List<ItemsDto> dtoList= dao.doSelect(search,order);

		return dtoList;
	}

}
