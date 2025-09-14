import 'dart:io';

class ListInfor {
  String infor;
  bool Completed ;

  ListInfor(this.infor, {this.Completed = false});
}

List<ListInfor> list = [];

void main() {
  bool running = true;
  do {
    menu();
    int choice = promptForInt("Enter your choice: ");
    switch (choice) {
      case 1:
        addTask();
        break;
      case 2:
        DoneTask();
        break;
      case 3:
        DeleteTask();
        break;
      case 4:
        ViewAllTask();
        break;
      case 5:
        running = false;
        print("Thank for using our system!");
        break;
      default:
        print("Invalid input. Try again.");
        break;
    }
  } while (running);
}

void clear() {
  print("\x1B[2J\x1B[0;0H");
}

int promptForInt(String prompt) {
  stdout.write(prompt);
  String? input = stdin.readLineSync();
  return int.tryParse(input ?? "") ?? -1;
}

void Pause() {
  stdout.write("\n\n👉 Press any key to continue ...");
  stdin.readLineSync();
}

void menu() {
  print("==== To-Do List Application ====");
  print("1. Add Task");
  print("2. Mark Task as Done");
  print("3. Delete Task");
  print("4. View All Tasks");
  print("5. Exit");
  print("-------------------------------");
}

void addTask() {
  print("==== Add Task ====");
  stdout.write("👉 Enter task description: ");
  String? dis = stdin.readLineSync();
  if (dis == null || dis.isEmpty) {
    print("❌ No input detected. Try again.");
  } else {
    list.add(ListInfor(dis));
    print("✅ Task added successfully!");
  }
  Pause();
  clear();
}

void DoneTask() {
  print("==== Mark Task as Done ====");
  stdout.write("👉 Enter task number to mark as done: ");
  int? done = int.parse(stdin.readLineSync() ?? "");
  if(done > 0 && done <= list.length){
    list[done - 1].Completed = true;
    print("✅ Task \"${list[done -1 ].infor}\" marked as done!");
  }else{
    print("❌ Task not found.");
  }
  Pause();
  clear();
}

void DeleteTask() {
  print("==== Delete Task ====");
  stdout.write("👉 Enter task number to delete: ");
  int? delete = int.parse(stdin.readLineSync() ?? "");
  if (delete > 0 && delete <= list.length) {
    var removetask = list.removeAt(delete - 1);
    print("🗑️ Task \"${removetask.infor}\" deleted successfully!");
  } else {
    print("❌ Task not found.");
  }
  Pause();
  clear();
}

void ViewAllTask() {
  print("==== Current Tasks ====");
  if (list.isEmpty) {
    print("❌ No task found. :(");
    return;
  }
  int count = 0;
  for (int i = 0; i < list.length; i++) {
    if(list[i].Completed == true){
      print("[x] ${i + 1}. ${list[i].infor}");
      count++;
    }else{
      print("[ ] ${i + 1}. ${list[i].infor}");
    }
  }
  print("-------------------------------");
  print("Total Tasks: ${list.length} | Completed: ${count} | Pending: ${list.length - count}");
  Pause();
  clear();
}
