package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AddUserBL;
import model.UsersDto;


@MultipartConfig
/**----------------------------------------------------------------------*
 *■■■SaveSurveyクラス■■■
 *概要：サーブレット
 *詳細：リクエスト（アンケートデータ）を「survey」テーブルに登録し、画面遷移する。
 *　　　＜遷移先＞登録成功：回答完了画面（finish.html）／登録失敗：エラー画面（error.html）
 *----------------------------------------------------------------------**/
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddUser() {
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
		int user_id =0;
		if(userInfoOnSession !=null) {
			user_id = userInfoOnSession.getUserId();
		}
		PrintWriter out = response.getWriter();


			boolean succesFlg = true;  //成功フラグ（true:成功/false:失敗）
			int a = 0;
			HashMap<String,String> hashmap = new HashMap<String,String>();
			//パラメータのバリデーションチェック
			if( (validateNull(request.getParameter("name")))) {     
				hashmap.put("name",request.getParameter("name"));
			}else {
				hashmap.put("name","");
			}
			if( !(validateNull(request.getParameter("name_kana")))) {                
				hashmap.put("name_kana","");
			}else if( !(validatePrmKana(request.getParameter("name_kana")))) {
				hashmap.put("name_kana","kana");
			}else {
				hashmap.put("name_kana",request.getParameter("name_kana"));
			}
			if((validateNull(request.getParameter("nickname")))) {                
				hashmap.put("nickname",request.getParameter("nickname"));
			}else {
				hashmap.put("nickname","");
			}
			if( (validatePrmNum(request.getParameter("sex")))) {                
				hashmap.put("sex",request.getParameter("sex"));
			}else {
				hashmap.put("sex","");
			}
			if( (validateNull(request.getParameter("pass")))) {                
				hashmap.put("pass",request.getParameter("pass"));
			}else {
				hashmap.put("pass","");
			}
			
			
			
			if( (validatePrmNum(request.getParameter("zipcode")))) {                
				hashmap.put("zipcode",request.getParameter("zipcode"));
			}else {
				hashmap.put("zipcpde","");
			}
			if( (validatePrmNum(request.getParameter("tell")))) {                
				hashmap.put("tell",request.getParameter("tell"));
			}else {
				hashmap.put("tell","");
			}
			
			hashmap.put("birthday",request.getParameter("address"));
			hashmap.put("birthday",request.getParameter("birthday"));
			hashmap.put("email",request.getParameter("email"));
			
			String pass              = request.getParameter("pass");
			String pass2              = request.getParameter("pass2");
			//バリデーションNGの場合
			if(hashmap.get("name") =="" || hashmap.get("nickname") =="" || hashmap.get("sex") =="" || hashmap.get("pass") =="") {
				request.setAttribute( "USERS_LIST" , hashmap );
				//Viewにフォワード（フォワード先：show_survey_by_satisfaction_level.jsp）

				succesFlg = false ;
				if(pass != null && pass2 != null && !pass.equals( pass2)) {
					a = 1;
				}
			}else {
				//バリデーションOKの場合

				//リクエストパラメータを取得
				String name              = request.getParameter("name");
				String name_kana              = request.getParameter("name_kana");
				String nickname              = request.getParameter("nickname");
				int    sex               = Integer.parseInt( request.getParameter("sex") );
				String birthday              = request.getParameter("birthday");
				String zipcode              = request.getParameter("zipcode");
				String address              = request.getParameter("address");
				String tell              = request.getParameter("tell");
				String email              = request.getParameter("email");

				
				if(pass.equals( pass2)) {
				//アンケートデータ（SurveyDto型）の作成
				UsersDto dto = new UsersDto();
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
				AddUserBL logic = new AddUserBL();
				succesFlg          = logic.executeInsertUser(dto);  //成功フラグ（true:成功/false:失敗）
				}else {
					a = 1;
				}
				}

			//成功/失敗に応じて表示させる画面を振り分ける
			if (succesFlg && a==0) {
				//成功した場合、回答完了画面（finish.html）を表示する
				response.sendRedirect("htmls/addfinish.html");
			} else if (succesFlg && a==1) {
				hashmap.put("pass2","");
				request.setAttribute( "USERS_LIST" , hashmap );
				RequestDispatcher dispatch = request.getRequestDispatcher("/view/input_user.jsp");
				dispatch.forward(request, response);
			} else {
				if(user_id == 1) {
				//失敗した場合、エラー画面（error.html）を表示する
					RequestDispatcher dispatch = request.getRequestDispatcher("/view/input_user.jsp");
					dispatch.forward(request, response);
				}else if(user_id == 0) {
					RequestDispatcher dispatch = request.getRequestDispatcher("/view/input_user.jsp");
					dispatch.forward(request, response);
				}else {
					//response.sendRedirect("htmls/adderror.html");
					RequestDispatcher dispatch = request.getRequestDispatcher("/view/input_user.jsp");
					dispatch.forward(request, response);
				}
			}
	}

	/**----------------------------------------------------------------------*
	 *■■■validatePrmNameクラス■■■
	 *概要：バリデーションチェック
	 *詳細：入力値 の検証を行う
	 *----------------------------------------------------------------------**/
	private boolean validateNull( String pr) {

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
	 *詳細：入力値（数値）の検証を行う
	 *----------------------------------------------------------------------**/
	private boolean validatePrmNum( String pr) {

		boolean validateResult = true ;

		//入力値がnullまたは正の数以外の場合はエラーとする
		if( pr == null || !( pr.matches("^[0-9]+$") )) {
			validateResult = false ;
		}

		return validateResult ;
	}
	private boolean validatePrmKana( String pr) {

		boolean validateResult = true ;

		//入力値がnullまたは正の数以外の場合はエラーとする
		if( pr == null || !( pr.matches("^[ァ-ヶー　]*$") )) {
			validateResult = false ;
		}

		return validateResult ;
	}
}
