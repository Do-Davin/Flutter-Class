import 'dart:io';

void main() {
  print('=== Welcome To Our Store ===\n');
  print('What product do you want to select?\n');
  print('\t\t=== Menu ===\n');
  
  print('1. M4 Pro 16\'');
  print('2. M4 Air 13.3\'');
  print('3. M4 Max 16\'');

  stdout.write('\nEnter your choice: ');
  int choice = int.parse(stdin.readLineSync()!);

  double basePrice = 0.0;

  if (choice == 1) {
    basePrice = 50;
    print('\nM4 Pro 16\':');
    print('-CPU: 10 cores');
    print('-GPU: 16 cores');
    print('-Storage: 512GB');
    print('-Ram: 24GB');
    print('-Base Price: \$${basePrice}');
  } else if (choice == 2) {
    basePrice = 100;
    print('\nM4 Air 13.3\':');
    print('-CPU: 10 cores');
    print('-GPU: 16 cores');
    print('-Storage: 512GB');
    print('-Ram: 16GB');
    print('-Base Price: \$${basePrice}');
  } else if (choice == 3) {
    basePrice = 139.99;
    print('\nM4 Max 16\':');
    print('-CPU: 12 cores');
    print('-GPU: 20 cores');
    print('-Storage: 512GB');
    print('-Ram: 32GB');
    print('-Base Price: \$${basePrice}');
  } else {
    print("Invalid choice!");
    return;
  }

  stdout.write('\nEnter the amount you want to purchase: ');
  int amount = int.parse(stdin.readLineSync()!);

  double totalPrice = basePrice * amount;
  double discountRate = 0.0;

  if (totalPrice >= 350) {
    discountRate = 0.099; 
  } else if (totalPrice >= 100) {
    discountRate = 0.075; 
  }

  double discount = totalPrice * discountRate;
  double finalPrice = totalPrice - discount;

  print("The price after discount is: \$${finalPrice.toStringAsFixed(2)}");
}
