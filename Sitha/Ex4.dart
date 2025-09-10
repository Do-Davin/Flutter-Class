import 'dart:io';

class Student {
  int id;
  String name;
  int age;
  String gender;
  String major;

  Student(this.id, this.name, this.age, this.gender, this.major);
}

List<Student> students = [];

void main() {
  while (true) {
    showMenu();
    stdout.write("Enter your option: ");
    String? input = stdin.readLineSync();

    if (input == "1") {
      addStudent();
    } else if (input == "2") {
      viewStudents();
    } else if (input == "3") {
      updateStudent();
    } else if (input == "4") {
      deleteStudent();
    } else if (input == "5") {
      print("\nThank you for using our system!");
      break;
    } else {
      print("\nInvalid Input! Please enter number (1-5)\n");
    }
  }
}

void showMenu() {
  print("===== Menu =====");
  print("1. Add Student");
  print("2. View Student");
  print("3. Update Student");
  print("4. Delete Student");
  print("5. Quit");
}

void addStudent() {
  print("\n===== Add Student =====\n");
  stdout.write("ID: ");
  int id = int.parse(stdin.readLineSync()!);
  stdout.write("Name: ");
  String name = stdin.readLineSync()!;
  stdout.write("Age: ");
  int age = int.parse(stdin.readLineSync()!);
  stdout.write("Gender: ");
  String gender = stdin.readLineSync()!;
  stdout.write("Major: ");
  String major = stdin.readLineSync()!;

  students.add(Student(id, name, age, gender, major));
  print("\nSuccessfully Added Student!\n");
}

void viewStudents() {
  print("\n===== View Student =====\n");
  if (students.isEmpty) {
    print("No students available!\n");
  } else {
    for (int i = 0; i < students.length; i++) {
      print("Student #${i + 1}:");
      print("- ID: ${students[i].id}");
      print("- Name: ${students[i].name}");
      print("- Age: ${students[i].age}");
      print("- Gender: ${students[i].gender}");
      print("- Major: ${students[i].major}\n");
    }
  }
}

void updateStudent() {
  print("\n===== Update Student =====\n");
  stdout.write("Enter student ID: ");
  int id = int.parse(stdin.readLineSync()!);
  int index = students.indexWhere((s) => s.id == id);

  if (index != -1) {
    stdout.write("Name: ");
    String name = stdin.readLineSync()!;
    stdout.write("Age: ");
    int age = int.parse(stdin.readLineSync()!);
    stdout.write("Gender: ");
    String gender = stdin.readLineSync()!;
    stdout.write("Major: ");
    String major = stdin.readLineSync()!;

    students[index] = Student(id, name, age, gender, major);
    print("\nSuccessfully Updated Student Information!\n");
  } else {
    print("\nStudent not found!\n");
  }
}

void deleteStudent() {
  print("\n===== Delete Student =====\n");
  stdout.write("Enter student ID: ");
  int id = int.parse(stdin.readLineSync()!);
  int index = students.indexWhere((s) => s.id == id);

  if (index != -1) {
    students.removeAt(index);
    print("\nSuccessfully Deleted Student!\n");
  } else {
    print("\nStudent not found!\n");
  }
}
