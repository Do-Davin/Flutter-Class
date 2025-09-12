import 'dart:io';

Future<void> printorderMessage() async {
  print("Countdown is starting now :");
  var count = await fetchUserOrder();
  print("Let's count right now: $count");
}

Future<String> fetchUserOrder() {
  return Future.delayed(const Duration(seconds: 2), () => "Happy New Year!");
}

Future<void> countdown(int n) async {
  for (var i = n; i >= 0; i--) {
    print(i);
    await Future.delayed(const Duration(seconds: 2));
  }
}

Future<void> main() async {
  print("Let countdown from n to 0 ");
  stdout.write("Enter n number to countdown: ");
  int n = int.parse(stdin.readLineSync()!);
  await countdown(n);        
  await printorderMessage(); 
}
