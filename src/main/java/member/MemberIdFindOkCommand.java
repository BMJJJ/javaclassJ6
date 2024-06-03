package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberIdFindOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String tel = request.getParameter("tel")==null ? "" : request.getParameter("tel");
		
		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();
		
		vo = dao.getMemberIdFind(name, email, tel);
		
		if(name.equals(vo.getName()) && email.equals(vo.getEmail()) && tel.equals(vo.getTel())) {
			request.setAttribute("mid", vo.getMid());
			request.setAttribute("message", "회원정보가 확인되었습니다.");
			request.setAttribute("url", "MemberIdFindShow.mem?mid="+vo.getMid());
		}
		else {
			request.setAttribute("message", "일치하는 회원정보가 없습니다.");
			request.setAttribute("url", "MemberIdFind.mem");
		}
	
	}

}
