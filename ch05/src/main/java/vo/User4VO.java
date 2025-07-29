package vo;

public class User4VO {
	
	private String gender;
	private String name;
	private String addr;
	private int age;
	
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "User4VO [gender=" + gender + ", name=" + name + ", addr=" + addr + ", age=" + age + "]";
	}
	
	


}
