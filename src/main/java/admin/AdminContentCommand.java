package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;

public class AdminContentCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDAO dao = new AdminDAO();
		
		BoardDAO dao2 = new BoardDAO();
		
		AdminDAO dao3 = new AdminDAO();
		
		int mCount = dao.getNewMemberListCount();
		int mdCount = dao.getDeleteMemberListCount();
		
		int blCount = dao2.getNewBoardList();
		
		int cList = dao3.getComplaintList();
		
		request.setAttribute("mCount", mCount);
		request.setAttribute("mdCount", mdCount);
		request.setAttribute("blCount", blCount);
		request.setAttribute("cList", cList);
	}

}
