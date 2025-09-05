import 'dart:io';

void main() {
  int rows = 5;

  for (int i = 1; i <= rows; i++) {
    // print spaces
    for (int j = 1; j <= rows - i; j++) {
      stdout.write(" ");
    }
    // print numbers
    for (int k = 1; k <= (2 * i - 1); k++) {
      stdout.write(k);
    }
    print(""); // move to next line
  }
}