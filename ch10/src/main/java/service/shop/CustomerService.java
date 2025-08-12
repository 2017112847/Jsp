package service.shop;

import java.util.List;

import dao.shop.CustomerDAO;
import dto.shop.CustomerDTO;

// 열거형으로 실글톤 객체 생성
public enum CustomerService {
	
	INSTANCE;
	
	private CustomerDAO dao = CustomerDAO.getinstance();
	
	
	
public void register(CustomerDTO dto) {
		dao.insertCustomer(dto);
	}
	public CustomerDTO findById(String cid) {
		return dao.selectCustomer(cid);
	}
	public List<CustomerDTO> findAll() {
		return dao.selectAllCustomer();
	}
	public void midfy(CustomerDTO dto) {
		dao.updateCustomer(dto);
	}
	public void delete(String cid) {
		dao.deleteCustomer(cid);
	}
	
	
	

}
