package random;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;
import member.MemberVO;

public class RandomDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	MemberVO vo = null;	
	
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {} 
			finally {
				pstmtClose();
			}
		}
	}

	// 아이디체크
	public MemberVO getMemberIdCheck(String mid) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member2 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setPhoto(rs.getString("photo"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 랜덤 장소 꺼내오기
	public PlaceVO getRandomPlace(int idx) {
		PlaceVO vo = new PlaceVO(); 
		try {
			sql = "select * from place where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setJiyok(rs.getString("jiyok"));
				vo.setJangso(rs.getString("jangso"));
				vo.setImg(rs.getString("img"));
				vo.setStory(rs.getString("story"));
				vo.setNickName(rs.getString("nickName"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// DB에 들어있는 모든 장소 정보 읽어오기
	public ArrayList<PlaceVO> getAllPlace() {
		ArrayList<PlaceVO> vos = new ArrayList<PlaceVO>();
		try {
			sql = "select * from place order by idx";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PlaceVO vo = new PlaceVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setJiyok(rs.getString("jiyok"));
				vo.setJangso(rs.getString("jangso"));
				vo.setImg(rs.getString("img"));
				vo.setStory(rs.getString("story"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return vos;
	}

	//랜덤 장소 추천
	public int setRandomInputOk(PlaceVO vo) {
		int res = 0;
		try {
			sql = "insert into place values (default,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getJiyok());
			pstmt.setString(2, vo.getJangso());
			pstmt.setString(3, vo.getImg());
			pstmt.setString(4, vo.getStory());
			pstmt.setString(5, vo.getNickName());
			
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

}
