import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workout_planner/constant/constant.dart';
import 'package:workout_planner/data/biography_data.dart';
import 'package:workout_planner/data/drama_data.dart';
import 'package:workout_planner/data/horror_data.dart';
import 'package:workout_planner/data/mystery_data.dart';
import 'package:workout_planner/data/newspaper_data.dart';
import 'package:workout_planner/data/fantasy_data.dart';
import 'package:workout_planner/data/novel_data.dart';
import 'package:workout_planner/data/science_fiction_data.dart';
import 'package:workout_planner/pages/mystery_details_page.dart';
import 'package:workout_planner/pages/newspaper_details_page.dart';
import 'package:workout_planner/pages/book_details_page.dart';
import 'package:workout_planner/pages/novels_details_page.dart';
import 'package:workout_planner/pages/science_fiction_details_page.dart';
import 'package:workout_planner/widgets/book_card.dart';
import 'package:workout_planner/widgets/book_card_2.dart';
import 'package:workout_planner/widgets/progress_card.dart';

import '../constant/responsive.dart';
import '../data/user_data.dart';
import '../services/auth.dart';
import 'biography_details_page.dart';
import 'drama_Details_page.dart';
import 'horror_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userData = user;

  final novelBookList = NovelBookData().novelBookList;
  final scienceBookList = ScienceBookData().scieneceFictionBookList;
  final bookList = FantasyBookData().fantasyBookList;
  final horrorBookList = HorrorBookData().horrorBookList;
  final biographyBookList = BiographyBookData().biographyBookList;
  final dramaBookList = DramaBookData().dramaBookList;
  final mysteryBookList = MysteryBookData().mysteryBookList;
  final newspaperList = NewspaperData().newspaperList;

  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${userData.fullName}",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: kMainBlackColor
                     ),),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: () async {
                        await _auth.signOut();
                      },
                      child: const Icon(Icons.logout,color: kMainDarkBlue,size: 32,),
                    )
                  ]
                ),
                const SizedBox(
                  height: 20,
                ),
                ProgressCard(
                    progressValue: userData.calculateTotalCaloriesBurned(),
                    total: 100
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Today's Books",style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NovelDetailsPage(
                                  bookTitle: "Novels",
                                  bookDescription: "A novel is a long, fictional narrative. The novel in the modern era usually makes use of literary prose style. The development of the prose novel at this time was encourage by innovations in printing, and the introduction of cheaper paper in the 15th century.",
                                  novelBookList: novelBookList
                                ),
                            ),
                        );
                    },
                      child: const BookCard2(
                          title: "Novels",
                          imageUrl: "assests/cover/img9.jpg",
                          description: "see more..."
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewspaperDetailsPage(
                                    newspaperTitle: "Newspaper",
                                    newspaperDescription: "The newspaper carries a great deal of news and information in its pages. It is an important publication that helps people know what is happening around them. Besides news items, experts present their views and opinions on various issues. The general public can also express their views through newspaper columns.",
                                    newspaperList:  newspaperList
                                )
                            )
                        );
                      },
                      child: const BookCard2(
                          title: "Newspaper",
                          imageUrl: "assests/cover/img2.jpg",
                          description: "see more..."
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ScienceFictionDetailsPage(
                               bookTitle: "Science Fiction",
                              bookDescription: "Science fiction is usually futuristic and often presents alternative ways of life and living that are made possible by technological change. Science-fiction novels are similar to fantasy in that they imagine alternative worlds that exist outside the realms of our real world.",
                              scienceFictionBookList: scienceBookList),
                       ),
                        );
                    },
                        child: const BookCard2(
                            title: "Science Fiction",
                            imageUrl: "assests/cover/img3.jpg",
                            description: "see more..."
                        ),
                      ),
                    GestureDetector(
                      onTap:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookDetailsPage(
                              bookTitle: "Fantasy",
                              bookDescription:"Fantasy literature is literature set in an imaginary universe, often but not always without any locations, events, or people from the real world. Magic, the supernatural and magical creatures are common in many of these imaginary worlds. Fantasy literature may be directed at both children and adults.",
                              fantasyBookList: bookList)
                          ),
                        );
                      },
                      child: const BookCard2(
                          title: "Fantasy",
                          imageUrl: "assests/cover/img8.jpg",
                          description: "see more..."
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HorrorDetailsPage(
                              bookTitle: "Horror",
                              bookDescription: "The horror genre has ancient origins, with roots in folklore and religious traditions focusing on death, the afterlife, evil, the demonic and the principle of the thing embodied in the person. These manifested in stories of beings such as demons, witches, vampires, werewolves and ghosts.",
                              horrorBookList: horrorBookList),
                          ),
                        );
                      },
                      child: const BookCard2(
                          title: "Horror",
                          imageUrl: "assests/cover/img5.jpg",
                          description: "see more..."
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BiographyDetailsPage(
                              bookTitle: "Biography",
                              bookDescription:"A biography is simply the story of a real person's life. It could be about a person who is still alive, someone who lived centuries ago, someone who is globally famous, an unsung hero forgotten by history, or even a unique group of people.",
                              biographyBookList: biographyBookList)
                          ),
                        );
                      },
                      child: const BookCard2(
                          title: "Biography",
                          imageUrl: "assests/cover/img6.jpg",
                          description: "see more..."
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DramaDetailsPage(
                              bookTitle: "Drama",
                              bookDescription: "Drama is written as dialogue along with stage directions, so the actors know exactly what to say and do while they are on stage. Within the dramatic mode, there are two different dramatic styles: prose and verse.",
                               daramaBookList: dramaBookList,),
                          ),
                        );
                      },
                      child: const BookCard2(
                          title: "Drama",
                          imageUrl: "assests/cover/img7.jpg",
                          description: "see more..."
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MysteryDetailsPage(
                              bookTitle: "Mystery",
                              bookDescription:"The story usually follows a protagonist, or detective, who tries to solve the crime and reveal the culprit or villain. The genre is known to follow a set standard of rules, such as creating a realistic and suspenseful plot and revealing the mystery at the very last minute.",
                              mysteryBookList: mysteryBookList)
                          ),
                        );
                      },
                      child: const BookCard2(
                          title: "Mystery",
                          imageUrl: "assests/cover/img4.jpg",
                          description: "see more..."
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
