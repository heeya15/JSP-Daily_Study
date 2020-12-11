package com.dao.ch1;
/*
  자바빈즈 작성할 때 규칙으로 java.io.Serializable 인터페이스를 구현
   - [ 인수가 없는 기본 생성자가 있어야함 ]
   - 멤버변수인 프로퍼티에 대해 getter/setter() 메소드가 존재해야함
   - 위 메뉴에서 [ Source ] - Getter and Setters 메뉴 선택하여 자동으로 추가
*/
public class Person implements java.io.Serializable {
	private int id= 201895005;
	private String name = "홍길순";  //멤버변수인 프로퍼티 [** private 접근 지정자로 설정 ** ]해야함
	 
	public Person() { // [ 인수가 없는 기본 생성자가 있어야함 ]
		
	}
	//멤버변수인 프로퍼티에 대해 getter/setter() 메소드가 존재해야함
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
