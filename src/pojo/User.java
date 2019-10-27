package pojo;

public class User {

	private String phone;
	private String userId;
	private String username;
	private String pwd;
	private int status;
	private String age;
	private String sex;
	private String city;
	private int apply;
	
	public User() {
		super();
	}

	
	
	public User(String phone, String userId, String username, String pwd,
			String age, String city ,String sex,int apply) {
		super();
		this.phone = phone;
		this.userId = userId;
		this.username = username;
		this.pwd = pwd;
		this.age = age;
		this.sex = sex;
		this.city = city;
		this.apply = apply;
	}
	
	
	public User(String phone, String userId, String username, String pwd,
			int status, String age, String sex, String city) {
		super();
		this.phone = phone;
		this.userId = userId;
		this.username = username;
		this.pwd = pwd;
		this.status = status;
		this.age = age;
		this.sex = sex;
		this.city = city;
	}




	


	public int getStatus() {
		return status;
	}




	public void setStatus(int status) {
		this.status = status;
	}




	public int getApply() {
		return apply;
	}




	public void setApply(int apply) {
		this.apply = apply;
	}




	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}





	public String getCity() {
		return city;
	}





	public void setCity(String city) {
		this.city = city;
	}





	public User(String phone, String userId, String username, String pwd,
			String age, String city ,String sex) {
		super();
		this.phone = phone;
		this.userId = userId;
		this.username = username;
		this.pwd = pwd;
		this.age = age;
		this.sex = sex;
		this.city = city;
	}


	public User(String phone, String userId, String username, String pwd) {
		super();
		this.phone = phone;
		this.userId = userId;
		this.username = username;
		this.pwd = pwd;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}




	@Override
	public String toString() {
		return "User [phone=" + phone + ", userId=" + userId + ", username="
				+ username + ", pwd=" + pwd + ", status=" + status + ", age="
				+ age + ", sex=" + sex + ", city=" + city + ", apply=" + apply
				+ "]";
	}




}
