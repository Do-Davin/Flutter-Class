import 'dart:io';

class Task {
  String _desc;
  bool _isCompleted;

  Task({required String desc, bool isCompleted = false})
    : _desc = desc,
      _isCompleted = isCompleted;

  set status(bool status) => _isCompleted = status;

  bool get status => _isCompleted;

  String get desc => _desc;
}

class TaskManager {
  List<Task> taskList = [];

  void displayAllTasks() {
    if (taskList.isEmpty) {
      print("\n❌ No tasks to display");
      return;
    }

    print("\n=== Current Tasks ===");
    for (int i = 0; i < taskList.length; i++) {
      String status = taskList[i].status ? "[x]" : "[ ]";
      print("$status ${i + 1}. ${taskList[i].desc}");
    }
  }

  void addTask(String desc) {
    taskList.add(new Task(desc: desc));
    print("\n✅ Task added successfully!");
  }

  void markTask(int taskNumber) {
    if (_findID(taskNumber)) {
      if (!taskList[taskNumber - 1].status) {
        taskList[taskNumber - 1].status = true;
        print("✅ Task '${taskList[taskNumber - 1].desc}' marked as done!");
        return;
      }
      print("\n❌ Task already mark as done!");
    }
  }

  void deleteTask(int taskNumber) {
    if (_findID(taskNumber)) {
      print(
        "\n🗑️  Task '${taskList[taskNumber - 1].desc}' deleted successfully!",
      );
      taskList.removeAt(taskNumber - 1);
    }
  }

  bool _findID(int taskNumber) {
    if (taskNumber > 0 && taskNumber <= taskList.length) {
      return true;
    }
    print("\n❌ Task not found! Please try again");
    return false;
  }
}

void displayMenu() {
  print("\n=== To-Do List Application ===");
  print("1. Add Task");
  print("2. Mark Task as Done");
  print("3. Delete Task");
  print("4. View All Tasks");
  print("5. Exit");
  print("-------------------------------");
}

int validateNumberInput(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    int? choice = int.tryParse(input ?? "");
    if (choice != null) {
      return choice;
    }
    print("❌ Invalid number! Please try again\n");
  }
}

String validateStringInput(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    if (input != null && input.trim().isNotEmpty) {
      return input;
    }
    print("❌ Invalid input! Please try again\n");
  }
}

void main() {
  int choice = -1;
  TaskManager taskManager = new TaskManager();
  while (choice != 5) {
    displayMenu();
    choice = validateNumberInput("Enter your choice: ");
    switch (choice) {
      case 1:
        String desc = validateStringInput("\n👉 Enter task description: ");
        taskManager.addTask(desc);
        break;
      case 2:
        int taskNumber = validateNumberInput(
          "\n👉 Enter task number to mark as done: ",
        );
        taskManager.markTask(taskNumber);
        break;
      case 3:
        int taskNumber = validateNumberInput(
          "\n👉 Enter task number to delete: ",
        );
        taskManager.deleteTask(taskNumber);
        break;
      case 4:
        taskManager.displayAllTasks();
        break;
      case 5:
        print("\n👋 Exiting To-Do List App. Goodbye!");
        break;
      default:
        print("\n❌ Incorrect choice! Please try again");
        break;
    }
  }
}
