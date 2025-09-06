import 'dart:io';

void main() {

  while (true) {
    stdout.write("Enter your score (0-100) or type 'q' to quit: ");
    String? input = stdin.readLineSync();
    if (input == null || input.trim().isEmpty) {
      print("No input detected. Try again.");
      continue;
    }
    if (input.trim().toLowerCase() == 'q') {
      print("Exiting program. Goodbye!");
      break;
    }
    //tryParse: Convert string into integer or double
    double? score = double.tryParse(input);
    if (score == null) {
      print("Invalid input. Please enter a valid number.");
      continue;
    }
    if (score < 0 || score > 100) {
      print("Score must be between 0 and 100.");
      continue;
    }
    print("Grade: ${getGrade(score)}");
  }

}

String getGrade(double score) {
  if (score >= 90) return 'A';
  if (score >= 80) return 'B';
  if (score >= 70) return 'C';
  if (score >= 60) return 'D';
  if (score >= 50) return 'E';
  return 'F';
}