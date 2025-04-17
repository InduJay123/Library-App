import 'package:workout_planner/models/newspaper_model.dart';
import 'package:workout_planner/models/book_model.dart';

class User {
  final String userId;
  final String fullName;
  final int age;
  final String gender;
  final String address;
  final String description;
  int totalBooksRead = 0;
  int totalBooksHandOvered = 0;

  final List<Book> bookList;
  final List<Newspaper> newspaperList;

  final List<Book> favBookList;
  final List<Newspaper> favNewspaperList;

  User({
    required this.userId,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.address,
    required this.description,
    required this.bookList,
    required this.newspaperList,
    required this.favBookList,
    required this.favNewspaperList
  });

  void addBook(Book book) {
    bookList.add(book);
  }

  void removeBook(Book book) {
    bookList.remove(book);
  }

  void addFavBook(Book book) {
    favBookList.add(book);
  }

  void removeFavBook(Book book) {
    favBookList.remove(book);
  }


  void addNewspaper(Newspaper equipment) {
    newspaperList.add(equipment);
  }

  void removeNewspaper(Newspaper equipment) {
    newspaperList.remove(equipment);
  }

  void addFavNewspaper(Newspaper equipment) {
    favNewspaperList.add(equipment);
  }

  void removeFavNewspaper(Newspaper equipment) {
    favNewspaperList.remove(equipment);
  }

  //method to calculate the total minutes spend
  int calculateTotalMinuitesSpent() {
    int totalMinuitesSpend = 0;

    //loop through the exersicelist and calculate the no of minutes
    for (var exercise in bookList) {
      totalMinuitesSpend += exercise.noOfDays;
     };

    //loop through the equipmentlist and calculate the no of minutes


    return totalMinuitesSpend;
  }

//method to mark as exercise completed
void markExerciseAsCompleted(int exerciseId){
    final exercise = bookList.firstWhere((exercise) => exercise.id == exerciseId);

    exercise.completed = true;

    //remove from the exerciselist
   removeBook(exercise);

  totalBooksRead++;
}
//method to mark an equipment as handover
void markAsHandOvered(int equipmentId){
    final equipment = newspaperList.firstWhere((equipment) => equipment.id == equipmentId);

    equipment.handOver = true;

  //remove from the equipmentlist
  removeNewspaper(equipment);

  totalBooksHandOvered++;
}

//Method to caluculate the total number of cakories burned by the user
double calculateTotalCaloriesBurned(){
    double totalCaloriesBurned = 0;



    //convert totalCaloriesBurned in to value between 0 and 1
    if(totalCaloriesBurned > 0 && totalCaloriesBurned <= 10){
      totalCaloriesBurned = totalCaloriesBurned/10;
    }
    if(totalCaloriesBurned > 10 && totalCaloriesBurned <= 100){
      totalCaloriesBurned = totalCaloriesBurned/100;
    }
    if(totalCaloriesBurned > 100 && totalCaloriesBurned <= 1000){
      totalCaloriesBurned = totalCaloriesBurned/1000;
    }

    return totalCaloriesBurned;
    }

}