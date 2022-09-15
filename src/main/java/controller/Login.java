package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UsersDto;

/**----------------------------------------------------------------------*
 *■■■Loginクラス■■■
 *概要：サーブレット
 *詳細：HTML文書（ログイン画面）を出力する。
 *----------------------------------------------------------------------**/
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	 throws ServletException, IOException {

		//レスポンス（出力データ）の文字コードを設定
		response.setContentType("text/html;charset=UTF-8");  //文字コードをUTF-8で設定

		// セッションからログイン情報を取得
		HttpSession session = request.getSession();
		UsersDto userInfoOnSession = (UsersDto) session.getAttribute("LOGIN_INFO");

		//ログイン状態によって表示画面を振り分ける
		if (userInfoOnSession != null) {
			response.sendRedirect("ShowAllItems");

		} else {
			
			//Viewにフォワード（フォワード先：show_survey_by_satisfaction_level.jsp）
			RequestDispatcher dispatch = request.getRequestDispatcher("view/login.jsp");
			dispatch.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	 throws ServletException, IOException {
		doGet(request, response);
	}

}
