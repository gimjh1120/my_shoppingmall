import 'dart:io';

void exitProgram() {
  while (true) {
    // 반복문을 사용하여 올바른 입력이 들어올 때까지 반복
    print('정말 프로그램을 종료하시겠습니까?(y/n)');
    stdout.write(':');
    String? input = stdin.readLineSync();

    if (input == 'y' || input == 'Y') {
      exit(0);
    } else if (input == 'n' || input == 'N') {
      print('프로그램을 종료하지 않습니다.');
      return; // 함수 종료
    } else {
      print('잘못 입력하셨습니다. 다시 입력해주세요.');
      // 반복문이기 때문에 처음으로 돌아가지 않고 다시 입력 요청
    }
  }
}
