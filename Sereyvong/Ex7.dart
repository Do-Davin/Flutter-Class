import 'dart:io';

class Task {
  String description; // task description (ex: "Buy groceries")
  bool isDone;        // whether the task is completed or not

  Task(this.description, {this.isDone = false});
}

// Main To-Do application class
class ToDoApp {
  List<Task> tasks = []; // list to store all tasks

  // Start the app loop
  void start() {
    while (true) {
      printMenu(); // show the menu
      stdout.write("Enter your choice: ");
      String? choice = stdin.readLineSync();

      // Handle user choice
      switch (choice) {
        case '1':
          addTask();
          break;
        case '2':
          markTaskAsDone();
          break;
        case '3':
          deleteTask();
          break;
        case '4':
          viewTasks();
          break;
        case '5':
          print("👋 Exiting To-Do List App. Goodbye!");
          return; // exit program
        default:
          print("❌ Invalid choice. Please try again.");
      }
    }
  }

  // Print main menu
  void printMenu() {
    print("\n===== To-Do List Application =====");
    print("1. Add Task");
    print("2. Mark Task as Done");
    print("3. Delete Task");
    print("4. View All Tasks");
    print("5. Exit");
    print("----------------------------------");
  }

  // Add a new task
  void addTask() {
    stdout.write("👉 Enter task description: ");
    String? description = stdin.readLineSync();
    if (description != null && description.trim().isNotEmpty) {
      tasks.add(Task(description.trim())); // add task to list
      print("✅ Task added successfully!");
    } else {
      print("❌ Task description cannot be empty.");
    }
  }

  // Mark a task as done
  void markTaskAsDone() {
    if (tasks.isEmpty) {
      print("❌ No tasks available.");
      return;
    }
    viewTasks(showSummary: false); // show tasks to pick from
    stdout.write("👉 Enter task number to mark as done: ");
    String? input = stdin.readLineSync();
    int? index = int.tryParse(input ?? "");
    if (index != null && index > 0 && index <= tasks.length) {
      tasks[index - 1].isDone = true; // mark task as done
      print("✅ Task \"${tasks[index - 1].description}\" marked as done!");
    } else {
      print("❌ Invalid task number.");
    }
  }

  // Delete a task
  void deleteTask() {
    if (tasks.isEmpty) {
      print("❌ No tasks available.");
      return;
    }
    viewTasks(showSummary: false); // show tasks first
    stdout.write("👉 Enter task number to delete: ");
    String? input = stdin.readLineSync();
    int? index = int.tryParse(input ?? "");
    if (index != null && index > 0 && index <= tasks.length) {
      String deletedTask = tasks[index - 1].description;
      tasks.removeAt(index - 1); // remove task from list
      print("🗑️  Task \"$deletedTask\" deleted successfully!");
    } else {
      print("❌ Invalid task number.");
    }
  }

  // Show all tasks with summary
  void viewTasks({bool showSummary = true}) {
    print("\n=== Current Tasks ===");
    if (tasks.isEmpty) {
      print("❌ No tasks found.");
    } else {
      // Loop through all tasks and show [ ] or [x]
      for (int i = 0; i < tasks.length; i++) {
        String status = tasks[i].isDone ? "[x]" : "[ ]";
        print("$status ${i + 1}. ${tasks[i].description}");
      }
    }

    // Show summary (Total, Completed, Pending)
    if (showSummary) {
      int completed = tasks.where((task) => task.isDone).length;
      int pending = tasks.length - completed;
      print("----------------------------------");
      print("Total Tasks: ${tasks.length} | Completed: $completed | Pending: $pending");
    }
  }
}

// Entry point
void main() {
  ToDoApp app = ToDoApp();
  app.start(); // run the app
}
