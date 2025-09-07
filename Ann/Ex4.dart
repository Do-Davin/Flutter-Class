import 'dart:io';

class Student {
  int id;
  String name;
  int age;
  String gender;
  String major;

  Student(this.id, this.name, this.age, this.gender, this.major);

  void display(int index) {
    print("Student #${index + 1}");
    print("ID: $id");
    print("Name: $name");
    print("Age: $age");
    print("Gender: $gender");
    print("Major: $major\n");
  }
}

List<Student> students = [];

void main() {
  menu();
}

void menu() {
  while (true) {
    print("\n===== Student Management Menu =====");
    print("1. Add Student");
    print("2. View Students");
    print("3. Update Student");
    print("4. Delete Student");
    print("5. Quit");
    stdout.write("Enter your option: ");

    int? opt = int.tryParse(stdin.readLineSync() ?? "");
    if (opt == null) {
      print("Invalid input! Please enter a number.");
      continue;
    }

    switch (opt) {
      case 1:
        addStudent();
        break;
      case 2:
        viewStudents();
        break;
      case 3:
        updateStudent();
        break;
      case 4:
        deleteStudent();
        break;
      case 5:
        print("Thank you for using our system.");
        return;
      default:
        print("Invalid option. Try again.");
    }
  }
}

void addStudent() {
  print("\n==== Add Student ====");
  stdout.write("ID: ");
  String? id = stdin.readLineSync();
  stdout.write("Name: ");
  String? name = stdin.readLineSync();
  stdout.write("Age: ");
  String? age = stdin.readLineSync();
  stdout.write("Gender: ");
  String? gender = stdin.readLineSync();
  stdout.write("Major: ");
  String? major = stdin.readLineSync();

  if ((id == null ||
          name == null ||
          age == null ||
          gender == null ||
          major == null) ||
      (id.trim().isEmpty ||
          name.trim().isEmpty ||
          age.trim().isEmpty ||
          gender.trim().isEmpty ||
          major.trim().isEmpty)) {
    print("No input detected. Try again.");
    return;
  }
  int? idf = int.tryParse(id);
  int? agef = int.tryParse(age);
  if (idf == null || agef == null) {
    print("Invalid ID or Age! Please enter numbers.");
    return;
  }
  students.add(Student(idf, name, agef, gender, major));
  print(" Student added successfully! :)");
}

void viewStudents() {
  print("\n==== View Students ====\n");
  if (students.isEmpty) {
    print("No students found. :(");
    return;
  }

  for (int i = 0; i < students.length; i++) {
    students[i].display(i);
  }
}

void updateStudent() {
  print("\n==== Update Student ====");
  stdout.write("Enter student ID to update: ");
  int? stuID = int.tryParse(stdin.readLineSync() ?? "");
  if (stuID == null) {
    print("Invalid input.");
    return;
  }

  for (int i = 0; i < students.length; i++) {
    if (students[i].id == stuID) {
      print("Updating Student #${i + 1}");
      stdout.write("New Name (leave blank to keep '${students[i].name}'): ");
      String? newName = stdin.readLineSync();
      stdout.write("New Age (leave blank to keep '${students[i].age}'): ");
      String? newAge = stdin.readLineSync();
      stdout.write(
        "New Gender (leave blank to keep '${students[i].gender}'): ",
      );
      String? newGender = stdin.readLineSync();
      stdout.write("New Major (leave blank to keep '${students[i].major}'): ");
      String? newMajor = stdin.readLineSync();

      // Only update if user typed something
      if (newName != null && newName.isNotEmpty) students[i].name = newName;
      if (newAge != null && newAge.isNotEmpty) {
        int? age = int.tryParse(newAge);
        if (age != null) students[i].age = age;
      }
      if (newGender != null && newGender.isNotEmpty)
        students[i].gender = newGender;
      if (newMajor != null && newMajor.isNotEmpty) students[i].major = newMajor;

      print(" Student updated successfully! :)");
      return;
    }
  }

  print(" Student with ID $stuID not found.");
}

void deleteStudent() {
  print("\n==== Delete Student ====");
  stdout.write("Enter student ID to delete: ");
  int? stuID = int.tryParse(stdin.readLineSync() ?? "");
  if (stuID == null) {
    print("Invalid input.");
    return;
  }

  for (int i = 0; i < students.length; i++) {
    if (students[i].id == stuID) {
      students.removeAt(i);
      print(" Student deleted successfully! :(");
      return;
    }
  }

  print(" Student with ID $stuID not found. :(");
}
