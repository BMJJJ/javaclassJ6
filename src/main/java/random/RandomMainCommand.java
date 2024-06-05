package random;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RandomMainCommand implements RandomInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = 0;
		RandomDAO dao = new RandomDAO();
		PlaceVO vo = null;
		
		ArrayList<PlaceVO> vos = dao.getAllPlace();
		
		while(true) {
			idx = (int)(Math.random() * vos.size()+1);
			vo = dao.getRandomPlace(idx);
			if(vo.getJiyok() != null) break;
		}
		
		request.setAttribute("vo", vo);
	}

}
