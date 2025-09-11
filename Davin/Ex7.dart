import 'dart:io';

class ToDoList {
  int id;
  String desc;
  bool done;
  ToDoList(this.id, this.desc, {this.done = false});
}

  List<ToDoList> lists = [];

void clear() {
  // \x1B = ESC
  // [2J = clear screen
  // [0;0H = move cursor to top-left
  print("\x1B[2J\x1B[0;0H");
}

void pause() {
  stdout.write("\nPress Enter to continue...");
  stdin.readLineSync(); // waits until user presses Enter
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
  String? desc;
  while(true) {
    stdout.write("👉 Enter task description: ");
    desc = stdin.readLineSync();
    if(desc == null || desc.trim().isEmpty) {
      clear();
      print("⚠️  Please input some description!\n");
      continue;
    } else {
      break;
    }
  }

  int id = lists.length + 1;
  lists.add(ToDoList(id, desc));
  print("\n✅ Task added successfully!");
  pause();
  clear();
}

void markAsDone() {
  if(lists.isEmpty) {
    print("❌ No tasks available.");
    pause();
    clear();
    return;
  }

  int? targetID;
  String? input;
  while(true) {
    stdout.write("👉 Enter task number to mark as done: ");
    input = stdin.readLineSync();
    if(input == null || input.trim().isEmpty) {
      clear();
      print("⚠️  Please input a number!\n");
      continue;
    } 

    targetID = int.tryParse(input);
    if(targetID == null) {
      clear();
      print("⚠️ Invalid number! Please try again.\n");
      continue;
    }

    break;
  }
  
  var list = lists.firstWhere(
    (t) => t.id == targetID,
    orElse: () => ToDoList(-1, "Not Found"),
  );

  if(list.id == -1) {
    print("❌ Task not found!");
    pause();
    clear();
  } else {
    list.done = true;
    print("✅ Task \"${list.desc}\" marked as done!\n");
    viewTask();
  }
}

void deleteTask() {
  if(lists.isEmpty) {
    print("❌ No tasks available.");
    return;
  }

  String? input;
  int? targetID;

  while(true) {
    stdout.write("👉 Enter task number to delete: ");
    input = stdin.readLineSync();
    if(input == null || input.trim().isEmpty) {
      clear();
      print("⚠️  Please input a number!\n");
      continue;
    }

    targetID = int.tryParse(input);
    if(targetID == null) {
      clear();
      print("⚠️ Invalid number! Please try again.\n");
      continue;
    }

    break;
  }

  int index = lists.indexWhere((t) => t.id == targetID);

  if(index == -1) {
    print("❌ Task not found!");
    pause();
    clear();
  } else {
    String deleteTask = lists[index].desc;
    lists.removeAt(index);
    print("🗑️  Task \"$deleteTask\" deleted successfully!");

    // Reassign IDs so they stay in order.
    for (int i = 0; i < lists.length; i++) {
      lists[i].id = i + 1;
    }

    viewTask();
  }
}

void viewTask() {
  int complete = 0;
  int pending = 0;
  print("=== Current Tasks ===");

  if(lists.isEmpty) {
    print("❌ No tasks available.");
    pause();
    clear();
    return;
  }

  for(int i = 0; i < lists.length; i++) {

    if(lists[i].done) {
      print("[x] ${lists[i].id}. ${lists[i].desc}");
      complete++;
    } else {
      print("[ ] ${lists[i].id}. ${lists[i].desc}");
      pending++;
    }
  }
  print("-------------------------------");
  print("Total Tasks: ${lists.length} | Completed: $complete | Pending: ${pending}");
  pause();
  clear();
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
        clear();
        addTask();
        break;
      }
      case 2: {
        clear();
        markAsDone();
        break;
      }
      case 3: {
        clear();
        deleteTask();
        break;
      }
      case 4: {
        clear();
        viewTask();
        break;
      }
      case 5: {
        clear();
        print("👋 Exiting To-Do List App. Goodbye!");
        break;
      }
      default: {
        clear();
        print("⚠️ Invalid choice! Please try again.\n");
        break;
      }
    }
  } while(choice != 5);
}

void main() {
  AppProcess();
}