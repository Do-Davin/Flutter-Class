import 'dart:io';

int promptForInt(String prompt) {
  stdout.write(prompt);
  String? input = stdin.readLineSync();
  return int.tryParse(input ?? "") ?? -1;
}

void main() {
  bool running = true;
  while (running) {
    stdout.write('\x1B[2J\x1B[0;0H');
    print("==== Coffee Shop Setting ====\n");
    print("1. General                   >");
    print("2. Wi-Fi                     >");
    print("3. Brew Setting              >");
    print("0. Quit                      >");
    int opt = promptForInt("Enter your option ");
    switch (opt) {
      case 1:
        General();
        break;
      case 2:
        Wifi();
        break;
      case 3:
        Brew();
        break;
      case 0:
        stdout.write('\x1B[2J\x1B[0;0H');
        print("Thank you for using our system :)");
        running = false;
        break;
      default:
        break;
    }
  }
}

void General() {
  while (true) {
    stdout.write('\x1B[2J\x1B[0;0H');
    print("General: ");
    print("1. About                     >");
    print("2. Pricing                   >");
    print("3. Opening Hours             >");
    print("0. Back                      >");
    int opt = promptForInt("Enter your option ");
    switch (opt) {
      case 1:
        About();
        break;
      case 2:
        Pricing();
        break;
      case 3:
        OpenHour();
        break;
      case 0:
        return;
      default:
        break;
    }
  }
}

void About() {
  while (true) {
    stdout.write('\x1B[2J\x1B[0;0H');
    print("General > About: ");
    print("Name                 DT-Coffee   ");
    print("Model                Barista v2.1");
    print("Version              2.0");
    print("0. Back                      >");
    int opt = promptForInt("Enter your option ");
    switch (opt) {
      case 0:
        return;
      default:
        break;
    }
  }
}

void Pricing() {
  while (true) {
    stdout.write('\x1B[2J\x1B[0;0H');
    print("General > Pricing: ");
    print("Espresso     \$3.50");
    print("Latte        \$4.00");
    print("Cappuccino   \$4.00");
    print("0. Back            ");
    int opt = promptForInt("Enter your option ");
    switch (opt) {
      case 0:
        return;
      default:
        break;
    }
  }
}

void OpenHour() {
  while (true) {
    stdout.write('\x1B[2J\x1B[0;0H');
    print("General > Open Hours: ");
    print("Mon-Fri:          7 AM - 9  PM");
    print("Sat-Sun:          7 AM - 12 PM");
    print("0. Back                       ");
    int opt = promptForInt("Enter your option ");
    switch (opt) {
      case 0:
        return;
      default:
        break;
    }
  }
}

void Brew() {
  while (true) {
    stdout.write('\x1B[2J\x1B[0;0H');
    print("The feature is not available!");
    print("0. Back");
    int opt = promptForInt("Enter your option ");
    switch (opt) {
      case 0:
        return;
      default:
        break;
    }
  }
}

void Wifi() {
  while (true) {
    stdout.write('\x1B[2J\x1B[0;0H');
    print("Wi-Fi : ");
    print("Status:\t\t\ton");
    print("Network\t\t\tCoffee-Shop-Guest");
    print("\n1. Other Networks\t>");
    print("0. Back");
    int opt = promptForInt("Enter your option ");
    switch (opt) {
      case 1:
        Othernetwork();
        break;
      case 0:
        return;
      default:
        break;
    }
  }
}

void Othernetwork() {
  while (true) {
    stdout.write('\x1B[2J\x1B[0;0H');
    print("Wi-Fi > Other Networks: ");
    print("DT-Coffee:\t*******");
    print("Library_Network:\t*****");
    print("Public_Hotspot:\t****");
    print("0. Back");
    int opt = promptForInt("Enter your option ");
    switch (opt) {
      case 0:
        return;
      default:
        break;
    }
  }
}
