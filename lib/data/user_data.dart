import 'package:workout_planner/models/user_model.dart';
import 'package:workout_planner/models/book_model.dart';
import 'package:workout_planner/models/newspaper_model.dart';

User user = User(
    userId: "123456",
    fullName: "Induni",
    age: 21,
    gender: "Female",
    address: "121 MainStreet Galle",
    description: "Fitness enthusiast",
    bookList: [
      // Book(
      //     id: 0,
      //     bookName: "Harry Potter",
      //     bookimageUrl: "assests/books/fantasy/img13.jpg",
      //     noOfDays: 5,
      //     completed: false
      // ),
      // Book(
      //     id: 0,
      //     bookName: "Lord of the Rings",
      //     bookimageUrl: "assests/books/fantasy/img13.jpg",
      //     noOfDays: 6,
      //     completed: false
      // ),
    ],
    newspaperList: [
    //   Newspaper(
    //       id: 0,
    //       newspaperName: "Dumblles",
    //       newspaperDescription: "A pair of dumbells for strength training exercises.",
    //       newspaperImageUrl: "assests/books/fantasy/img13.jpg",
    //       noOfMinuites: 5,
    //       noOfBooksRead: 2,
    //       handOver: false
    //   ),
    //   Newspaper(
    //       id: 0,
    //       newspaperName: "Resistance Bands",
    //       newspaperDescription: "Elastic bands used for resistance exercises.",
    //       newspaperImageUrl: "assests/newspaper/img1.jpeg",
    //       noOfMinuites: 10,
    //       noOfBooksRead: 2,
    //       handOver: false
    //   ),
    ],
    favBookList: [],
    favNewspaperList: [],
);