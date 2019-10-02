package svc.member;

import dao.LectureDAO;
import dao.MemberDAO;
import vo.LectureBean;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class MemberBasketService {
	public void insertBasket(String member_id, String lecture_id) {

		System.out.println("바스켓서비스");
		Connection con = getConnection();
		MemberDAO mdao = MemberDAO.getInstance();
		mdao.setConnection(con);
		int lecture_idx = Integer.parseInt(lecture_id);
		mdao.insertBasket(member_id, lecture_idx);
		
		commit(con);
		close(con);
		
		return;
	}
	
	public List<LectureBean> selectBasketList(String sId){
		System.out.println("바스켓서비스");
		Connection con = getConnection();
		LectureDAO lectureDAO = LectureDAO.getInstance();
		lectureDAO.setConnection(con);
		List<LectureBean> lectureList=new ArrayList<LectureBean>();
		lectureList = lectureDAO.getBasketList(sId);
		
		close(con);
		
		return lectureList;
	}
	
	public void deleteBasket(String member_id, String lecture_id) {

		System.out.println("바스켓서비스");
		Connection con = getConnection();
		MemberDAO mdao = MemberDAO.getInstance();
		mdao.setConnection(con);
		int lecture_idx = Integer.parseInt(lecture_id);
		mdao.deleteBasket(member_id, lecture_idx);
		
		commit(con);
		close(con);
		
		return;
	}
	
}
