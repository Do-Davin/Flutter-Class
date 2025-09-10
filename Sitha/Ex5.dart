import 'dart:io';

void main() {
  while (true) {

    print("\nCoffee Shop Setting:\n");
    print("1. General          >");
    print("2. Wi-Fi            >");
    print("3. Brew Setting     >");
    print("0. Quit");
    stdout.write("Enter your option: ");
    String? input = stdin.readLineSync();

    if (input == "1") {
      generalMenu();
    } else if (input == "2") {
      wifiMenu();
    } else if (input == "3") {
      brewSettings();
    } else if (input == "0") {
      print("\nThank you for using the Coffee Shop Setting application. Goodbye!");
      break;
    } else {
      print("Invalid input!");
    }
  }
}


void generalMenu() {
  while (true) {
    print("\nGeneral:\n");
    print("1. About            >");
    print("2. Pricing          >");
    print("3. Opening Hours    >");
    print("0. Back");
    stdout.write("Enter your option: ");
    String? gen = stdin.readLineSync();

    if (gen == "1") showAbout();
    else if (gen == "2") showPricing();
    else if (gen == "3") showHours();
    else if (gen == "0") break;
    else print("Invalid input!");
  }
}

void wifiMenu() {
  while (true) {
    print("\nWi-Fi:\n");
    print("Status     On");
    print("Network    Coffee-Shop-Guest\n");
    print("1. Other Networks   >");
    print("0. Back");
    stdout.write("Enter your option: ");
    String? wifi = stdin.readLineSync();

    if (wifi == "1") {
      print("\nWi-Fi > Other Networks:\n");
      print("DT-Coffee:       ******");
      print("Library_Network: ****");
      print("Public_Hotspot:  ***");
      print("0. Back");
      stdin.readLineSync(); 
    } else if (wifi == "0") break;
    else print("Invalid input!");
  }
}

void brewSettings() {
  print("\nBrew Settings:\n");
  print("The feature is not available!");
  print("0. Back");
  stdin.readLineSync();
}


void showAbout() {
  print("\nGeneral > About:\n");
  print("Name      DT-Coffee");
  print("Model     Barista v2.1");
  print("Version   1.0");
  print("0. Back");
  stdin.readLineSync();
}

void showPricing() {
  print("\nGeneral > Pricing:\n");
  print("1. Espresso       \$3.50");
  print("2. Latte          \$4.00");
  print("3. Cappuccino     \$4.00");
  print("0. Back");
  stdin.readLineSync();
}

void showHours() {
  print("\nGeneral > Opening Hours:\n");
  print("Mon-Fri:       7 AM - 9 PM");
  print("Sat-Sun:       7 AM - 12 AM");
  print("0. Back");
  stdin.readLineSync();
}
