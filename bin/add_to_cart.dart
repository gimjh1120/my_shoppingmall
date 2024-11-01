import 'dart:io';
import 'my_shoppingmall.dart';

//장바구니에 담기
void addToCart() {
  print('\n상품명을 입력해 주세요.');
  stdout.write(':');
  String? input = stdin.readLineSync();

  //입력 값이 null이거나 빈 값일 경우
  if (input == null || input.isEmpty) {
    print('\n올바른 상품명을 입력해 주세요.');
    return;
  }

  //입력 값이 products 리스트에 있는지 확인
  var inputProduct = products.firstWhere(
    (product) => product.productName == input,
    orElse: () => Product(productName: 'null', productPrice: 0),
  );

  //리스트에 없는 경우
  if (inputProduct.productName == 'null') {
    print('\n해당 상품이 존재하지 않습니다.');
    return;
  }

  //상품 수량 입력
  print('\n상품 개수를 입력해 주세요');
  stdout.write(':');
  String? inputQuantity = stdin.readLineSync();

  //입력한 값이 null이거나 빈 값인 경우
  if (inputQuantity == null || inputQuantity.isEmpty) {
    print('\n입력값이 올바르지 않아요!');
    return;
  }

  //입력한 값을 int로 변환
  //?? ''은 String inputQuantity의 값이 null인 경우 ''으로 반환
  //?? 0은 int inputQuantity의 값이 null인 경우 0으로 반환
  int intQuantity = int.tryParse(inputQuantity ?? '') ?? 0;

  //입력한 값이 0보다 작거나 같은 경우
  if (intQuantity <= 0) {
    print('\n올바른 수량을 입력해 주세요.');
    return;
  }

  //입력한 상품명과 상품 개수를 cart에 추가
  var cartItem = cart.firstWhere(
    (item) => item.product.productName == inputProduct.productName,
    orElse: () => CartItem(product: inputProduct, quantity: 0),
  );

  //cart에 상품이 담겨있는 경우 담겨있는 상품 개수에 입력한 상품 개수 추가
  if (cart.contains(cartItem)) {
    cartItem.quantity += intQuantity;
  }
  //cart에 상품이 담겨있지 않은 경우 상품, 개수 추가
  else {
    cart.add(CartItem(product: inputProduct, quantity: intQuantity));
  }

  print('\n장바구니에 ${inputProduct.productName} $intQuantity개 추가되었습니다.');
}
