package svc.member;

import dao.MemberDAO;
import static db.JdbcUtil.*;

import java.sql.Connection;

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
}
