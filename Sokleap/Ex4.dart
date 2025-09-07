import 'dart:io';

class Student {
  int id;
  String name;
  int age;
  String gender;
  String major;
  Student({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.major,
  });
}

void main() {
  int option = 0;
  Map<int, Student> studentList = {};
  while (option != 5) {
    print("=====Menu=====");
    print("1. Add Student");
    print("2. View Student");
    print("3. Update Student");
    print("4. Delete Student");
    print("5. Quit");
    stdout.write("Enter your option: ");
    option = int.parse(stdin.readLineSync()!);
    switch (option) {
      case 1:
        {
          print("\n===Add Student===\n");
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
          studentList[id] = new Student(
            id: id,
            name: name,
            age: age,
            gender: gender,
            major: major,
          );

          print("\nSuccessfully Added Student!\n");
          break;
        }
      case 2:
        {
          print("\n===View Student===\n");

          if (studentList.isEmpty) {
            print("\nNo student exist!\n");
          } else {
            int index = 1;
            for (var s in studentList.entries) {
              print("Student #${index}:");
              print("-ID: ${s..value.id}");
              print("-Name: ${s.value.name}");
              print("-Age: ${s.value.age}");
              print("-Gender: ${s.value.gender}");
              print("-Major: ${s.value.major}\n");
              index++;
            }
          }
          break;
        }
      case 3:
        {
          print("\n===Update Student===\n");

          stdout.write("Enter student ID: ");
          int id = int.parse(stdin.readLineSync()!);
          bool isFound = studentList.containsKey(id);
          if (!isFound) {
            print("\nStudent Not Found!\n");
          } else {
            print("Update Information:\n");

            stdout.write("-Name: ");
            String name = stdin.readLineSync()!;
            stdout.write("-Age: ");
            int age = int.parse(stdin.readLineSync()!);
            stdout.write("-Gender: ");
            String gender = stdin.readLineSync()!;
            stdout.write("-Major: ");
            String major = stdin.readLineSync()!;
            studentList.update(
              id,
              (value) => Student(
                id: id,
                name: name,
                age: age,
                gender: gender,
                major: major,
              ),
            );
            print("\nSuccessfully Updated Student Information!\n");
          }
          break;
        }

      case 4:
        {
          print("\n===Delete Student===\n");

          stdout.write("Enter student ID: ");
          int id = int.parse(stdin.readLineSync()!);
          bool isRemoved = studentList.remove(id) != null ? true : false;
          isRemoved
              ? print("\nSuccessfully Deleted Student!\n")
              : print("\nStudent Not Found!\n");
          break;
        }
      case 5:
        {
          print("\nThank you for using our system!");
          break;
        }
      default:
        {
          print("\nInvalid Input! Please enter number (1-5)\n");
          break;
        }
    }
  }
}
