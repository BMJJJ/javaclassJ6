package common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import board.BoardDAO;
import board.BoardVO;
import pds.PdsDAO;
import pds.PdsVO;

public class Pagination {

	public static void pageChange(HttpServletRequest request, int pag, int pageSize, String contentsShow, String section,	String part) {
		BoardDAO boardDao = new BoardDAO();
		PdsDAO pdsDao = new PdsDAO();
		
		// part의 값이 넘어올경우는 search/searchString 의 값이 넘어올경우와, _____ 가 있다.
		String search = "", searchString = "";
		if(part != null && !part.equals("")) {
			if(section.equals("board")) {
				search = part.split("/")[0];
				searchString = part.split("/")[1];
			}
		}
		
		int totRecCnt = 0;
		
		if(section.equals("board")) {
			if(part == null || part.equals("")) {
			  totRecCnt = boardDao.getTotRecCnt(contentsShow, "", "");	// 게시판의 전체/조건에 따른 레코드수 구하기
			}
			else {
				totRecCnt = boardDao.getTotRecCnt(contentsShow, search, searchString);	// 게시판의 전체/조건에 따른 레코드수 구하기
			}
		}
		else if(section.equals("pds")) {
			totRecCnt = pdsDao.getTotRecCnt(part);	// 자료실의 전체/조건에 따른 레코드수 구하기
		}
		
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;
		if(pag > totPage) pag = 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		List<BoardVO> boardVos = null;
		List<PdsVO> pdsVos = null;
		
		if(section.equals("board")) {
			if(part == null || part.equals("")) {
				boardVos = boardDao.getBoardList(startIndexNo, pageSize, contentsShow, "", "");	// 게시판의 전체 자료 가져오기
			}
			else {
				boardVos = boardDao.getBoardList(startIndexNo, pageSize, contentsShow, search, searchString);
			}
			request.setAttribute("vos", boardVos);
		}
		else if(section.equals("pds")) {
			pdsVos = pdsDao.getPdsList(startIndexNo, pageSize, part);	// 자료실의 전체 자료 가져오기
			request.setAttribute("vos", pdsVos);
		}
		
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		
		if(section.equals("board") && part != null && !part.equals("")) {
			String searchTitle = "";
			if(search.equals("title")) searchTitle = "글제목";
			else if(search.equals("nickName")) searchTitle = "글쓴이";
			else searchTitle = "글내용";
			request.setAttribute("search", search);
			request.setAttribute("searchTitle", searchTitle);
			request.setAttribute("searchString", searchString);
			request.setAttribute("searchCount", totRecCnt);
		}
		else if(section.equals("pds")) {
			request.setAttribute("part", part);
		}
	}


}
