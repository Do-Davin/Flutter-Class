import 'dart:io';

void clear() {
  // \x1B = ESC
  // [2J = clear screen
  // [0;0H = move cursor to top-left
  print("\x1B[2J\x1B[0;0H");
}

void pause() {
  stdout.write("Press Enter to continue...");
  stdin.readLineSync(); // waits until user presses Enter
}

void about() {
  int? back;
  clear();
  do {
    print("General > About:\n");
    print("\tName\t\t\tDT-Coffee");
    print("\tModel\t\t\tBarista v2.1");
    print("\tVersion\t\t\t1.0");
    print("\t0. Back\n");
    stdout.write("Choice: ");
    String? input = stdin.readLineSync();
    if(input == null || input.trim().isEmpty) {
      clear();
      print("Please input number only!\n");
      continue;
    }
    int? back = int.tryParse(input);
    if(back == 0) {
      clear();
      return;
    } else {
      clear();
      print("Please input number '0' to go back!\n");
    }
  } while(back != 0);
}

void pricing() {
  int? back;
  clear();

  do {
    print("General > Pricing:\n");
    print("\t1. Espresso\t\t\t\$3.50");
    print("\t2. Latte\t\t\t\$4.00");
    print("\t3. Cappuccino\t\t\t\$4.00");
    print("\t0. Back\n");
    stdout.write("Choice: ");
    String? input = stdin.readLineSync();
    if(input == null || input.trim().isEmpty) {
      clear();
      print("Please input number only!\n");
      continue;
    }
    back = int.tryParse(input);

    if(back == 0) {
      clear();
      return;
    } else {
      clear();
      print("Please input number '0' to go back!\n");
    }
  } while(back != 0);
}

void openingHours() {
  int? back;
  clear();

  do {
    print("General > Opening Hours:\n");
    print("\tMon-Fri:\t\t7 AM - 9  PM");
    print("\tSat-Sun:\t\t7 AM - 12 AM");
    print("\t0. Back\n");
    stdout.write("Choice: ");
    String? input = stdin.readLineSync();
    if(input == null || input.trim().isEmpty) {
      clear();
      print("Please input number only!\n");
      continue;
    }
    back = int.tryParse(input);

    if(back == 0) {
      clear();
      return;
    } else {
      clear();
      print("Please input number '0' to go back!\n");
    }
  } while(back != 0);
}

void general() {
  int? subChoice;
  clear();

  do {
    print("General:\n");
    print("\t1. About\t\t>");
    print("\t2. Pricing\t\t>");
    print("\t3. Opening Hours\t>");
    print("\t0. Back\n");
    stdout.write("Choice: ");
    String? subInput = stdin.readLineSync();
    if(subInput == null || subInput.trim().isEmpty) {
      clear();
      print("Please input Choice (0-3)!\n");
      continue;
    }
    subChoice = int.tryParse(subInput);
    switch(subChoice) {
      case 1: {
        about();
        break;
      }
      case 2: {
        pricing();
        break;
      }
      case 3: {
        openingHours();
        break;
      }
      case 0: {
        clear();
        break;
      }
      default: {
        print("\nInvalid Input! Please try again...\n");
        break;
      }
    }
      
  } while(subChoice != 0);
}

void otherNetworks() {
  int? back;
  clear();

  do {
    print("Wi-Fi > Other Networks:\n");
    print("\tDT-Coffee:\t\t******");
    print("\tLibrary_Network:\t****");
    print("\tPublic_Hotspot:\t\t***");
    print("\t0. Back\n");
    stdout.write("Choice: ");

    String? input = stdin.readLineSync();
    if(input == null || input.trim().isEmpty) {
      clear();
      print("Please input number only!\n");
      continue;
    }

    back = int.tryParse(input);
    if(back != 0) {
      clear();
      print("Please input number '0' to go back!\n");
    } else {
      clear();
      return;
    }
  } while(back != 0);
}

void wifi() {
  int? choice;
  clear();

  do {
    print("Wi-Fi:\n");
    print("\tStatus\t\tOn");
    print("\tNetwork\t\tCoffee-Shop-Guest\n");
    print("\t1. Other Networks\t\t>");
    print("\t0. back\n");
    stdout.write("Choice: ");

    String? input = stdin.readLineSync();
    if(input == null || input.trim().isEmpty) {
      clear();
      print("Please input number only!\n");
      continue;
    }

    choice = int.tryParse(input);
    if(choice == 1) {
      otherNetworks();
    } else if(choice == 0) {
      clear();
      return;
    } else {
      clear();
      print("Please input number '0' to go back!\n");
    }
  } while(choice != 0);
}

void brew() {
  int? back;
  clear();

  do {
    print("Brew Settings:\n");
    print("\tThe feature is not available!");
    print("\t0. Back\n");
    stdout.write("Choice: ");
    String? input = stdin.readLineSync();
    if(input == null || input.trim().isEmpty) {
      clear();
      print("Please input number only!\n");
      continue;
    }
    back = int.tryParse(input);
    if(back != 0) {
      clear();
      print("Please input number '0' to go back!\n");
    } else {
      clear();
      return;
    }
  } while(back != 0);
}

void main() {
  clear();
  int? choice;
  do {
    print("Coffee Shop Setting:\n");
    print("\t1. General\t\t\t>");
    print("\t2. Wi-Fi\t\t\t>");
    print("\t3. Brew Setting\t\t\t>");
    print("\t0. Quit\n");
    stdout.write("Choice: ");

    String? input = stdin.readLineSync();
    if(input == null || input.trim().isEmpty) {
      clear();
      print("Please input Choice (0-3)\n");
      continue;
    }
    choice = int.tryParse(input);

    switch(choice) {
      case 1: {
        general();
        break;
      }
      case 2: {
        wifi();
        break;
      }
      case 3: {
        brew();
        break;
      }
      case 0: {
        clear();
        print("Thank you for using the Coffee Shop Setting application. Goodbye!");
        break;
      }
      default: {
        clear();
        print("\nInvalid Input! Please try again...\n");
        break;
      }
    }
  } while(choice != 0);
}