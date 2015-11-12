package bean;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.mapBean;
import bean.boardDAO;

@WebServlet("/controller")
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public controller() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		request.setCharacterEncoding("euc-kr");

		String path = "";
		String type = request.getParameter("type");
		boardDAO board_dao = new boardDAO();
		List boardlist = new ArrayList();
		List boardlist1 = new ArrayList();

		if (type.equals("board_list")) {
			boardlist1 = board_dao.board_select();	
			HttpSession session= request.getSession();
			session.setAttribute("boardlist1", boardlist1);
			
			path = "daummap0.jsp";
		}

		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
}
