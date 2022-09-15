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

import model.AllInqueriesBL;
import model.InqueriesDto;
import model.UsersDto;


/**----------------------------------------------------------------------*
 *■■■ShowAllSurveyクラス■■■
 *概要：サーブレット
 *詳細：「items」テーブルのデータを全件抽出して回答一覧画面を出力する。
 *----------------------------------------------------------------------**/
public class AllInqueries extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AllInqueries() {
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
			if(userInfoOnSession.getUserId() == 1){

			//「users」テーブルのデータを抽出
			List<InqueriesDto> list  = new ArrayList<InqueriesDto>();
			AllInqueriesBL logic = new AllInqueriesBL();
						
			list = logic.executeSelectInqueries();

			request.setAttribute( "ALL_INQUERIES_LIST" , list );

			RequestDispatcher dispatch = request.getRequestDispatcher("/view/allinqueries.jsp");
			dispatch.forward(request, response);
			}else {
				response.sendRedirect("ShowAllItems");
			}
		}else {
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
