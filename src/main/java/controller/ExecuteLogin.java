package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ExecuteLoginBL;
import model.UsersDto;


/**----------------------------------------------------------------------*
 *■■■ExecuteLoginクラス■■■
 *概要：サーブレット
 *詳細：「user_info」テーブルからユーザー入力値と合致するユーザーデータを抽出し、リダイレクトする。
 *　　　＜リダイレクト先＞合致データあり（ログインOK）：InputSurveyサーブレット
 *　　　　　　　　　　　　合致データなし（ログインNG）：Loginサーブレット（前画面に戻る）
 *----------------------------------------------------------------------**/
public class ExecuteLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ExecuteLogin() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//レスポンス（出力データ）の文字コードを設定
		response.setContentType("text/html;charset=UTF-8");     //文字コードをUTF-8で設定
		//リクエスト（受信データ）の文字コードを設定
		request.setCharacterEncoding("UTF-8");                  //文字コードをUTF-8で設定

		//セッションからユーザーデータを取得
		HttpSession session           = request.getSession();
		UsersDto userInfoOnSession = (UsersDto)session.getAttribute("LOGIN_INFO");

		//ログイン状態によって表示画面を振り分ける
		if (userInfoOnSession != null) {

			//ログイン済：回答入力画面に転送
			response.sendRedirect("ShowAllItems");

		} else {

			//未ログイン：ログイン処理を実施

			boolean succesFlg = true;  //成功フラグ（true:成功/false:失敗）

			//パラメータのバリデーションチェック
			if( !(validatePrmUserId(request.getParameter("USER_NAME"))        &&
					validatePrmPassword(request.getParameter("PASSWORD"))     ) ) {

				//バリデーションNGの場合
				succesFlg = false ;

			}else {

				//バリデーションOKの場合

				//リクエストパラメータからユーザー入力値を取得
				String userName   = request.getParameter("USER_NAME");      //リクエストパラメータ（USER_ID）
				String passWord = request.getParameter("PASSWORD");     //リクエストパラメータ（PASSWORD）

				//「users」テーブルからユーザー入力値と合致するユーザーデータ（UsersDto型）を抽出
				ExecuteLoginBL logic = new ExecuteLoginBL();
				UsersDto    dto   = logic.executeSelectUsers(userName, passWord);

				if(dto.getPassWord() != null) {

					//DBから抽出したユーザデータをセッションにセット
					session.setAttribute("LOGIN_INFO", dto);
				}
				
			}


			//成功/失敗に応じて表示させる画面を振り分ける
			if (succesFlg) {
				//成功：ログインOKとして回答入力画面へ
				response.sendRedirect("ShowAllItems");

			} else {
				//失敗：ログインNGとしてログイン画面へ転送
				PrintWriter out = response.getWriter();
				 out.println("<script>");
				   out.println("alert('ログインしてください');"
				   		+ "location.href='Login';");
				   out.println("</script>");

			}
		}
	}

	/**----------------------------------------------------------------------*
	 *■■■validatePrmUserIdクラス■■■
	 *概要：バリデーションチェック
	 *詳細：入力値（名前）の検証を行う
	 *----------------------------------------------------------------------**/
	private boolean validatePrmUserId( String pr) {

		boolean validateResult = true ;

		//入力値がnullまたは空白の場合はエラーとする
		if( pr == null || pr.equals("") ) {
			validateResult = false ;
		}

		return validateResult ;
	}

	/**----------------------------------------------------------------------*
	 *■■■validatePrmPasswordクラス■■■
	 *概要：バリデーションチェック
	 *詳細：入力値（年齢）の検証を行う
	 *----------------------------------------------------------------------**/
	private boolean validatePrmPassword( String pr) {

		boolean validateResult = true ;

		//入力値がnullまたは空白の場合はエラーとする
		if( pr == null || pr.equals("") ) {
			validateResult = false ;
		}

		return validateResult ;
	}

}