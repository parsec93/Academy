package svc.apply;

import dao.ApplyDAO;
import dao.LectureDAO;
import dao.MemberDAO;
import vo.LectureBean;
import vo.MemberBean;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class ApplyBasketService {
	public void insertBasket(String member_id, String lecture_id) {
		System.out.println("바스켓서비스");
		Connection con = getConnection();
		ApplyDAO adao = ApplyDAO.getInstance();
		adao.setConnection(con);
		int lecture_idx = Integer.parseInt(lecture_id);
		adao.insertBasket(member_id, lecture_idx);
		
		commit(con);
		close(con);
		return;
		}
		
	
	
	public void deleteOverlap() {

		System.out.println("바스켓서비스");
		Connection con = getConnection();
		ApplyDAO adao = ApplyDAO.getInstance();
		adao.setConnection(con);
		adao.deleteOverlap();
		
		commit(con);
		close(con);
		
		return;
	}
	
	public List<LectureBean> selectBasketList(String sId){
		System.out.println("바스켓서비스");
		Connection con = getConnection();
		ApplyDAO adao = ApplyDAO.getInstance();
		adao.setConnection(con);
		List<LectureBean> lectureList=new ArrayList<LectureBean>();
		lectureList = adao.getBasketList(sId);
		
		close(con);
		
		return lectureList;
	}
	
	public void deleteBasket(String member_id, String lecture_id) {

		System.out.println("바스켓서비스");
		Connection con = getConnection();
		ApplyDAO adao = ApplyDAO.getInstance();
		adao.setConnection(con);
		int lecture_idx = Integer.parseInt(lecture_id);
		adao.deleteBasket(member_id, lecture_idx);
		
		commit(con);
		close(con);
		
		return;
	}
	
	public List<MemberBean> memberInfo(String sId){
		System.out.println("바스켓서비스");
		Connection con = getConnection();
		MemberDAO mdao = MemberDAO.getInstance();
		mdao.setConnection(con);
		List<MemberBean> memberInfo=new ArrayList<MemberBean>();
		memberInfo = mdao.getMemberInfo(sId);
		
		close(con);
		
		return memberInfo;
	}
}
