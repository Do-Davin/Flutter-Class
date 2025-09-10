import 'dart:async';

Future<void> countdown(int n) async {
  for(int i = n; i >= 0; i--) {
    print(i);
    await Future.delayed(Duration(seconds: 2));
  }
  print("Happy New Year!!!!");
}

void main() async {
  await countdown(10);
  await Future.delayed(Duration(seconds: 1));
  print("DONE");
}