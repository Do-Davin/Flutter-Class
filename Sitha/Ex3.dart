import 'dart:io';

void main() {
  stdout.write("Enter your score (0-100): ");
  int score = int.parse(stdin.readLineSync()!);

  if (score < 0 || score > 100) {
    print("Invalid input, please try again.");
  } else if (score >= 90) {
    print("Grade: A");
  } else if (score >= 80) {
    print("Grade: B");
  } else if (score >= 70) {
    print("Grade: C");
  } else if (score >= 60) {
    print("Grade: D");
  } else if (score >= 50) {
    print("Grade: E");
  } else {
    print("Grade: F");
  }
}
