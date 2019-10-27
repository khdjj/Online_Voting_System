package pojo;

public class Options {

	private String optionsId;
	private String options;
	private int num;
	private String sex;
	private String city;
	private int age;
	private String img;

	public Options() {
		super();
	}



	public String getImg() {
		return img;
	}



	public void setImg(String img) {
		this.img = img;
	}



	public Options(String optionsId, String options, int num, String sex,
			String city, int age) {
		super();
		this.optionsId = optionsId;
		this.options = options;
		this.num = num;
		this.sex = sex;
		this.city = city;
		this.age = age;
	}



	public String getOptionsId() {
		return optionsId;
	}



	public void setOptionsId(String optionsId) {
		this.optionsId = optionsId;
	}



	public String getOptions() {
		return options;
	}



	public void setOptions(String options) {
		this.options = options;
	}



	public int getNum() {
		return num;
	}



	public void setNum(int num) {
		this.num = num;
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



	public int getAge() {
		return age;
	}



	public void setAge(int age) {
		this.age = age;
	}



	@Override
	public String toString() {
		return "Options [optionsId=" + optionsId + ", options=" + options
				+ ", num=" + num + ", sex=" + sex + ", city=" + city + ", age="
				+ age + "]";
	}
	
}
