package common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;

@SuppressWarnings("serial")
@WebServlet("/Main")
public class Main extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mainImage = (int) (Math.random()*(115+1-5)) + 111;
		request.setAttribute("mainImage", mainImage);
		
		
		
		MemberDAO dao = new MemberDAO();
		
		int[] cafeInfos = dao.getCafeInfo();
		
		request.setAttribute("totMem", cafeInfos[0]);
		request.setAttribute("allVisitCnt", cafeInfos[1]);
		request.setAttribute("allTodayCnt", cafeInfos[2]);
		
		String viewPage = "/WEB-INF/main/main.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
