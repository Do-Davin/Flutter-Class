import 'dart:ffi';
import 'dart:io';

void main() {
  print('=== Welcome To Our Store ===\n');
  print('What product do you want to select? ');
  print('===Menu===\n\n');

  print('1. M4 Pro 16');
  print('2. M4 Air 13.3');
  print('3. M4 Max 16\n\n');

  print('Enter your choice');
  int choice = int.parse(stdin.readLineSync()!);

  if (choice == 1) {
    print(
      'M4 Pro 16 '
      ':',
    );
    print(
      '-CPU'
      ': 10Cores',
    );
    print(
      '-GPU'
      ': 16Cores',
    );
    print(
      '-Storage'
      ': 512GB',
    );
    print(
      '-Ram'
      ': 24GB',
    );
    print(
      '-Base Price'
      ': 50\$',
    );

    print('Enter the amount you want to purchase: ');
    double num = double.parse(stdin.readLineSync()!);
    print('The price after discount is: ${lastprice(num, 50)}\$');
  } else if (choice == 2) {
    print(
      'M4 Pro 13.3 '
      ':',
    );
    print(
      '-CPU'
      ': 10Cores',
    );
    print(
      '-GPU'
      ': 16Cores',
    );
    print(
      '-Storage'
      ': 512GB',
    );
    print(
      '-Ram'
      ': 16GB',
    );
    print(
      '-Base Price'
      ': 100\$',
    );

    print('Enter the amount you want to purchase: ');
    double num = double.parse(stdin.readLineSync()!);
    print('The price after discount is: ${lastprice(num, 100)}\$');
  } else if (choice == 3) {
    print(
      'M4 Pro 16 '
      ':',
    );
    print(
      '-CPU'
      ': 12Cores',
    );
    print(
      '-GPU'
      ': 20Cores',
    );
    print(
      '-Storage'
      ': 512GB',
    );
    print(
      '-Ram'
      ': 32GB',
    );
    print(
      '-Base Price'
      ': 139.99\$',
    );
    print('Enter the amount you want to purchase: ');
    double num = double.parse(stdin.readLineSync()!);
    print('The price after discount is: ${lastprice(num, 50)}\$');
  }
}

double lastprice(double purchase, double basePrice) {
  double total = purchase * basePrice;
  if (total >= 100 && total < 350) {
    return (total - (total * 0.075)).toDouble();
  } else {
    return (total - (total * 0.099)).toDouble();
  }
}
