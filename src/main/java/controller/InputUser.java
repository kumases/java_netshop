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
 *■■■InputSurveyクラス■■■
 *概要：サーブレット
 *詳細：HTML文書（回答入力画面）を出力する。
 *----------------------------------------------------------------------**/
public class InputUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InputUser() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//レスポンス（出力データ）の文字コードを設定
		response.setContentType("text/html;charset=UTF-8");  //文字コードをUTF-8で設定
		//リクエスト（受信データ）の文字コードを設定
		request.setCharacterEncoding("UTF-8");                  //文字コードをUTF-8で設定

		//セッションからユーザーデータを取得
		HttpSession session           = request.getSession();
		UsersDto userInfoOnSession = (UsersDto)session.getAttribute("LOGIN_INFO");


			//Viewにフォワード（フォワード先：input_survey.jsp）
			RequestDispatcher dispatch = request.getRequestDispatcher("/view/input_user.jsp");
			dispatch.forward(request, response);



	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
