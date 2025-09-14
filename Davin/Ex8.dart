import 'dart:io';
import 'dart:math';

class PasswordGenerator {
  static const String upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  static const String lower = "abcdefghijklmnopqrstuvwxyz";
  static const String numbers = "0123456789";
  static const String symbols = "!@#\$%^&*()";

  final Random _random = Random();

  String generate(int length, bool useUpper, bool useLower, bool useNumber, bool useSymbols) {
    String charPool = "";

    if(useUpper) charPool += upper;
    if(useLower) charPool += lower;
    if(useNumber) charPool += numbers;
    if(useSymbols) charPool += symbols;

    if(charPool.isEmpty) {
      return "⚠️ No character types selected!";
    }

    String password = "";
    for(int i = 0; i < length; i++) {
      int index = _random.nextInt(charPool.length);
      password += charPool[index];
    }

    return password;
  }
}

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

String getValidString(String promt) {
  while(true) {
    stdout.write(promt);
    String? input = stdin.readLineSync();

    if(input == null || input.trim().isEmpty) {
      clear();
      print("⚠️  Invalid input! Try again.\n");
      pause();
      clear();
      continue;
    }
    return input.trim();
  }
}

int getValidLength(String prompt) {
  String? input;
  int? length;
  while(true) {
    stdout.write(prompt);
    input = stdin.readLineSync();
    if(input == null || input.trim().isEmpty) {
      clear();
      print("⚠️  Invalid input! Try again.\n");
      pause();
      clear();
      continue;
    }
    length = int.tryParse(input) ?? 0;
    return length;
  }
}

void main() {
  PasswordGenerator generator = PasswordGenerator();
  bool isRunning = true;

  while(isRunning) {
    print("=== Password Generator ===");
    print("1. Generate Password");
    print("2. Exit");
    print("-------------------------------");
    String input = getValidString("Enter your choice: ");

    switch(input) {
      case "1": {
        int length = getValidLength("👉 Enter password length (min 6): ");
        
        if(length < 6) {
          clear();
          print("⚠️  Password length must be at least 6!");
          pause();
          clear();
          break;
        }

        bool useUpper = _getYesNo("Include uppercase letter? (y/n): ");
        bool useLower = _getYesNo("Include lowercase letter? (y/n): ");
        bool useNumber = _getYesNo("Include numbers? (y/n): ");
        bool useSymbols = _getYesNo("Include symbols? (y/n): ");

        if(!(useUpper || useLower || useNumber || useSymbols)) {
          print("⚠️  You must select at least one character type!");
          break;
        }

        String password = generator.generate(length, useUpper, useLower, useNumber, useSymbols);
        print("\n✅ Generated Password: $password\n");
        break;
      }
      case "2": {
        isRunning = false;
        print("👋 Exiting Password Generator. Goodbye!");
        break;
      }
      default: {
        clear();
        print("⚠️  Invalid choice! Try again.\n");
        pause();
        break;
      }
    }
  }
}

bool _getYesNo(String prompt) {
  while(true) {
    stdout.write(prompt);
    String? answer = stdin.readLineSync()?.toLowerCase();
    if(answer == "y") return true;
    if(answer == "n") return false;
    print("⚠️  Please enter 'y' or 'n'.");
  }
}