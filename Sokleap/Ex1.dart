import "dart:io";

void main() {
  print("=== Welcome To Our Store ===");
  print("What product do you want to select?");
  print("\t=== Menu ===");

  print("1. M4 Pro 16'");
  print("2. M4 Air 13.3'");
  print("3. M4 Max 16'");

  stdout.write("\nEnter your choice: ");
  int choice = int.parse(stdin.readLineSync()!);

  double basePrice;

  switch (choice) {
    case 1:
      basePrice = 50;
      print("\nM4 Pro 16':");
      print("-CPU: 10 cores");
      print("-GPU: 16 cores");
      print("-Storage: 512GB");
      print("-Ram: 24GB");
      print("-Base Price: \$${basePrice}");
      break;
    case 2:
      basePrice = 100;
      print("\nM4 Air 13.3'");
      print("-CPU: 10 cores");
      print("-GPU: 16 cores");
      print("-Storage: 512GB");
      print("-Ram: 16GB");
      print("-Base Price: \$${basePrice}");
      break;
    case 3:
      basePrice = 139.99;
      print("\nM4 Max 16'");
      print("-CPU: 12 cores");
      print("-GPU: 20 cores");
      print("-Storage: 512GB");
      print("-Ram: 32GB");
      print("-Base Price: \$${basePrice}");
      break;
    default:
      print("Invalid choice!");
      return;
  }

  stdout.write("\nEnter the amount you want to purchase: ");
  int amount = int.parse(stdin.readLineSync()!);
  double totalPrice = basePrice * amount;

  if (totalPrice >= 350) {
    totalPrice = basePrice * amount * (1 - 0.099);
  } else if (totalPrice >= 100) {
    totalPrice = basePrice * amount * (1 - 0.075);
  } else {
    print(
      "There is no discount so the price is: ${totalPrice.toStringAsFixed(2)}\$",
    );
    return;
  }
  print("The price after discount is: ${totalPrice.toStringAsFixed(2)}\$");
}
