package ch10.bean;

public class TestBean {
	
	// 프로퍼티
	private String name;

	
	// 기본 생성자
	public TestBean() {
		super();
		
	}

	public TestBean(String name) {
		super();
		this.name = name;
	}

	// 게터 메소드
	public String getName() {
		return name;
	}
	
	
	// 세터 메소드
	public void setName(String name) {
		this.name = name;
	}

	
	@Override
	public String toString() {
		return "TestBean [name=" + name + "]";
	}

}
