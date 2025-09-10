import 'dart:io';

class ToDoList {
  int id;
  String desc;
  bool done;
  ToDoList(this.id, this.desc, {this.done = false});
}

void clear() {
  // \x1B = ESC
  // [2J = clear screen
  // [0;0H = move cursor to top-left
  print("\x1B[2J\x1B[0;0H");
}

void menu() {
  print("=== To-Do List Application ===");
  print("1. Add Task");
  print("2. Mark Task as Done");
  print("3. Delete Task");
  print("4. View All Tasks");
  print("5. Exit");
  print("-------------------------------");
  stdout.write("Enter your choice: ");
}

void addTask() {
  List<ToDoList> lists = [];
  stdout.write("Enter task description: ");
  String desc = stdin.readLineSync()!;
  int id = lists.length + 1;
  lists.add(new ToDoList(id, desc));
  print("✅ Task added successfully!");
}

void AppProcess() {
  String? input;
  int? choice;
  do {
    menu();
    input = stdin.readLineSync();
    if(input == null || input.trim().isEmpty) {
      clear();
      print("Please input number only!\n");
      continue;
    }
    choice = int.tryParse(input);
    switch(choice) {
      case 1: {
        print("Choice: 1");
        break;
      }
      case 2: {
        print("Choice: 2");
        break;
      }
      case 3: {
        print("Choice: 3");
        break;
      }
      case 4: {
        print("Choice: 4");
        break;
      }
      case 5: {
        print("👋 Exiting To-Do List App. Goodbye!");
        break;
      }
      default: {
        print("Choice: Default");
        break;
      }
    }
  } while(choice != 5);
}

void main() {
  AppProcess();
}