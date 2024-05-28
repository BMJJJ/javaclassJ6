package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardSearchCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String partArea = request.getParameter("partArea")==null ? "" : request.getParameter("partArea");
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		
		BoardDAO dao = new BoardDAO();
		
		ArrayList<BoardVO> vos = dao.getBoardSearch(partArea, part);
		
		request.setAttribute("vos", vos);
		request.setAttribute("partArea", partArea);
		request.setAttribute("part", part);
	}

}
