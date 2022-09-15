package model;

import java.util.List;

/**----------------------------------------------------------------------*
 *■■■ItemsDtoクラス■■■
 *概要：DTO（「items」テーブル）
 *----------------------------------------------------------------------**/
public class ShowFavoriteBL {

	//----------------------------------------------------------------
	//フィールド
	//----------------------------------------------------------------

	public List<FavoriteSelectDto> executeSelectFavorite(int id) {

		//-------------------------------------------
		//データベースへの接続を実施
		//-------------------------------------------

		//DAOクラスをインスタンス化＆itemsテーブルからデータ取得
		FavoriteDao dao = new FavoriteDao();
		List<FavoriteSelectDto> dtoList= dao.doSelect(id);

		return dtoList;


	}

}
