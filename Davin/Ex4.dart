import 'dart:io';

class Student {
  int id;
  String name;
  int age;
  String gender;
  String major;

  Student(this.id, this.name, this.age, this.gender, this.major);
}

void main() {
  List <Student> studentList = [];
  int option;

  do {
    print("=====Menu=====");
    print("1. Add Student");
    print("2. View Student");
    print("3. Update Student");
    print("4. Delete Student");
    print("5. Quit");
    stdout.write("Enter your option: ");
    option = int.parse(stdin.readLineSync()!);

    switch(option) {
      case 1: {
        print("\n===Add Student===");
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
        studentList.add(new Student(id, name, age, gender, major));

        print("\nSuccessfully Added Student!\n");
        break;
      }
      case 2: {
        print("\n===View Student===");

        if(studentList.isEmpty) {
          print("\nStudent not available.\n");
        } else {
          for(int i = 0; i < studentList.length; i++) {
            var s = studentList[i];
            print("Student #${i + 1}:");
            print("-ID: ${s.id}");
            print("-Name: ${s.name}");
            print("-Age: ${s.age}");
            print("-Gender: ${s.gender}");
            print("-Major: ${s.major}\n");
          }
        }
        break;
      }
      case 3: {
        print("\n===Update Student===");

        stdout.write("Enter student ID: ");
        int id = int.parse(stdin.readLineSync()!);
        bool found = false;

        for(int i = 0; i < studentList.length; i++) {

          if(id == studentList[i].id) {
            print("Update Information:\n");

            stdout.write("-Name: ");
            String name = stdin.readLineSync()!;
            stdout.write("-Age: ");
            int age = int.parse(stdin.readLineSync()!);
            stdout.write("-Gender: ");
            String gender = stdin.readLineSync()!;
            stdout.write("-Major: ");
            String major = stdin.readLineSync()!;
            studentList[i] = Student(id, name, age, gender, major);

            print("\nSuccessfully Updated Student Information!\n");
            found = true;
          }         
        }

        if(!found) {
          print("\nID not found!\n");
        }
        break;
      }
      case 4: {
        print("\n===Delete Student===");

        stdout.write("Enter student ID: ");
        int id = int.parse(stdin.readLineSync()!);
        bool removed = false;

        for(int i = 0; i < studentList.length; i++) {
          if(id == studentList[i].id) {
            studentList.removeAt(i);
            print("\nSuccessfully Deleted Student!\n");
            removed = true;
          }
        }

        if(!removed) {
          print("\nID not found!\n");
        }
        break;
      }
      case 5: {
        print("Thank you for using our system!");
        break;
      }
      default: {
        print("\nInvalid Input! Please enter number (1-5)\n");
        break;
      }
    }

  } while(option != 5);
}