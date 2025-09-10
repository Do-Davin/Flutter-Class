import 'dart:async';

Future<void> countdown(int n) async {
  while (n >= 0) {
    print(n);
    await Future.delayed(Duration(seconds: 2));
    n--;
  }
}

void main() async {
  print("Starting countdown...");
  await countdown(10);
  print("Happy New Year!");
}
