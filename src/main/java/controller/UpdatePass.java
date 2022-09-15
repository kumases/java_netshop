package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ExecuteLoginBL;
import model.UpdatePassBL;
import model.UsersDto;

@MultipartConfig
/**----------------------------------------------------------------------*
 *■■■SaveSurveyクラス■■■
 *概要：サーブレット
 *詳細：リクエスト（アンケートデータ）を「survey」テーブルに登録し、画面遷移する。
 *　　　＜遷移先＞登録成功：回答完了画面（finish.html）／登録失敗：エラー画面（error.html）
 *----------------------------------------------------------------------**/
public class UpdatePass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdatePass() {
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

		//ログイン状態によって表示画面を振り分ける
		if (userInfoOnSession != null) {
			//ログイン済：登録処理＆結果画面への遷移を実施
			PrintWriter out = response.getWriter();
			boolean succesFlg = true; //成功フラグ（true:成功/false:失敗）
			int falseNo = 0;
			//パラメータのバリデーションチェック
			if (!(validateNull(request.getParameter("pass")) &&
					validateNull(request.getParameter("new_pass")) &&
					validateNull(request.getParameter("new_pass2")) )) {

				//バリデーションNGの場合
				succesFlg = false;

			} else {
				//バリデーションOKの場合

				//リクエストパラメータを取得
				int    id = Integer.parseInt( request.getParameter("id") );
				String pass = request.getParameter("pass");
				String new_pass = request.getParameter("new_pass");
				String new_pass2 = request.getParameter("new_pass2");




				UsersDto dto2 = new UsersDto();
				ExecuteLoginBL lo = new ExecuteLoginBL();
				dto2 = lo.executeSelectUsers(userInfoOnSession.getUserName(),pass);
				if(dto2.getPassWord() !=null) {
					if (dto2.getPassWord().equals(pass) && new_pass.equals(new_pass2)) {

					UsersDto dto = new UsersDto();
						dto.setUserId( id);
						dto.setPassWord(new_pass);

						UpdatePassBL logic = new UpdatePassBL();
						succesFlg = logic.executeUpdatePass(dto); //成功フラグ（true:成功/false:失敗）
				} else if (! (new_pass.equals(new_pass2)) && userInfoOnSession.getPassWord().equals(pass)) {
						succesFlg = false;
						falseNo = 1;
				}
			}else {
				succesFlg = false;
				falseNo = 2;
			}
			}

			//成功/失敗に応じて表示させる画面を振り分ける
			if (succesFlg) {

				//成功した場合、回答完了画面（finish.html）を表示する
				if(userInfoOnSession.getUserId() == 1) {
				response.sendRedirect("htmls/addfinish.html");
				}else {
					 out.println("<script>");
					   out.println("alert('変更しました');"
					   		+ "location.href='Mypage';");
					   out.println("</script>");
				}
			} else {
				if(falseNo == 0) {
				//失敗した場合、エラー画面（error.html）を表示する
				response.sendRedirect("htmls/passadderror.html");
				}else if(falseNo == 1) {
					//現在のパスワードと一致しない場合
				   out.println("<script>");
				   out.println("alert('確認用パスワードと不一致');"
				   		+ "location.href='EditPass';");
				   out.println("</script>");
				}else if(falseNo == 2) {
					//確認用パスワードと一致しない場合
					   out.println("<script>");
					   out.println("alert('現在のパスワードと不一致');"
					   		+ "location.href='EditPass';");
					   out.println("</script>");
				}else if(falseNo == 3) {
					//確認用パスワードと一致しない場合
					   out.println("<script>");
					   out.println("alert('全然違う');"
					   		+ "location.href='EditPass';");
					   out.println("</script>");
				}
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
	 *■■■validatePrmNameクラス■■■
	 *概要：バリデーションチェック
	 *詳細：入力値（名前）の検証を行う
	 *----------------------------------------------------------------------**/
	private boolean validateNull(String pr) {

		boolean validateResult = true;

		//入力値がnullまたは空白の場合はエラーとする
		if (pr == null || pr.equals("")) {
			validateResult = false;
		}

		return validateResult;
	}

	/**----------------------------------------------------------------------*
	 *■■■validatePrmAgeクラス■■■
	 *概要：バリデーションチェック
	 *詳細：入力値（年齢）の検証を行う
	 *----------------------------------------------------------------------**/
	private boolean validatePrmNum(String pr) {

		boolean validateResult = true;

		//入力値がnullまたは正の数以外の場合はエラーとする
		if (pr == null || !(pr.matches("^[0-9]+$"))) {
			validateResult = false;
		}

		return validateResult;
	}
}
