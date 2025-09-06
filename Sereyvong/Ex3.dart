import 'dart:io';

void main() {
  while (true) {
    stdout.write("Enter your score (0-100): ");
    int score = int.parse(stdin.readLineSync()!);

    if (score < 0 || score > 100) {
      print("Invalid input please try again");
    } else if (score >= 90) {
      print("Grade: A\n");
    } else if (score >= 80) {
      print("Grade: B\n");
    } else if (score >= 70) {
      print("Grade: C\n");
    } else if (score >= 60) {
      print("Grade: D\n");
    } else if (score >= 50) {
      print("Grade: E\n");
    } else {
      print("Grade: F\n");
    }
  }
}
