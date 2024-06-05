package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class MemberPwdFindOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		
		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();
		
		vo = dao.getMemberPwdFind(mid, name, email);
		
//		SecurityUtil securityUtil = new SecurityUtil();
//		String pwd = vo.getPwd();
//		String saltKey = pwd.substring(0,8);
//		pwd = pwd.substring(9, pwd.length());
//		String strPwd = securityUtil.encryptSHA256(pwd);
//		strPwd = strPwd.substring(9,strPwd.length());
//		
//		
		
		
		if(mid.equals(vo.getMid()) && name.equals(vo.getName()) && email.equals(vo.getEmail())) {
			request.setAttribute("message", "회원정보가 확인되었습니다.");
			request.setAttribute("url", "MemberPwdChange.mem?mid="+vo.getMid());
		}
		else {
			request.setAttribute("message", "일치하는 회원정보가 없습니다.");
			request.setAttribute("url", "MemberPwdChange.mem");
		}
	
	}

}