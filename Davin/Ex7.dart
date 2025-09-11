import 'dart:io';

class ToDoList {
  int id;
  String desc;
  bool isCompleted;
  ToDoList(this.id, this.desc, {this.isCompleted = false});
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

int getValidNumber(String prompt) {
  while(true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
/*
  * ?? is the null-coalescing operator in Dart.
  * It means: “If input is null, use "" instead.”
  * So:
  *   If input = "123" → result = "123"
  *   If input = null → result = ""
  * This prevents errors from passing null into int.tryParse().
*/
    int? num = int.tryParse(input ?? "");
    if(num != null) return num;
    clear();
    print("⚠️  Invalid number! Try again.\n");
  }
}

void menu() {
  print("=== To-Do List Application ===");
  print("1. Add Task");
  print("2. Mark Task as Done");
  print("3. Delete Task");
  print("4. View All Tasks");
  print("5. Exit");
  print("-------------------------------");
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

  int targetID = getValidNumber("👉 Enter task number to mark as done: ");
  
  var list = lists.firstWhere(
    (t) => t.id == targetID,
    orElse: () => ToDoList(-1, "Not Found"),
  ); // return object.

  if(list.id == -1) {
    print("❌ Task not found!");
    pause();
    clear();
  } else {
    if(list.isCompleted) {
      print("⚠️  Task \"${list.desc}\" is already marked as done!");
    } else {
      list.isCompleted = true;
      print("✅ Task \"${list.desc}\" marked as done!\n");
    }
    viewTask();
  }
}

void deleteTask() {
  if(lists.isEmpty) {
    print("❌ No tasks available.");
    pause();
    clear();
    return;
  }

  int targetID = getValidNumber("👉 Enter task number to delete: ");

  int index = lists.indexWhere((t) => t.id == targetID);

  if(index == -1) {
    print("❌ Task not found!");
    pause();
    clear();
  } else {
    String deleteTaskDesc = lists[index].desc;
    lists.removeAt(index);
    print("🗑️  Task \"$deleteTaskDesc\" deleted successfully!");

    // Reassign IDs so they stay in order.
    for (int i = 0; i < lists.length; i++) {
      lists[i].id = i + 1;
    }

    if (lists.isEmpty) {
      print("\n=== Current Tasks ===");
      print("❌ No tasks available.");
      pause();
      clear();
    } else {
      viewTask();
    }
  }
}

void viewTask() {
  int done = 0;
  int pending = 0;
  print("=== Current Tasks ===");

  if(lists.isEmpty) {
    print("❌ No tasks available.");
    pause();
    clear();
    return;
  }

  for(int i = 0; i < lists.length; i++) {

    if(lists[i].isCompleted) {
      print("[x] ${lists[i].id}. ${lists[i].desc}");
      done++;
    } else {
      print("[ ] ${lists[i].id}. ${lists[i].desc}");
      pending++;
    }
  }
  print("-------------------------------");
  print("Total Tasks: ${lists.length} | Completed: $done | Pending: ${pending}");
  pause();
  clear();
}

void AppProcess() {
  int choice;

  do {
    menu();
    choice = getValidNumber("Enter your choice: ");
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