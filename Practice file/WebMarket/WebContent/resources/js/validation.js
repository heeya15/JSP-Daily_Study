function CheckAddProduct() {
		
		var productId = document.getElementById("productId"); //상품 아이디
		var name = document.getElementById("name"); // 상품명
		var unitPrice = document.getElementById("unitPrice");// 상품 가격 
		var unitsInStock = document.getElementById("unitsInStock"); //재고 수
		
		/*
		상품 아이디 체크
		- 정규 표현식은 [반드시 P로 시작 ]하고 숫자를 조합하여 5~12자까지 조합.
		만약, 정규 표현식과 일치하지 않으면 [오류 메시지를 출력.]
		*/
		if(!check(/^P[0-9]{4,11}$/, productId,
		 "[상품 코드]\nP와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 P로 시작하세요")){ 
			return false;
		}
		// [ 상품명 ] 체크: 입력된 상품명의 문자 길이가 4글자보다 작거나 12자 이상이면 에러 메시지 출력.
		if(name.value.length <4 || name.value.length > 12){ 
			alert("[상품명]\n최소 4자에서 최대 12자까지 입력하세요.");
			name.select();
			name.focus();
			return false;
		}
		/*상품 가격 체크:
		 - 상품 가격의 [ 문자 길이가 0인경우 ] 에러메시지 출력. --> 가격을 입력하지 않은경우
		 - [ 숫자가 아닌경우 true로 ] 에러메시지 출력
		 즉, 가격이 숫자로만 구성된경우 [ 에러메시지 출력 x]
		*/
		if(unitPrice.value.length ==0 || isNaN(unitPrice.value)){ 
			alert("[가격]\n음수만 입력할 수 없습니다.");
			unitPrice.select();
			unitPrice.focus();
			return false;
		}//정수형은 한글자 이상, 소수점은있거나 없어도 되지만 있으면 [ 소수점 둘째자리까지만. ]
		else if(!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice,
		 "[가격]\n소수점 둘째 자리까지만 입력하세요")){
			return false; 
		}	
		//재고 수 체크 : 숫자만 입력하면 False로 [ if문 성립 x ]
		if(isNaN(unitsInStock.value)){ 
			alert("[재고 수]\n숫자만 입력하세요.");
			unitsInStock.select(); //전체 텍스트 필드가 선택
			unitsInStock.focus(); // 텍스트 창의 경우, [ 커서를 위치시켜 바로 입력이 가능 ]합니다.
			return false;
		}	
		
		//사용자 정의 함수로서, 정규 표현식으로 검사하여 [ 오류가 있으면 오류메시지를 출력 ] 시킴.
		function check(regExp, e, msg){
			
			if(regExp.test(e.value)){ //정규 표현식에 부합하면 정상적으로 출력
				return true;
			}
			alert(msg);
			e.select();
			e.focus();
			return false;
		}
		var form = document.newProduct;
		form.submit(); // 폼 페이지에 입력된 데이터 값을 서버로 전송.
}