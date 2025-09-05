import 'dart:io';
void main(){

  try {
    do {
      stdout.write("Enter your score(0-100): ");
      double score = double.parse(stdin.readLineSync()!);
      grade(score);
    } while (true);
  } catch (e) {
    print("Invalid input. Please input a valid number only.");
  }

}
void grade(double score){
    if(score >= 90 && score <= 100){
      print("Grade: A");
    }else if(score >= 80 && score <= 89){
      print("Grade: B");
    }else if(score >= 70 && score <= 79){
      print("Grade: C");
    }else if(score >= 60 && score <= 69){
      print("Grade: D");
    }else if(score >= 50 && score <= 59){
      print("Grade: E");
    }else if(score >= 0 && score <= 49){
      print("Grade: F");
    }else{
      print("Invalid input");
    }
}