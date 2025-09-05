import "dart:io";

void main() {
  int n = 5;
  for (int i = 1; i <= n; i++) {
    stdout.write(" " * (n - i));
    for (int j = 1; j <= 2 * i - 1; j++) {
      stdout.write(j);
    }
    print("");
  }
}
