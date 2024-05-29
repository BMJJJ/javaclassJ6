package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardSearchCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String partArea = request.getParameter("partArea")==null ? "" : request.getParameter("partArea");
//		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
//		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
//		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		String flag = request.getParameter("flag")==null ? "" : request.getParameter("flag");
		
		String searchTopic = "";
		String searchContent = "";
		System.out.println("flag : " + flag);
		
		if(flag.equals("partSearch")) {
			searchTopic = request.getParameter("partArea");
			searchContent = request.getParameter("part");			
		}
		else if(flag.equals("contentSearch")) {
			searchTopic = request.getParameter("search");
			searchContent = request.getParameter("searchString");
		}
		
		
		System.out.println("searchTopic : " + searchTopic);
		System.out.println("searchContent : " + searchContent);
		
		BoardDAO dao = new BoardDAO();
		
		ArrayList<BoardVO> vos = dao.getBoardSearch(flag, searchTopic, searchContent);
		System.out.println("vos : " + vos);
		request.setAttribute("vos", vos);
		request.setAttribute("searchTopic", searchTopic);
		request.setAttribute("searchContent", searchContent);
		request.setAttribute("pag", 1);
		request.setAttribute("pageSize", 10);
//		request.setAttribute("search", search);
//		request.setAttribute("searchString", searchString);
		
	}

}
