package service;

import java.util.List;

import dao.User1DAO;
import dto.User1DTO;

// service
//	-컨트롤러의 부가적인 비즈니스 처리를 담당
// 	-컨트롤러의 요청을 받아 dao를 호출, 컨트롤러와 dao의 중간 매개 컴포넌트
public class User1Service {	
	
	private static User1Service instance = new User1Service();
	public static User1Service getInstance() {
		return instance;
	}
	private User1Service() {}
	
	private User1DAO dao = User1DAO.getInstance();
	
	
	//dao 메소드 호출
	public void register(User1DTO dto) {
		dao.insertUser1(dto);
	}	
	public User1DTO findById(String user_id) {
		return dao.selectUser1(user_id);
	}
	public List<User1DTO> findAll() {
		return dao.selectAllUser1();
	}
	public void modify(User1DTO dto) {
		dao.updatetUser1(dto);
	}
	public void delete(String user_id) {
		dao.deleteUser1(user_id);
	}
	
	
}
