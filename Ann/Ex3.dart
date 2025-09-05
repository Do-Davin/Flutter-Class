import 'dart:io';
void main(){

  double score;

  stdout.write("Enter your score(0-100): ");
  score = double.parse(stdin.readLineSync()!);
  grade(score);

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
      print("Garde: E");
    }else{
      print("Invalid input");
    }
}