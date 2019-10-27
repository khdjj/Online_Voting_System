package pojo;

public class Data {

	private String options;
	private String sex;
	private int count;
	private String age;
	private String city;
	
	
	
	
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Data() {
		super();
	}

	public Data(String options, String sex, int count) {
		super();
		this.options = options;
		this.sex = sex;
		this.count = count;
	}
	
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
