package random;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RandomInputOkCommand implements RandomInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/place");
		int maxSize = 1024 * 1024 * 60;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String oFileName1 = multipartRequest.getOriginalFileName("fName1");
		
		String fsName1 = multipartRequest.getFilesystemName("fName1");
		
		String jiyok = multipartRequest.getParameter("jiyok")== null ? "" : multipartRequest.getParameter("jiyok");
		String jangso = multipartRequest.getParameter("jangso")== null ? "" : multipartRequest.getParameter("jangso");
		String story = multipartRequest.getParameter("story")== null ? "" : multipartRequest.getParameter("story");
		String nickName = multipartRequest.getParameter("nickName")== null ? "" : multipartRequest.getParameter("nickName");
		
		PlaceVO vo = new PlaceVO();
		vo.setImg(oFileName1);
		vo.setJiyok(jiyok);
		vo.setJangso(jangso);
		vo.setStory(story);
		vo.setNickName(nickName);
		
		RandomDAO dao = new RandomDAO();
		int res = dao.setRandomInputOk(vo);
		
		
		if(res != 0) {
			request.setAttribute("vo", vo);
			request.setAttribute("message", "자료실에 자료가 업로드 되었습니다.");
			request.setAttribute("url", "RandomMain.ran");
		}
		else {
			request.setAttribute("message", "자료실에 자료 업로드 실패~~");
			request.setAttribute("url", "RandomInput.ran");
		}
	}

}
