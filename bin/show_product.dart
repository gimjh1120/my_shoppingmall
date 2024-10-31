import 'my_shoppingmall.dart';

void showProducts() {
  print('\n******** 상품 목록 ********\n');
  for (var productList in products) {
    print('${productList.productName} | ${productList.productPrice}원');
  }
  print('\n***************************');
}
