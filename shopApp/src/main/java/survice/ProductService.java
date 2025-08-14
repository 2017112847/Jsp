package survice;

import java.util.List;

import dao.CustomerDAO;
import dao.ProductDAO;
import dto.CustomerDTO;
import dto.ProductDTO;

public enum ProductService {
	INSTANCE;
	
	private ProductDAO dao = ProductDAO.getInstance();
	
	// DAO 요청메소드
	public void rigester(ProductDTO dto) {
	dao.insertProduct(dto);
		
	}
	public ProductDTO findById(int prodNo) {
		return dao.selectProduct(prodNo);
	}
	public List<ProductDTO> findAll() {
		return dao.selectAllProduct();
	}
	public void modify(ProductDTO dto) {
		dao.updateProduct(dto);
		
	}
//	public void delete(String custId) {
//		dao.deleteProduct(custId);
//	}
//	

}
