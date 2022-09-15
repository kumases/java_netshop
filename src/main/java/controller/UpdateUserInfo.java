package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UpdateUserBL;
import model.UsersDto;


@MultipartConfig
/**----------------------------------------------------------------------*
 *■■■SaveSurveyクラス■■■
 *概要：サーブレット
 *詳細：リクエスト（アンケートデータ）を「survey」テーブルに登録し、画面遷移する。
 *　　　＜遷移先＞登録成功：回答完了画面（finish.html）／登録失敗：エラー画面（error.html）
 *----------------------------------------------------------------------**/
public class UpdateUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateUserInfo() {
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
			//ログイン済：登録処理＆結果画面への遷移を実施

			boolean succesFlg = true;  //成功フラグ（true:成功/false:失敗）

			//パラメータのバリデーションチェック
			if( (validatePrmName(request.getParameter("name"))                &&
					validatePrmNum(request.getParameter("price"))                  &&
					validatePrmNum(request.getParameter("stock"))  )) {

				//バリデーションNGの場合
				succesFlg = false ;

			}else {
				//バリデーションOKの場合

				//リクエストパラメータを取得
				int    id               = Integer.parseInt( request.getParameter("id") );
				String name              = request.getParameter("name");
				String name_kana              = request.getParameter("name_kana");
				String nickname              = request.getParameter("nickname");
				int    sex               = Integer.parseInt( request.getParameter("sex") );
				String birthday              = request.getParameter("birthday");
				String zipcode              = request.getParameter("zipcode");
				String address              = request.getParameter("address");
				String tell              = request.getParameter("tell");
				String email              = request.getParameter("email");
				String pass              = request.getParameter("pass");

				//アンケートデータ（SurveyDto型）の作成
				UsersDto dto = new UsersDto();
				dto.setUserId( id);
				dto.setUserName( name );
				dto.setName_kana( name_kana);
				dto.setNickname( nickname );
				dto.setSex( sex);
				dto.setBirthday( birthday);
				dto.setZipcode( zipcode);
				dto.setAddress( address);
				dto.setTell( tell);
				dto.setEmail( email);
				dto.setPassWord( pass);
				dto.setTime( new Timestamp(System.currentTimeMillis()) );   //現在時刻を更新時刻として設定

				//アンケートデータをDBに登録
				UpdateUserBL logic = new UpdateUserBL();
				succesFlg          = logic.executeUpdateUser(dto);  //成功フラグ（true:成功/false:失敗）

				}

			//成功/失敗に応じて表示させる画面を振り分ける
			if (succesFlg) {

				//成功した場合、回答完了画面（finish.html）を表示する
				if(userInfoOnSession.getUserId() ==1) {
				response.sendRedirect("htmls/addfinish.html");
				}else {
				response.sendRedirect("UserInfo");
				}
			} else {

				//失敗した場合、エラー画面（error.html）を表示する
				response.sendRedirect("htmls/adderror.html");

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
	private boolean validatePrmName( String pr) {

		boolean validateResult = true ;

		//入力値がnullまたは空白の場合はエラーとする
		if( pr == null || pr.equals("") ) {
			validateResult = false ;
		}

		return validateResult ;
	}

	/**----------------------------------------------------------------------*
	 *■■■validatePrmAgeクラス■■■
	 *概要：バリデーションチェック
	 *詳細：入力値（年齢）の検証を行う
	 *----------------------------------------------------------------------**/
	private boolean validatePrmNum( String pr) {

		boolean validateResult = true ;

		//入力値がnullまたは正の数以外の場合はエラーとする
		if( pr == null || !( pr.matches("^[0-9]+$") )) {
			validateResult = false ;
		}

		return validateResult ;
	}
}
