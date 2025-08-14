package dao;

import java.util.List;


import dto.TransactionDTO;
import util.DBHelper;
import util.sql;

public class TransactionDAO extends DBHelper{
	private static final TransactionDAO INSTANCE = new TransactionDAO();
	
	public static TransactionDAO getInstance() {
		return INSTANCE;
		
	}
	public void insertAndUpdate(TransactionDTO dto) {
		try {
			
			
			
			conn = getConnection();
			
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(sql.INSERT_TRANSACTION);
			psmt.setString(1, dto.getT_a_no_1());
			psmt.setInt(1, dto.getT_dist());
			psmt.setInt(1, dto.getT_amount());
			psmt.executeUpdate();
			
			psmt1 = conn.prepareStatement(sql.UPDATE_ACCOUNT_PLUS);
			psmt1.setInt(1, dto.getT_amount());
			psmt1.setString(2, dto.getT_a_no_to());
			psmt1.executeUpdate();

			psmt1 = conn.prepareStatement(sql.UPDATE_ACCOUNT_MINUS);
			psmt1.setInt(1, dto.getT_amount());
			psmt1.setInt(2, dto.getT_no());
			psmt1.executeUpdate();
			
			conn.commit();
			
			closeAll();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e.printStackTrace();
			}
			
		}
		
		
	}
	public TransactionDTO select(int t_no) {
		return null;
	}
	public List<TransactionDTO> selectAll() {
		return null;
	}
	public void update(TransactionDTO dto) {}
	public void delete(String t_no) {}

}
