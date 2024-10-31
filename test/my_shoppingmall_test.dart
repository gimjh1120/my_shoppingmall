import 'dart:io';

//상품 목록, 가격 정의
Map<String, int> products = {
  'shirts': 45000,
  'onepiece': 30000,
  'short sleeved': 35000,
  'short pants': 38000,
  'socks': 5000
};

//장바구니 목록 정의
Map<String, int> cartList = {};

void main() {
  print('콘솔 쇼핑몰 프로그램 시작');

  while (true) {
    print('\n[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니의 총 가격 보기 / [4] 프로그램 종료');
    print('원하는 기능을 선택해 주세요.');
    stdout.write(':');
    String? fxChoice = stdin.readLineSync();

    if (fxChoice == null) {
      print('지원하지 않는 기능입니다 ! 다시 시도해 주세요.');
    }

    switch (fxChoice) {
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
  for (String name in products.keys) {
    int? price = products[name];
    print('$name | $price원');
  }
  print('*********************');
}

void addToCart() {
  print('\n상품명을 입력해주세요.');
  stdout.write(':');
  String? productName = stdin.readLineSync();

  if (productName == null || !products.containsKey(productName)) {
    print('입력값이 올바르지 않아요!');
    return;
  }

  print('\n상품 수량을 입력해주세요.');
  stdout.write(':');
  String? productAmount = stdin.readLineSync();

  if (productAmount == null || productAmount.isEmpty) {
    print('입력값이 올바르지 않아요!');
    return;
  }

  int? amount = 0;
  try {
    amount = int.parse(productAmount);
    if (amount <= 0) {
      print('0개보다 많은 개수의 상품만 담을 수 있어요!');
      return;
    }
  } catch (e) {
    print('올바른 숫자를 입력해 주세요!');
    return;
  }

  if (cartList.containsKey(productName)) {
    cartList[productName] = cartList[productName]! + amount;
  } else {
    cartList[productName] = amount;
  }

  print('\n$productName $amount개가 장바구니에 담겼어요!');
}

void showTotal() {
  if (cartList.isEmpty) {
    print('\n장바구니에 담긴 상품이 없습니다.');
  } else {
    List<String> cartListName = cartList.keys.toList();
    int total = 0;
    for (String name in cartList.keys) {
      int amount = cartList[name]!;
      int price = products[name]!;
      int cost = amount * price;
      total += cost;
    }
    print('\n장바구니에 $cartListName가 담겨있네요.');
    print('총 $total원 입니다!');
    print('\n상품 목록을 자세히 보고싶다면 [1]을 홈으로 돌아가고 싶다면 [2]를 입력해주세요.');
    String? detailList = stdin.readLineSync();

    if (detailList == '1') {
      print('***** 장바구니 *****');
      for (String name in cartList.keys) {
        int amount = cartList[name]!;
        int price = products[name]!;
        int cost = amount * price;
        print('$name | $amount개 | $cost원');
      }
      print('********************');
    } else if (detailList == '2') {
      return;
    } else {
      print('잘못된 입력입니다. 다시 입력해 주세요!');
    }
  }
}

void exitProgram() {
  print('정말 종료하시겠습니까? (5를 입력시 종료.)');
  String? exitConfirm = stdin.readLineSync();
  if (exitConfirm == '5') {
    print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
    exit(0);
  } else {
    print('종료하지 않습니다.');
  }
}
