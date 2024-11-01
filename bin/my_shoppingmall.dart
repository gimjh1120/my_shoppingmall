import 'dart:io';
import 'show_product.dart';
import 'add_to_cart.dart';
import 'show_total.dart';
import 'exit_program.dart';

class Product {
  String productName;
  int productPrice;

  Product({required this.productName, required this.productPrice});
}

class CartItem {
  Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}

List<Product> products = [
  Product(productName: '셔츠', productPrice: 45000),
  Product(productName: '원피스', productPrice: 30000),
  Product(productName: '반팔', productPrice: 35000),
  Product(productName: '반바지', productPrice: 38000),
  Product(productName: '양말', productPrice: 5000)
];

List<CartItem> cart = [];

void main() {
  print('콘솔 쇼핑몰 프로그램 시작');
  while (true) {
    print('\n[1] 상품 목록  보기/ [2] 장바구니에 담기 / [3] 장바구니의 총 가격 보기 / [4] 프로그램 종료');
    print('원하는 기능을 선택해 주세요.');
    stdout.write(':');
    String? input = stdin.readLineSync();

    if (input == null) {
      print('지원하지 않는 기능입니다! 다시 시도해 주세요.');
      return;
    }

    switch (input) {
      case '1':
        showProducts();
        //print('[1] 상품 목록  보기');
        break;
      case '2':
        addToCart();
        //print('[2] 장바구니에 담기');
        break;
      case '3':
        showTotal();
        //print('[3] 장바구니의 총 가격 보기');
        break;
      case '4':
        exitProgram();
        //print('프로그램을 종료합니다. 이용해 주셔서 감사합니다!');
        break;
      default:
        print('잘못된 입력입니다. 다시 입력해주세요!');
    }
  }
}
