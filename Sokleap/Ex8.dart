import 'dart:io';
import 'dart:math';

class PasswordGenerator {
  static const String upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  static const String lower = "abcdefghijklmnopqrstuvwxyz";
  static const String numbers = "0123456789";
  static const String symbols = "!@#\$%^&*()";
  final Random _random = Random();

  String generatePassword(
    int passLength,
    bool isUsingUpper,
    bool isUsingLower,
    bool isUsingNumber,
    bool isUsingSymbol,
  ) {
    List<String> password = [];
    String randomPool = "";
    if (isUsingUpper) {
      password.add(upper[_random.nextInt(upper.length)]);
      randomPool += upper;
    }
    if (isUsingLower) {
      password.add(lower[_random.nextInt(lower.length)]);
      randomPool += lower;
    }
    if (isUsingNumber) {
      password.add(numbers[_random.nextInt(numbers.length)]);
      randomPool += numbers;
    }
    if (isUsingSymbol) {
      password.add(symbols[_random.nextInt(symbols.length)]);
      randomPool += symbols;
    }
    while (password.length < passLength) {
      password.add(randomPool[_random.nextInt(randomPool.length)]);
    }
    password.shuffle();
    return password.join();
  }
}

void clearScreen() {
  try {
    // Try ANSI escape code first ()
    stdout.write("\x1B[2J\x1B[0;0H");
  } catch (e) {
    // If ANSI failed, try using shell
    if (Platform.isWindows) {
      Process.runSync("cls", [], runInShell: true);
    } else {
      Process.runSync("clear", [], runInShell: true);
    }
  }
  // Note: some old version might work with shell but not ANSI
}

void pause() {
  print("\nPress enter to continue...");
  stdin.readLineSync(); // consume entire line
}

void menu() {
  print("\n=== Password Generator ===");
  print("1. Generate Password");
  print("2. Exit");
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
    print("⚠️  Invalid number! Please try again\n");
  }
}

bool validateYesNoAnswerInput(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync()?.toLowerCase();
    if (input == "y") {
      return true;
    }
    if (input == "n") {
      return false;
    }
    print("⚠️  Invalid input! Please enter 'y' or 'n'\n");
  }
}

void main() {
  int choice = -1;
  PasswordGenerator passwordGenerator = new PasswordGenerator();
  while (choice != 2) {
    clearScreen();
    menu();
    choice = validateNumberInput("Enter your choice: ");
    switch (choice) {
      case 1:
        int passLength = validateNumberInput(
          "👉 Enter password length (min 6): ",
        );
        if (passLength < 6) {
          print("⚠️  Password length must be at least 6!");
          pause();
          clearScreen();
          break;
        }

        bool isUsingUpper = validateYesNoAnswerInput(
          "Include uppercase letters? (y/n): ",
        );
        bool isUsingLower = validateYesNoAnswerInput(
          "Include lowercase letters? (y/n): ",
        );
        bool isUsingNumber = validateYesNoAnswerInput(
          "Include numbers? (y/n): ",
        );
        bool isUsingSymbol = validateYesNoAnswerInput(
          "Include symbols? (y/n): ",
        );
        if (!(isUsingUpper || isUsingLower || isUsingNumber || isUsingSymbol)) {
          print("⚠️  You must select at least one character type!");
          pause();
          clearScreen();
          break;
        }

        String pass = passwordGenerator.generatePassword(
          passLength,
          isUsingUpper,
          isUsingLower,
          isUsingNumber,
          isUsingSymbol,
        );
        print("✅ Generated Password: $pass");
        pause();
        clearScreen();
        break;
      case 2:
        clearScreen();
        print("\n\n👋 Exiting Password Generator. Goodbye!");
        break;
      default:
        print("⚠️  Incorrect number! Please try again\n");
        pause();
        clearScreen();
    }
  }
}
