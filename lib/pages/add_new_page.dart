import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workout_planner/constant/constant.dart';
import 'package:workout_planner/constant/responsive.dart';
import 'package:workout_planner/data/newspaper_data.dart';
import 'package:workout_planner/data/fantasy_data.dart';
import 'package:workout_planner/data/novel_data.dart';
import 'package:workout_planner/data/science_fiction_data.dart';
import 'package:workout_planner/data/biography_data.dart';
import 'package:workout_planner/data/horror_data.dart';
import 'package:workout_planner/data/drama_data.dart';
import 'package:workout_planner/data/mystery_data.dart';
import 'package:workout_planner/models/newspaper_model.dart';
import 'package:workout_planner/models/book_model.dart';
import 'package:workout_planner/pages/novels_details_page.dart';
import 'package:workout_planner/widgets/add_exercise_card.dart';

import '../data/user_data.dart';
import '../widgets/add_equipment_card.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  //import the user from user data
  final userData = user;
  final novelBookList = NovelBookData().novelBookList;
  final scienceBookList = ScienceBookData().scieneceFictionBookList;
  final fantasyBookList = FantasyBookData().fantasyBookList;
  final horrorBookList = HorrorBookData().horrorBookList;
  final biographyBookList = BiographyBookData().biographyBookList;
  final dramaBookList = DramaBookData().dramaBookList;
  final mysteryBookList = MysteryBookData().mysteryBookList;
  final equipmentList = NewspaperData().newspaperList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello , ${userData.fullName}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: kMainBlackColor
                ),),
                const SizedBox(
                  height: 10,
                ),
                const Text("Let's Add some Books and Newspapers for today!",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: kMainColor
                ),),
                const SizedBox(
                  height: 20,
                ),
                const Text("Novels",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kMainBlackColor
                  ),),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height:MediaQuery.of(context).size.height*0.336,
                  child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: novelBookList.length,
                    itemBuilder: (context, index){
                    Book book = novelBookList[index];
                    return  AddBookCard(
                        bookTitle:book.bookName,
                        bookImageUrl:book.bookimageUrl,

                        noOfDays:book.noOfDays,
                        isAdded: userData.bookList.contains(book),
                        toggleAddBooks: () {
                          setState(() {
                            if(userData.bookList.contains(book)){
                              userData.removeBook(book);
                            }else{
                              userData.addBook(book);
                            }

                        });
                          },
                        isAddedFav: userData.favBookList.contains(book),
                        toggleAddFavBook: () {
                          setState(() {
                                  if(userData.favBookList.contains(book)){
                                      userData.removeFavBook(book);
                                  }else{
                                    userData.addFavBook(book);
                                  }
                          }
                    );
                  },
                );
                    }
                ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Science Fiction",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kMainBlackColor
                  ),),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height:MediaQuery.of(context).size.height*0.336,
                  child:ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: scienceBookList.length,
                      itemBuilder: (context, index){
                        Book book = scienceBookList[index];
                        return  AddBookCard(
                          bookTitle:book.bookName,
                          bookImageUrl:book.bookimageUrl,
                          noOfDays:book.noOfDays,
                          isAdded: userData.bookList.contains(book),
                          toggleAddBooks: () {
                            setState(() {
                              if(userData.bookList.contains(book)){
                                userData.removeBook(book);
                              }else{
                                userData.addBook(book);
                              }

                            });
                          },
                          isAddedFav: userData.favBookList.contains(book),
                          toggleAddFavBook: () {
                            setState(() {
                              if(userData.favBookList.contains(book)){
                                userData.removeFavBook(book);
                              }else{
                                userData.addFavBook(book);
                              }
                            }
                            );
                          },
                        );
                      }
                  ),
                ),
                const SizedBox(height: 10,),
                const Text("Fantasy",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kMainBlackColor
                  ),),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height:MediaQuery.of(context).size.height*0.336,
                  child:ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fantasyBookList.length,
                      itemBuilder: (context, index){
                        Book book = fantasyBookList[index];
                        return  AddBookCard(
                          bookTitle:book.bookName,
                          bookImageUrl:book.bookimageUrl,
                          noOfDays:book.noOfDays,
                          isAdded: userData.bookList.contains(book),
                          toggleAddBooks: () {
                            setState(() {
                              if(userData.bookList.contains(book)){
                                userData.removeBook(book);
                              }else{
                                userData.addBook(book);
                              }

                            });
                          },
                          isAddedFav: userData.favBookList.contains(book),
                          toggleAddFavBook: () {
                            setState(() {
                              if(userData.favBookList.contains(book)){
                                userData.removeFavBook(book);
                              }else{
                                userData.addFavBook(book);
                              }
                            }
                            );
                          },
                        );
                      }
                  ),
                ),
                const Text("Horror",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kMainBlackColor
                  ),),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height:MediaQuery.of(context).size.height*0.336,
                  child:ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: horrorBookList.length,
                      itemBuilder: (context, index){
                        Book book = horrorBookList[index];
                        return  AddBookCard(
                          bookTitle:book.bookName,
                          bookImageUrl:book.bookimageUrl,
                          noOfDays:book.noOfDays,
                          isAdded: userData.bookList.contains(book),
                          toggleAddBooks: () {
                            setState(() {
                              if(userData.bookList.contains(book)){
                                userData.removeBook(book);
                              }else{
                                userData.addBook(book);
                              }

                            });
                          },
                          isAddedFav: userData.favBookList.contains(book),
                          toggleAddFavBook: () {
                            setState(() {
                              if(userData.favBookList.contains(book)){
                                userData.removeFavBook(book);
                              }else{
                                userData.addFavBook(book);
                              }
                            }
                            );
                          },
                        );
                      }
                  ),
                ),
                const Text("Biography",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kMainBlackColor
                  ),),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height:MediaQuery.of(context).size.height*0.336,
                  child:ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: biographyBookList.length,
                      itemBuilder: (context, index){
                        Book book = biographyBookList[index];
                        return  AddBookCard(
                          bookTitle:book.bookName,
                          bookImageUrl:book.bookimageUrl,
                          noOfDays:book.noOfDays,
                          isAdded: userData.bookList.contains(book),
                          toggleAddBooks: () {
                            setState(() {
                              if(userData.bookList.contains(book)){
                                userData.removeBook(book);
                              }else{
                                userData.addBook(book);
                              }

                            });
                          },
                          isAddedFav: userData.favBookList.contains(book),
                          toggleAddFavBook: () {
                            setState(() {
                              if(userData.favBookList.contains(book)){
                                userData.removeFavBook(book);
                              }else{
                                userData.addFavBook(book);
                              }
                            }
                            );
                          },
                        );
                      }
                  ),
                ),
                const Text("Drama",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kMainBlackColor
                  ),),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height:MediaQuery.of(context).size.height*0.336,
                  child:ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dramaBookList.length,
                      itemBuilder: (context, index){
                        Book book = dramaBookList[index];
                        return  AddBookCard(
                          bookTitle:book.bookName,
                          bookImageUrl:book.bookimageUrl,
                          noOfDays:book.noOfDays,
                          isAdded: userData.bookList.contains(book),
                          toggleAddBooks: () {
                            setState(() {
                              if(userData.bookList.contains(book)){
                                userData.removeBook(book);
                              }else{
                                userData.addBook(book);
                              }

                            });
                          },
                          isAddedFav: userData.favBookList.contains(book),
                          toggleAddFavBook: () {
                            setState(() {
                              if(userData.favBookList.contains(book)){
                                userData.removeFavBook(book);
                              }else{
                                userData.addFavBook(book);
                              }
                            }
                            );
                          },
                        );
                      }
                  ),
                ),
                const Text("Mystery",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kMainBlackColor
                  ),),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height:MediaQuery.of(context).size.height*0.336,
                  child:ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mysteryBookList.length,
                      itemBuilder: (context, index){
                        Book book = mysteryBookList[index];
                        return  AddBookCard(
                          bookTitle:book.bookName,
                          bookImageUrl:book.bookimageUrl,
                          noOfDays:book.noOfDays,
                          isAdded: userData.bookList.contains(book),
                          toggleAddBooks: () {
                            setState(() {
                              if(userData.bookList.contains(book)){
                                userData.removeBook(book);
                              }else{
                                userData.addBook(book);
                              }

                            });
                          },
                          isAddedFav: userData.favBookList.contains(book),
                          toggleAddFavBook: () {
                            setState(() {
                              if(userData.favBookList.contains(book)){
                                userData.removeFavBook(book);
                              }else{
                                userData.addFavBook(book);
                              }
                            }
                            );
                          },
                        );
                      }
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                const Text("All Newspapers",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kMainBlackColor
                  ),),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.5,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                      itemCount: equipmentList.length,
                      itemBuilder:(context,index){
                        Newspaper equipment = equipmentList[index];
                        return AddEquipmentCard(
                          equipmentTitle:equipment.newspaperName,
                          equipmentDescription: equipment.newspaperDescription,
                          equipmentImageUrl: equipment.newspaperImageUrl,
                          isAdded: userData.newspaperList.contains(equipment),
                            toggleAddEquipment: (){
                              setState(() {
                                if(userData.newspaperList.contains(equipment)){
                                  userData.removeNewspaper(equipment);
                                }else{
                                  userData.addNewspaper(equipment);
                                }
                              });
                              },
                          isAddedFav: userData.favNewspaperList.contains(equipment),
                            toggleAddFavEquipment: () {
                              setState(() {
                                if(userData.favNewspaperList.contains(equipment)){
                                  userData.removeFavNewspaper(equipment);
                                }else{
                                  userData.addFavNewspaper(equipment);
                                }
                              });
                            },
                        );
                        }
                        ),
                      )
                    ]
                  ),
                )

            ),
          )
        );


  }
}
