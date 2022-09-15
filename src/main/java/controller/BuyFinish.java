package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CartSelectBL;
import model.CartSelectDto;
import model.HistoryBL;
import model.HistoryDto;
import model.ItemsDto;
import model.StockMinusBL;
import model.UsersDto;


/**----------------------------------------------------------------------*
 *■■■ShowAllSurveyクラス■■■
 *概要：サーブレット
 *詳細：「survey」テーブルのデータを全件抽出して回答一覧画面を出力する。
 *----------------------------------------------------------------------**/
public class BuyFinish extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BuyFinish() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//レスポンス（出力データ）の文字コードを設定
		response.setContentType("text/html;charset=UTF-8");

		//セッションからユーザーデータを取得
		HttpSession session           = request.getSession();
		UsersDto userInfoOnSession = (UsersDto)session.getAttribute("LOGIN_INFO");
		@SuppressWarnings("unchecked")
		List<CartSelectDto> list  = (List<CartSelectDto>)session.getAttribute("CART_ITEMS_LIST");
		//ログイン状態によって表示画面を振り分ける
		if (userInfoOnSession != null) {
			if(list != null) {
			//ログイン済：回答一覧画面を出力

			//「items」テーブルのデータを抽出
			CartSelectBL logic = new CartSelectBL();
			list = logic.executeSelectItems(userInfoOnSession.getUserId());
			HistoryDto dto2 = new HistoryDto();
			ItemsDto dto3 = new ItemsDto();
			
			
			for (int i = 0; i < list.size(); i++) {
			HistoryBL logic2 = new HistoryBL();
			CartSelectDto dto = list.get(i);
			dto2.setUser_id(dto.getCart_user_id());
			dto2.setItem_name(dto.getItems_name() );
			dto2.setPrice( dto.getItems_price() );
			dto2.setItem_id( dto.getCart_item_id() );
			dto2.setNum( dto.getCart_number() );
			dto2.setTime( new Timestamp(System.currentTimeMillis()) );   //現在時刻を更新時刻として設定
			logic2.executeInsertHistory(dto2);
			}
			
			for (int i = 0; i < list.size(); i++) {
			StockMinusBL logic3 = new StockMinusBL();
			CartSelectDto dto = list.get(i);
			dto3.setId( dto.getCart_item_id() );
			dto3.setStock( dto.getCart_number() );
			logic3.executeMinusStock(dto3);
			}
			
			request.setAttribute( "ALL_ITEMS_LIST" , list );
			session.removeAttribute("CART_ITEMS_LIST");
			//Viewにフォワード（フォワード先：show_survey_by_satisfaction_level.jsp）
			RequestDispatcher dispatch = request.getRequestDispatcher("/view/kakutei.jsp");
			dispatch.forward(request, response);
			}else {
				response.sendRedirect("ShowAllItems");
			}
		} else {
			//未ログイン：ログイン画面へ転送
			PrintWriter out = response.getWriter();
			 out.println("<script>");
			   out.println("alert('ログインしてください');"
			   		+ "location.href='Login';");
			   out.println("</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
