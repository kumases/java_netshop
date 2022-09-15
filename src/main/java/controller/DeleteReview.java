package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DeleteReviewBL;
import model.UsersDto;


/**----------------------------------------------------------------------*
 *■■■ShowAllSurveyクラス■■■
 *概要：サーブレット
 *詳細：「survey」テーブルのデータを全件抽出して回答一覧画面を出力する。
 *----------------------------------------------------------------------**/
public class DeleteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteReview() {
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

			String param = request.getParameter("id");
			int item_id = Integer.parseInt(param);
			String param2 = request.getParameter("uid");

			DeleteReviewBL logic = new DeleteReviewBL();

			if(userInfoOnSession.getUserId() != 1) {
			logic.executeDeleteReview(item_id,userInfoOnSession.getUserId());
			String url ="ShowReviews?id=" + item_id;
			response.sendRedirect(url);
			}else {

				if(param2 != null) {
				int user_id = Integer.parseInt(param2);
				logic.executeDeleteReview(item_id,user_id);
				}
				response.sendRedirect("ShowAllReviews?id=1");
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
