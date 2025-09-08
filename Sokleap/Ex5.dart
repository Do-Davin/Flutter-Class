import 'dart:io';

enum MenuState {
  main,
  general,
  about,
  pricing,
  openingHours,
  wifi,
  otherNetworks,
  brew,
}

class Setting {
  static final Setting _instance = Setting._privateConstructor();
  Setting._privateConstructor();

  static Setting get instance => _instance;

  void showMainSetting() {
    print("\n\nCoffee Shop Setting:\n");
    print("\t1. General\t\t\t>");
    print("\t2. Wi-Fi\t\t\t>");
    print("\t3. Brew Setting\t\t\t>");
    print("\t0. Quit");
  }

  void showGeneralSetting() {
    print("\n\nGeneral:\n");
    print("\t1. About\t\t\t>");
    print("\t2. Pricing\t\t\t>");
    print("\t3. Opening Hours\t\t>");
    print("\t0. Back\n");
  }

  void showAboutSetting() {
    print("\n\nGeneral > About:\n");
    print("\tName\t\t\t\tDT-Coffee");
    print("\tModel\t\t\t\tBarista v2.1");
    print("\tVersion\t\t\t\t1.0");
    print("\t0. Back\n");
  }

  void showPricing() {
    print("\n\nGeneral > Pricing:\n");
    print("\t1. Espresso\t\t\t\$3.50");
    print("\t2. Latte\t\t\t\$4.00");
    print("\t3. Cappuccino\t\t\t\$4.00");
    print("\t0. Back\n");
  }

  void showOpeningHours() {
    print("\n\nGeneral > Opening Hours:\n");
    print("\tMon-Fri:\t\t\t7 AM - 9 PM");
    print("\tSat-Sun:\t\t\t7 AM - 12 AM");
    print("\t0. Back");
  }

  void showWifi() {
    print("\n\nWi-Fi:\n");
    print("\tStatus\t\t\t\tOn");
    print("\tNetwork\t\t\t\tCoffee-Shop-Guest\n");
    print("\t1. Other Networks\t\t>");
    print("\t0. back");
  }

  void showOtherNetworks() {
    print("\n\nWi-Fi > Other Networks:\n");
    print("\tDT-Coffee: \t\t\t******");
    print("\tLibrary_Network: \t\t****");
    print("\tPublic_Hotspot: \t\t***");
    print("\t0. Back");
  }

  void showBrewSetting() {
    print("\n\nBrew Settings:\n");
    print("\tThe feature is not available!");
    print("\t0. Back");
  }
}

class SettingManager {
  final List<MenuState> _navigationStack = [MenuState.main];

  void run() {
    bool isRunning = true;
    while (isRunning) {
      _displayCurrentMenu();
      stdout.write("Choice: ");

      try {
        String? input = stdin.readLineSync();
        int choice = input == null || input.isEmpty ? -1 : int.parse(input);

        if (choice == 0) {
          if (_navigationStack.length > 1) {
            _navigationStack.removeLast();
          } else {
            print(
              "\nThank you for using the Coffee Shop Setting application. Goodbye!",
            );
            isRunning = false;
            continue;
          }
        } else {
          _handleChoice(choice);
        }
      } on FormatException {
        print("\nInvalid input. Please Enter A Number.");
      } catch (e) {
        print("An Error Occured: $e");
      }
    }
  }

  void _displayCurrentMenu() {
    switch (_navigationStack.last) {
      case MenuState.main:
        Setting.instance.showMainSetting();
        break;
      case MenuState.general:
        Setting.instance.showGeneralSetting();
        break;
      case MenuState.wifi:
        Setting.instance.showWifi();
        break;
      case MenuState.brew:
        Setting.instance.showBrewSetting();
        break;
      case MenuState.about:
        Setting.instance.showAboutSetting();
        break;
      case MenuState.pricing:
        Setting.instance.showPricing();
        break;
      case MenuState.openingHours:
        Setting.instance.showOpeningHours();
        break;
      case MenuState.otherNetworks:
        Setting.instance.showOtherNetworks();
        break;
    }
  }

  void _handleChoice(int choice) {
    switch (_navigationStack.last) {
      case MenuState.main:
        _handleMainChoice(choice);
        break;
      case MenuState.general:
        _handleGeneralChoice(choice);
        break;
      case MenuState.wifi:
        _handleWifiChoice(choice);
        break;
      case MenuState.brew:
      case MenuState.about:
      case MenuState.pricing:
      case MenuState.openingHours:
      case MenuState.otherNetworks:
        print("\nInvalid Choice! Please Enter '0' To Back!");
        break;
    }
  }

  void _handleMainChoice(int choice) {
    switch (choice) {
      case 1:
        _navigationStack.add(MenuState.general);
        break;
      case 2:
        _navigationStack.add(MenuState.wifi);
        break;
      case 3:
        _navigationStack.add(MenuState.brew);
        break;
      default:
        print("\nInvalid Choice! Please Enter (0-3)!");
        break;
    }
  }

  void _handleGeneralChoice(int choice) {
    switch (choice) {
      case 1:
        _navigationStack.add(MenuState.about);
        break;
      case 2:
        _navigationStack.add(MenuState.pricing);
        break;
      case 3:
        _navigationStack.add(MenuState.openingHours);
        break;
      default:
        print("Invalid Choice! Please Enter (0-3)!");
        break;
    }
  }

  void _handleWifiChoice(int choice) {
    switch (choice) {
      case 1:
        _navigationStack.add(MenuState.otherNetworks);
        break;
      default:
        print("Invalid Choice! Please Enter (0-1)!");
        break;
    }
  }
}

void main() {
  SettingManager().run();
}
