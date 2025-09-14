import 'dart:async';

Future<void> countdown(int n) async {
  for (int i = n; i >= 0; i--) {
    print(i);
    await Future.delayed(Duration(seconds: 1));
  }
  print("Happy New Year!");
}

Future<void> main() async {
  print("Starting Countdown...");
  await countdown(10);
}
