import 'dart:async';

void countdown(int n) {
  Timer.periodic(Duration(seconds: 2), (timer) {
    if (n >= 0) {
      print(n);
      n--;
    } else {
      print("Happy New Year!");
      timer.cancel(); 
    }
  });
}

void main() {
  print("Starting countdown...");
  countdown(10);
}
