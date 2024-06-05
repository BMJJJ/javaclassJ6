package random;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberJoinOkCommand;

@SuppressWarnings("serial")
@WebServlet("*.ran")
public class RandomController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RandomInterface command = null;
		String viewPage = "/WEB-INF/random";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		// 인증....처리.....
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		if(com.equals("/RandomMain")) {
			command = new RandomMainCommand();
			command.execute(request, response);
			viewPage += "/randomMain.jsp";
		}
		else if(com.equals("/RandomInput")) {
			viewPage += "/randomInput.jsp";
		}
		else if(com.equals("/RandomInputOk")) {
			command = new RandomInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);		
	}
}
