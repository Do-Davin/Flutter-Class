import 'dart:io';

void main() {
  print("===== Welcome to Student Information System =====\n");
  stdout.write("Please enter your name: ");
  String name = stdin.readLineSync()!;

  stdout.write("Pleasen enter your age: ");
  int age = int.parse(stdin.readLineSync()!);

  stdout.write("Please enter your gender (M/F): ");
  String gender = stdin.readLineSync()!;

  stdout.write("Please put your score: ");
  double score = double.parse(stdin.readLineSync()!);

  stdout.write("Please put your grade: ");
  String grade = stdin.readLineSync()!;

  //First display format
  print("\n===== Student Information =====");
  print("Name: $name");
  print("Age: $age");
  print("Gender: $gender");
  print("Score: $score");
  print("Grade: $grade");

  //Second display format
  print("\n===== Student Information =====");
  print("Name\tAge\tGender\tScore\tGrade");
  print("$name\t$age\t$gender\t$score\t$grade");
}