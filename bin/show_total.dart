import 'Dart:io';
import 'my_shoppingmall.dart';
import 'add_to_cart.dart';
import 'show_product.dart';

//장바구니의 총 가격 보기
void showTotal() {
  //총액 변수 생성
  int total = 0;

  // 장바구니가 비었는지 먼저 확인
  if (cart.isEmpty) {
    while (true) {
      print('\n장바구니가 비어 있습니다. 상품을 추가하시겠습니까?(y/n)');
      stdout.write(':');
      String? addInput = stdin.readLineSync();

      if (addInput == 'y' || addInput == 'Y') {
        showProducts();
        addToCart();
      } else if (addInput == 'n' || addInput == 'N') {
        print('상품을 추가하지 않습니다.');
        return; // 함수 종료
      } else {
        print('잘못 입력하셨습니다. 다시 입력해주세요.');
        // 반복문이기 때문에 처음으로 돌아가지 않고 다시 입력 요청
      }
    }
  }

  print('\n****** 장바구니 목록 ******\n');

  //장바구니에 추가된 값 출력
  for (var cartList in cart) {
    //각 상품 총 가격 = 장바구니 상품 수량 * 장바구니 상품 가격
    int productPrice = cartList.quantity * cartList.product.productPrice;
    print(
        '${cartList.product.productName} ${cartList.quantity}개 $productPrice원');

    //총액을 호출된 각 상품의 총 가격을 합산
    total += productPrice;
  }
  print('\n***************************\n');
  print('총 금액은 $total원 입니다.');
}
