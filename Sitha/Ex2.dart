import 'dart:io';

void main() {
  int rows = 5;

  for (int i = 1; i <= rows; i++) {
    for (int s = 1; s <= rows - i; s++) {
      stdout.write(" ");
    }

    for (int n = 1; n <= 2 * i - 1; n++) {
      stdout.write(n);
    }

    print("");
  }
}
