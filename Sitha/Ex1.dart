import 'dart:io';

void main() {
  print("=== Welcome To Our iPhone Store ===");
  print("Which iPhone do you want to select?");
  print("\t=== Menu ===");

  print("1. iPhone 14");
  print("2. iPhone 14 Pro");
  print("3. iPhone 15 Pro Max");

  stdout.write("\nEnter your choice: ");
  int choice = int.parse(stdin.readLineSync()!);

  double basePrice;

  switch (choice) {
    case 1:
      basePrice = 800;
      print("\niPhone 14:");
      print("- Display: 6.1-inch Super Retina XDR");
      print("- Camera: Dual 12MP");
      print("- Storage: 128GB");
      print("- Battery: 20h video playback");
      print("- Base Price: \$${basePrice}");
      break;
    case 2:
      basePrice = 900;
      print("\niPhone 14 Pro:");
      print("- Display: 6.1-inch Super Retina XDR + ProMotion");
      print("- Camera: Triple 48MP + 12MP + 12MP");
      print("- Storage: 256GB");
      print("- Battery: 23h video playback");
      print("- Base Price: \$${basePrice}");
      break;
    case 3:
      basePrice = 1199;
      print("\niPhone 15 Pro Max:");
      print("- Display: 6.7-inch Super Retina XDR + ProMotion");
      print("- Camera: Triple 48MP + 12MP + 12MP (5x Zoom)");
      print("- Storage: 256GB");
      print("- Battery: 29h video playback");
      print("- Base Price: \$${basePrice}");
      break;
    default:
      print(" Invalid choice!");
      return;
  }

  stdout.write("\nEnter the amount you want to purchase: ");
  int amount = int.parse(stdin.readLineSync()!);
  double totalPrice = basePrice * amount;

 
  if (totalPrice >= 3500) {
    totalPrice = totalPrice * (1 - 0.099); 
  } else if (totalPrice >= 1000) {
    totalPrice = totalPrice * (1 - 0.075); 
  } else {
    print(
        "There is no discount so the price is: ${totalPrice.toStringAsFixed(2)}\$");
    return;
  }

  print(" The price after discount is: ${totalPrice.toStringAsFixed(2)}\$");
}
