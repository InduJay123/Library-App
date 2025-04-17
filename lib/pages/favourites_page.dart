import 'package:flutter/material.dart';
import 'package:workout_planner/constant/responsive.dart';
import 'package:workout_planner/models/book_model.dart';
import 'package:workout_planner/models/newspaper_model.dart';
import '../constant/constant.dart';
import '../data/user_data.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key,});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final userData = user;

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
                    ),
                  ),
                 const SizedBox(
                  height: 10,
                ),
                const Text("Here are all your favourite Books",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: kMainColor
                  ),),
                const SizedBox(
                  height: 20,
                ),
                  
                  //Exercise Grid View

                  GridView.builder(
                    shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: kDefaultPadding,
                        mainAxisSpacing: kDefaultPadding,
                        childAspectRatio: 8/12
                  ),
                      itemCount: userData.favBookList.length,
                      itemBuilder: (context,index){
                          Book favExercise = userData.favBookList[index];
                          return Card(
                            color: kCardBgColor,
                            child: Padding(
                              padding: const EdgeInsets.all(kDefaultPadding),
                              child: Column(
                                children: [
                                  Text(favExercise.bookName,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: kMainBlackColor
                                  ),),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset(
                                    favExercise.bookimageUrl,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text("${favExercise.noOfDays.toString()} Days",
                                  style: const TextStyle(
                                    fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: kSubTitleColor
                                  ),),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Icon(
                                    Icons.favorite,
                                    color: kMainPinkColor,
                                  )
                                ],
                              ),
                            )
                          );
                      }
                  ),

                  //Equipment Grid View
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Here are all your favourite Newspapers",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: kMainColor
                    ),),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: kDefaultPadding,
                          mainAxisSpacing: kDefaultPadding,
                          childAspectRatio:7/11
                      ),
                      itemCount: userData.favNewspaperList.length,
                      itemBuilder: (context,index){
                        Newspaper favEquipment = userData.favNewspaperList[index];
                        return Card(
                            color: kCardBgColor,
                            child: Padding(
                              padding: const EdgeInsets.all(kDefaultPadding),
                              child: Column(
                                children: [
                                  Text(favEquipment.newspaperName,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: kMainBlackColor
                                    ),),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Image.asset(
                                    favEquipment.newspaperImageUrl,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text("favEquipment.equipmentDescription",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: kSubTitleColor
                                    ),
                                  textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Icon(
                                      Icons.favorite,
                                      color: kMainPinkColor,
                                  )
                                ],
                              ),
                            )
                        );
                      }
                  )

                ],
              ),
            ),
          ),
        ),
    );
  }
}
