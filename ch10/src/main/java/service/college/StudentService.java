package service.college;

import java.util.List;

import dao.college.StudentDAO;
import dto.college.StudentDTO;

public enum StudentService {
	INSTANCE;
	
	
private StudentDAO dao = StudentDAO.getinstance(); 
	
		
	public void register(StudentDTO dto) {
		
	}
	
	public StudentDTO selectStudent(String stdNo) {
		
		return null;
	}
	
	public List<StudentDTO> selectAllStudent() {
	
		return null;
	}
	
	public void updateStudent(StudentDTO dto) {
	
		
	}
	
	public void deleteStudent(StudentDTO dto) {
	
	}
	}
