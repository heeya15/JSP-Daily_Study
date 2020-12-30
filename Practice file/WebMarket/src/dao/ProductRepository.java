package dao;
import java.util.ArrayList;
import dto.Product;
public class ProductRepository {
	//[ 상품 목록을 저장 ]하기 위한 ArrayList<Product> 객체 타입의 변수 [ listOfProduct를 작성 ]
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	//아래 9번줄은 p, 206 ProductRepository 클래스의 [ 기본 생성자에 대한 ] **객체변수** 작성.
	private static ProductRepository instance = new ProductRepository();
	public static ProductRepository getInstance() { //객체 변수 instance에 대한 Getter() 메소드를 작성
		return instance;
	}
	
	public void addProduct(Product product) { //객체 변수 listOfProducts에 새로운 상품 정보를 등록하는 메소드.
		listOfProducts.add(product);
	}
	//위에까지 p, 206 부분
	public ProductRepository() { //기본생성자 생성
		//3개의 [ 상품 정보를 설정 ]하고 ArrayList<Product> 객체 타입의 변수 [ listOfProduct에 저장하도록 작성 ].
		Product phone = new Product("P1234", "iPhone 6s", 800000);
		phone.setDescription("4.7-inch, 1334X750 Renina HD display,8-megapixel iSight Camera");
		phone.setCategory("Smart Phone"); //분류
		phone.setManufacturer("Apple"); //제조회사 
		phone.setUnitsInStock(1000); //재고수 1000개 
		phone.setCondition("New");
		phone.setFilename("P1234.png"); //p, 240 상품 이미지를 설정하도록 추가 작성.
		
		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display,5-rd Generation Intel Core processors");
		notebook.setCategory("Notebook"); //분류
		notebook.setManufacturer("LG"); //제조회사 
		notebook.setUnitsInStock(1000); //재고수 1000개 
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");
		
		Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
		tablet.setDescription("212.8*125.6*6.6mm, Super AMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet"); //분류
		tablet.setManufacturer("Samsung"); //제조회사 
		tablet.setUnitsInStock(1000); //재고수 1000개 
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);	
		
	}
	/*
	  [ ** 상품 목록 **을 가져오는 ] 메소드 만들기 
	  객체 타입의 변수 listOfProducts 에 [ 저장된 모든 상품 목록을 가져오는 ] getAllProducts()메소드를 작성
	 */
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	/* p, 173 [ 상품 상세 정보를 가져오는 ] 메소드 만들기 부분
	   1. 45행에서 60행까지는 listOfProducts에 [ 저장된 모든 상품 목록 ]에서 
	   2. [ 상품 아이디와 [ 일치하는 상품을 가져오는 ] ] getProductById() 메소드를 작성 
	*/
	public Product getProductById(String productId) {
		Product productById = null;
		
		for (int i=0; i<listOfProducts.size();i++) {
			Product product =listOfProducts.get(i);
			//  product 객체에 있는 상품목록중 상품 id가 [ 인수로 넘어온 id와 ] 일치하는경우 
			// [ 해당 상품아이디를 ] 리턴한다(가져온다).
			if(product !=null && product.getProductId()!=null
			   && product.getProductId().equals(productId)) { 
				productById = product;
				break;
			}//if 믄 블록 닫기 
		}//for 문블록 닫기
		return productById;	
	}	
	
}
