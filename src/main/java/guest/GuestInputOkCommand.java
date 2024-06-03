package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestInputOkCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		GuestVO vo = new GuestVO();
		
		vo.setMid(mid);
		vo.setNickName(nickName);
		title = title.replace("<", "&lt;").replace(">", "&gt;");
		vo.setTitle(title);
		vo.setContent(content);
		
		GuestDAO dao = new GuestDAO();
		int res = dao.setGuestInput(vo);
		
		if(res != 0) {
			request.setAttribute("message", "게시글이 등록되었습니다.");
			request.setAttribute("url", "GuestList.gu");
		}
		else {
			request.setAttribute("message", "게시글 등록실패~");
			request.setAttribute("url", "GuestInput.gu");
		}
	}

}
