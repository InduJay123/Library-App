import 'package:flutter/material.dart';
import 'package:workout_planner/models/newspaper_model.dart';
import 'package:workout_planner/models/book_model.dart';

import '../constant/constant.dart';
import '../constant/responsive.dart';
import '../data/user_data.dart';
import '../widgets/profile_card.dart';
import '../widgets/progress_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
               Text("${userData.fullName}",
                  style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: kMainBlackColor
              ),),
              const SizedBox(
                height: 20
              ),
              ProgressCard(
                 progressValue: userData.calculateTotalCaloriesBurned(),
                  total: 100
              ),
              const SizedBox(
                height: 20,
              ),
             const Text("Today's Activity",style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kCardBgColor
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding*1.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Minuites Spend:${userData.calculateTotalMinuitesSpent().toString()}",
                        style: const TextStyle(
                          color: kMainDarkBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Total Books Read:${userData.totalBooksRead.toString()}",
                        style: const TextStyle(
                            color: kMainBlackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ),),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Total Books Handovered: ${userData.totalBooksHandOvered.toString()}",
                        style: const TextStyle(
                            color: kMainBlackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ),),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            const Text("Your Books",
              style: TextStyle(
                  color: kMainDarkBlue,
                  fontSize: 17,
                  fontWeight: FontWeight.w900
              ),),
            const SizedBox(
              height: 20,
            ),

              //Book list of user
              ListView.builder(
                itemCount: userData.bookList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    Book userExercise = userData.bookList[index];
                    return ProfileCard(
                        taskName: userExercise.bookName,
                        taskImageUrl: userExercise.bookimageUrl,
                        marksAsDone: (){
                          setState(() {
                            userData.markExerciseAsCompleted(userExercise.id);
                          });
                        },
                    );
                  }
                 // ProfileCard();
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Your Newspaper",
                style: TextStyle(
                    color: kMainDarkBlue,
                    fontSize: 17,
                    fontWeight: FontWeight.w900
                ),),
              const SizedBox(
                height: 20,
              ),

              //Bookelist of user
              ListView.builder(
                  itemCount: userData.newspaperList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    Newspaper userBook= userData.newspaperList[index];
                    return ProfileCard(
                      taskName: userBook.newspaperName,
                      taskImageUrl: userBook.newspaperImageUrl,
                      marksAsDone: (){
                        setState(() {
                          userData.markAsHandOvered(userBook.id);
                        });
                      },
                    );
                  }
                // ProfileCard();
              )
          ]
        ),
      ),
    ),
    ),
    );
  }
}
