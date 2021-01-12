package dto;
import java.io.Serializable;
/*
자바빈즈 작성할 때 규칙으로 java.io.Serializable 인터페이스를 구현
 - [ *** 인수가 없는 기본 생성자가 *** 있어야함 ]
 - 멤버변수인 프로퍼티에 대해 getter/setter() 메소드가 존재해야함
 - 위 메뉴에서 [ Source ] - Getter and Setters 메뉴 선택하여 자동으로 추가
*/
public class Product implements Serializable{

		private String productId;     // 상품 id
		private String pname;         //상품이름
		private Integer unitPrice;    //상품가격
		private String description;   // 상품설명
		private String manufacturer;  // 상품 제조사
		private String category;      //분류
		private long unitsInStock;    // 재고 수
		private String condition;     // 신상품 or 중고품 or 재생품
		
		private String filename;      // p, 239 [ 이미지 파일명 ]
		
		private int quantity;         // p,438 [ 장바구니에 담은 개수 ]
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		
		public String getFilename() {
			return filename;
		}
		public void setFilename(String filename) {
			this.filename = filename;
		}
		/*
		 [ 기본생성자 ] 자동으로 추가하는 방법은 [ Source ] - Generate Constructors from Superclass 메뉴클릭하고
		 창이 나타나면 'Object'를 선택하고 <Ok>를 클릭하여 [ 기본 생성자를 자동으로 추가 생성. ]
		*/
		public Product() { //[ 기본 생성자 ]를 자동으로 추가
			super();
		}
		/* 
		   상품아이디, 상품명, 상품가격을 매개변수로 하는 [ 생성자 생성 ].
		   자동으로 추가하는 방법은 [ Source ] - Generate Constructors Using Fields 클릭하고
		   상품아이디, 상품명, 상품가격만 선택하고 <ok> 클릭하면 생성자 자동으로 추가됨.
		 */
		public Product(String productId, String pname, Integer unitPrice) {
			super();
			this.productId = productId;
			this.pname = pname;
			this.unitPrice = unitPrice;
		}
		
		
		//위 메뉴에서 [ Source ] - Getter and Setters 메뉴 선택하여 자동으로 추가
		public String getProductId() {
			return productId;
		}
		public void setProductId(String productId) {
			this.productId = productId;
		}
		public String getPname() {
			return pname;
		}
		public void setPname(String pname) {
			this.pname = pname;
		}
		public Integer getUnitPrice() {
			return unitPrice;
		}
		public void setUnitPrice(Integer unitPrice) {
			this.unitPrice = unitPrice;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getManufacturer() {
			return manufacturer;
		}
		public void setManufacturer(String manufacturer) {
			this.manufacturer = manufacturer;
		}
		public String getCategory() {
			return category;
		}
		public void setCategory(String category) {
			this.category = category;
		}
		public long getUnitsInStock() {
			return unitsInStock;
		}
		public void setUnitsInStock(long unitsInStock) {
			this.unitsInStock = unitsInStock;
		}
		public String getCondition() {
			return condition;
		}
		public void setCondition(String condition) {
			this.condition = condition;
		}		
}
