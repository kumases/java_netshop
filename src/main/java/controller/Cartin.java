package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CartDto;
import model.CartinBL;
import model.UsersDto;

/**----------------------------------------------------------------------*
 *■■■SaveSurveyクラス■■■
 *概要：サーブレット
 *詳細：リクエスト（アンケートデータ）を「survey」テーブルに登録し、画面遷移する。
 *　　　＜遷移先＞登録成功：回答完了画面（finish.html）／登録失敗：エラー画面（error.html）
 *----------------------------------------------------------------------**/
public class Cartin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Cartin() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//レスポンス（出力データ）の文字コードを設定
		response.setContentType("text/html;charset=UTF-8"); //文字コードをUTF-8で設定
		//リクエスト（受信データ）の文字コードを設定
		request.setCharacterEncoding("UTF-8"); //文字コードをUTF-8で設定

		//セッションからユーザーデータを取得
		HttpSession session = request.getSession();
		UsersDto userInfoOnSession = (UsersDto) session.getAttribute("LOGIN_INFO");
		String param = request.getParameter("id");
		int id = Integer.parseInt(param);
		//ログイン状態によって表示画面を振り分ける
		if (userInfoOnSession != null) {
			//ログイン済：登録処理＆結果画面への遷移を実施

			//boolean succesFlg = true; //成功フラグ（true:成功/false:失敗）
			int flugcheck = 0;
			
			//パラメータのバリデーションチェック


				//バリデーションOKの場合

				//リクエストパラメータを取得
				int user_id = userInfoOnSession.getUserId(); //リクエストパラメータ（userId）
				int item_id = id; //リクエストパラメータ（itemId）
				int number = Integer.parseInt(request.getParameter("number")); //リクエストパラメータ（number)

				
				//アンケートデータ（SurveyDto型）の作成
				CartDto dto = new CartDto();
				dto.setUser_id(user_id);
				dto.setItem_id(item_id);
				dto.setNumber(number);
				dto.setTime( new Timestamp(System.currentTimeMillis()) );
				
				CartinBL logic = new CartinBL();
				flugcheck = logic.executeInsertCart(dto); //成功フラグ（true:成功/false:失敗）


			//成功/失敗に応じて表示させる画面を振り分ける
			if (flugcheck ==  0) {

				//成功した場合
				String url ="Detail?id=" + item_id + "&message=saccess";


				response.sendRedirect(url);
				
			} else if(flugcheck ==1) {

				//失敗した場合、エラー画面（error.html）を表示する
				response.sendRedirect("htmls/error.html");

			}else if(flugcheck ==2) {
				String url = "Detail?id=" + item_id + "&message=already";
				response.sendRedirect(url);
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

	/**----------------------------------------------------------------------*
	 *■■■validatePrmAgeクラス■■■
	 *概要：バリデーションチェック
	 *詳細：入力値（年齢）の検証を行う
	 *----------------------------------------------------------------------**/
	private boolean validatePrm(String pr) {

		boolean validateResult = true;

		//入力値がnullまたは正の数以外の場合はエラーとする
		if (pr == null || !(pr.matches("^[0-9]+$"))) {
			validateResult = false;
		}

		return validateResult;
	}

	/**----------------------------------------------------------------------*
	 *■■■validatePrmMessageクラス■■■
	 *概要：バリデーションチェック
	 *詳細：入力値（意見）の検証を行う
	 *----------------------------------------------------------------------**/
	private boolean validatePrmMessage(String pr) {

		boolean validateResult = true;

		//入力値が空白またはnullの場合はエラーとする
		if (pr == null || pr == "") {
			validateResult = false;
		}

		return validateResult;
	}

}
