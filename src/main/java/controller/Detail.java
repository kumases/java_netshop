package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DetailBL;
import model.ItemsDto;
import model.ReviewsSelectDto;
import model.ShowReviewsBL;
import model.UsersDto;


/**----------------------------------------------------------------------*
 *■■■ShowAllSurveyクラス■■■
 *概要：サーブレット
 *詳細：「survey」テーブルのデータを全件抽出して回答一覧画面を出力する。
 *----------------------------------------------------------------------**/
public class Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Detail() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//レスポンス（出力データ）の文字コードを設定
		response.setContentType("text/html;charset=UTF-8");

		//セッションからユーザーデータを取得
		HttpSession session           = request.getSession();
		UsersDto userInfoOnSession = (UsersDto)session.getAttribute("LOGIN_INFO");

		//ログイン状態によって表示画面を振り分ける
		if (userInfoOnSession != null) {
			//ログイン済：回答一覧画面を出力

			//「items」テーブルのデータを抽出
			String param = request.getParameter("id");
			String message = request.getParameter("message");
			int id = Integer.parseInt(param);
			List<ItemsDto> list  = new ArrayList<ItemsDto>();
			DetailBL logic = new DetailBL();
			list = logic.executeSelectItems(id);

			List<ReviewsSelectDto> list2  = new ArrayList<ReviewsSelectDto>();
			ShowReviewsBL logic2 = new ShowReviewsBL();
			list2 = logic2.executeSelectReviews(id);


			//アンケートリストをリクエストスコープに保存
			request.setAttribute( "ITEMS_LIST" , list );
			request.setAttribute( "REVIEWS_LIST" , list2 );
			//Viewにフォワード（フォワード先：show_survey_by_satisfaction_level.jsp）
			RequestDispatcher dispatch = request.getRequestDispatcher("/view/Detail.jsp");
			dispatch.forward(request, response);

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
