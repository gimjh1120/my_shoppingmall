import 'dart:io';

// 상품 정의
class Product {
  String name;
  int price;

  Product({required this.name, required this.price});
}

// 장바구니 항목 정의
class CartItem {
  Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}

// 상품 목록과 장바구니 초기화
List<Product> products = [
  Product(name: "Shirt", price: 45000),
  Product(name: "Onepiece", price: 30000),
  Product(name: "Short sleeved", price: 35000),
  Product(name: "Short pants", price: 38000),
  Product(name: "Socks", price: 5000)
];
List<CartItem> cart = [];

void main() {
  print('콘솔 쇼핑몰 프로그램 시작');
  while (true) {
    print('\n[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니의 총 가격 보기 / [4] 프로그램 종료');
    print('원하는 기능을 선택해 주세요.');

    String? inPut = stdin.readLineSync();

    if (inPut == null) {
      print('지원하지 않는 기능입니다! 다시 시도해 주세요.');
      continue;
    }

    switch (inPut) {
      case '1':
        showProducts();
        break;
      case '2':
        addToCart();
        break;
      case '3':
        showTotal();
        break;
      case '4':
        exitProgram();
        break;
      default:
        print('잘못된 입력입니다. 다시 입력해주세요.');
    }
  }
}

void showProducts() {
  print('\n***** 상품 목록 *****');
  for (var product in products) {
    print('${product.name} / ${product.price}원');
  }
  print('*********************');
}

void addToCart() {
  print('상품명을 입력해 주세요.');
  String? input = stdin.readLineSync();

  // 입력값이 null이거나 입력한 상품이 리스트에 없는 경우 예외 처리
  if (input == null || input.isEmpty) {
    print('올바른 상품명을 입력해 주세요.');
    return;
  }

  // 입력한 상품명이 `products` 리스트에 있는지 확인
  Product selectedProduct = products.firstWhere(
    (product) => product.name.toLowerCase() == input.toLowerCase(),
    orElse: () => Product(name: "Unknown", price: 0), // 기본 Product 반환
  );

  if (selectedProduct.name == 'Unknown') {
    print('해당 상품이 존재하지 않습니다.');
    return;
  }

  // 상품 수량 입력
  print('수량을 입력해 주세요:');
  String? quantityInput = stdin.readLineSync();
  int quantity = int.tryParse(quantityInput ?? '') ?? 0;

  if (quantity <= 0) {
    print('올바른 수량을 입력해 주세요.');
    return;
  }

  // 장바구니에 추가
  var cartItem = cart.firstWhere(
    (item) => item.product.name == selectedProduct.name,
    orElse: () => CartItem(product: selectedProduct, quantity: 0),
  );

  if (cart.contains(cartItem)) {
    cartItem.quantity += quantity;
  } else {
    cart.add(CartItem(product: selectedProduct, quantity: quantity));
  }

  print('${selectedProduct.name} $quantity개가 장바구니에 추가되었습니다.');
}

void showTotal() {
  if (cart.isEmpty) {
    print('장바구니가 비어 있습니다.');
    return;
  }

  int total = 0;
  print('\n***** 장바구니 *****');
  for (var item in cart) {
    int cost = item.product.price * item.quantity;
    total += cost;
    print('${item.product.name} - ${item.quantity}개 / ${cost}원');
  }
  print('총 합계: $total원');
}

void exitProgram() {
  print('프로그램을 종료합니다. 이용해 주셔서 감사합니다!');
  exit(0);
}
