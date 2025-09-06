import 'dart:io';

void main() {
  print("===== Welcome to Our Store =====");
  print("What product do you want to select?");

  print("\t===== Menu =====");

  print("1. M4 pro 16");
  print("2. M4 Air 13.3");
  print("3. M4 Max 16");

  stdout.write("Please enter your choice: ");
  int choice = int.parse(stdin.readLineSync()!);

  double basePrice = 0.0;

  switch (choice) {
    case 1:
      basePrice = 50;
      print("M4 pro 16:");
      print("-CPU: 10cores");
      print("-GPU: 16cores");
      print("-Storage: 512GB");
      print("-Ram: 24GB");
      print("Base Price: $basePrice\$");
      break;
    
    case 2:
      basePrice = 100;
      print("M4 Air 13.3:");
      print("-CPU: 10cores");
      print("-GPU: 16cores");
      print("-Storage: 512GB");
      print("-Ram: 16GB");
      print("Base Price: $basePrice\$");
      break;
    
    case 3:
      basePrice = 139.99;
      print("M4 Max 16:");
      print("-CPU: 12cores");
      print("-GPU: 20cores");
      print("-Storage: 512GB");
      print("-Ram: 32GB");
      print("Base Price: $basePrice\$");
      break;
    
    default:
    print("Invalid Choice choose the correct one");
    return;
  }

  stdout.write("Please enter the amount you want to purchase: ");
  int quantity = int.parse(stdin.readLineSync()!);

  double totalPrice = basePrice * quantity;
  double discountRate = 0.0;

  // Apply discount rules
  if (totalPrice >= 350) {
    discountRate = 0.099; // 9.9%
  } else if (totalPrice >= 100) {
    discountRate = 0.075; // 7.5%
  }

  double discountAmount = totalPrice * discountRate;
  double finalPrice = totalPrice - discountAmount;

  print("The price after discount is: $finalPrice\$");

}